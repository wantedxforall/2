<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Withdraw;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class WithdrawController extends Controller
{
    
/**
     * عرض قائمة طلبات السحب.
     */
    public function index(Request $request)
{
    $pageTitle    = 'Withdraw Requests';
    $emptyMessage = 'No withdraw request found';
    $general      = gs(); // لو قالبك يحتاجه

    // قراءة باراميترات الفلترة/الفرز
    $method = $request->string('method')->lower()->value(); // phone | usdt | ""
    $status = $request->string('status')->lower()->value(); // pending | approved | rejected | not_completed | ""
    $q      = trim($request->get('q', ''));                 // search
    $sort   = $request->get('sort', 'latest');              // latest | method_asc | method_desc | amount_asc | amount_desc

    // الاستعلام الأساسي
    $base = Withdraw::query()->with('user');

    // فلترة بالmethod (مع التعامل مع السجلات القديمة التي method فيها null)
    if ($method === 'phone') {
        $base->where(function ($qq) {
            $qq->where('method', 'phone')
               ->orWhere(function ($qq2) {
                   $qq2->whereNull('method')->whereNotNull('phone');
               });
        });
    } elseif ($method === 'usdt') {
        $base->where(function ($qq) {
            $qq->where('method', 'usdt')
               ->orWhere(function ($qq2) {
                   $qq2->whereNull('method')->whereNotNull('binance_id');
               });
        });
    }

    // فلترة بالحالة
    if ($status === 'pending') {
        $base->where(function ($qq) {
            $qq->where('status', 0)
               ->orWhereIn('status', ['0', 'pending', 'Pending', 'PENDING']);
        });
    } elseif ($status === 'approved') {
        $base->where(function ($qq) {
            $qq->where('status', 1)
               ->orWhereIn('status', ['1', 'approved', 'Approved', 'APPROVED']);
        });
    } elseif ($status === 'rejected') {
        $base->where(function ($qq) {
            $qq->where('status', 2)
               ->orWhereIn('status', ['2','rejected','Rejected','REJECTED','cancelled','Cancelled','CANCELLED','canceled','Canceled','CANCELED']);
        });
    } elseif ($status === 'not_completed') {
        // أي شيء ليس approved
        $base->where(function ($qq) {
            $qq->where('status', '!=', 1)
               ->orWhereIn('status', ['0','pending','Pending','PENDING','2','rejected','Rejected','REJECTED','cancelled','Cancelled','CANCELLED','canceled','Canceled','CANCELED']);
        });
    }

    // البحث بالهاتف أو Binance ID
    if ($q !== '') {
        $base->where(function ($qq) use ($q) {
            $qq->where('phone', 'like', "%{$q}%")
               ->orWhere('binance_id', 'like', "%{$q}%");
        });
    }

    // الفرز
    if ($sort === 'method_asc') {
        $base->orderByRaw("COALESCE(method, CASE WHEN binance_id IS NOT NULL THEN 'usdt' WHEN phone IS NOT NULL THEN 'phone' ELSE '' END) ASC");
    } elseif ($sort === 'method_desc') {
        $base->orderByRaw("COALESCE(method, CASE WHEN binance_id IS NOT NULL THEN 'usdt' WHEN phone IS NOT NULL THEN 'phone' ELSE '' END) DESC");
    } elseif ($sort === 'amount_asc') {
        $base->orderBy('credits', 'asc');
    } elseif ($sort === 'amount_desc') {
        $base->orderBy('credits', 'desc');
    } else {
        $base->latest(); // latest
    }

    $withdraws = $base->paginate(getPaginate())->withQueryString();

    // عدّادات للفلاتر (كلها بدون فلتر البحث حتى تكون شاملة)
    $countBase = Withdraw::query();

    $counts = [
        'phone' => (clone $countBase)->where(function ($qq) {
            $qq->where('method', 'phone')
               ->orWhere(function ($qq2) {
                   $qq2->whereNull('method')->whereNotNull('phone');
               });
        })->count(),

        'usdt'  => (clone $countBase)->where(function ($qq) {
            $qq->where('method', 'usdt')
               ->orWhere(function ($qq2) {
                   $qq2->whereNull('method')->whereNotNull('binance_id');
               });
        })->count(),

        'pending' => (clone $countBase)->where(function ($qq) {
            $qq->where('status', 0)
               ->orWhereIn('status', ['0','pending','Pending','PENDING']);
        })->count(),

        'approved' => (clone $countBase)->where(function ($qq) {
            $qq->where('status', 1)
               ->orWhereIn('status', ['1','approved','Approved','APPROVED']);
        })->count(),

        'not_completed' => (clone $countBase)->where(function ($qq) {
            $qq->where('status', '!=', 1)
               ->orWhereIn('status', ['0','pending','Pending','PENDING','2','rejected','Rejected','REJECTED','cancelled','Cancelled','CANCELLED','canceled','Canceled','CANCELED']);
        })->count(),
    ];

    return view('admin.withdraw.index', compact(
        'pageTitle',
        'emptyMessage',
        'withdraws',
        'counts',
        'general'
    ));
}

    /**
     * اعتماد (approve) طلب السحب.
     * الحالة: 0 -> 1
     * لا يخصم هنا لأن الخصم تم عند إنشاء الطلب.
     */
    public function approve($id)
    {
        DB::transaction(function () use ($id) {
            $withdraw = Withdraw::where('id', $id)
                ->lockForUpdate()
                ->with('user')
                ->firstOrFail();

            // تحقق إذا تمت معالجته سابقًا
            if (in_array((string)$withdraw->status, ['1','approved','Approved','2','rejected','cancelled','Canceled','Cancelled'], true)) {
                return;
            }

            $withdraw->status = 1; // approved
            if ($this->modelHasAttribute($withdraw, 'approved_at')) {
                $withdraw->approved_at = now();
            }
            if ($this->modelHasAttribute($withdraw, 'trx') && empty($withdraw->trx)) {
                $withdraw->trx = (function_exists('getTrx') ? getTrx() : Str::upper(Str::random(12)));
            }
            $withdraw->save();
        });

        $notify[] = ['success', 'Withdrawal request approved successfully'];
        return back()->withNotify($notify);
    }

    /**
     * إلغاء/رفض طلب السحب.
     * الحالة: 0 -> 2
     * يعيد الرصيد لأن الخصم كان وقت إنشاء الطلب.
     */
    public function cancel($id)
{
    DB::transaction(function () use ($id) {
        $withdraw = Withdraw::where('id', $id)->lockForUpdate()->with('user')->firstOrFail();

        if (in_array((string)$withdraw->status, ['1','approved','Approved','2','rejected','cancelled','Canceled','Cancelled'], true)) {
            return;
        }

        $user         = $withdraw->user;
        $balanceField = $this->detectBalanceField($user);

        // رجّع الرصيد
        $user->{$balanceField} = (float) ($user->{$balanceField} ?? 0) + (float) $withdraw->credits;
        $user->save();

        $trx = function_exists('getTrx') ? getTrx() : Str::upper(Str::random(12));

        $transaction = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $withdraw->credits;
        $transaction->post_balance = $user->{$balanceField};
        $transaction->trx_type     = '+';
        $transaction->trx          = $trx;
        $transaction->details      = 'Withdraw cancelled (refund)';
        $transaction->remark       = 'withdraw_cancelled';
        $transaction->save();

        // ✅ ثبّت المصدر هنا دائمًا
        $withdraw->status       = 2;           // cancelled
        $withdraw->cancelled_by = 'admin';     // ← مهم: خارج أي شرط
        if ($this->modelHasAttribute($withdraw, 'cancelled_at')) {
            $withdraw->cancelled_at = now();
        }
        if ($this->modelHasAttribute($withdraw, 'trx') && empty($withdraw->trx)) {
            $withdraw->trx = $trx;
        }
        $withdraw->save();
    });

    $notify[] = ['success', 'Withdrawal request cancelled successfully'];
    return back()->withNotify($notify);
}


    /**
     * reject == cancel
     */
    public function reject($id)
    {
        return $this->cancel($id);
    }

    /**
     * يحدد عمود الرصيد (credits أو balance).
     */
    private function detectBalanceField(User $user): string
    {
        $attrs = $user->getAttributes();
        return array_key_exists('credits', $attrs) ? 'credits' : 'balance';
    }

    /**
     * التحقق من وجود العمود في الموديل.
     */
    private function modelHasAttribute($model, string $key): bool
    {
        return array_key_exists($key, $model->getAttributes()) || $model->isFillable($key);
    }
}
