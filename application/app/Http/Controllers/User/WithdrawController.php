<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Withdraw;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WithdrawController extends Controller
{
    // لا تعرّف $activeTemplate هنا، الكلاس الأب يوفّرها كـ public

    public function index(Request $request)
    {
        $user = $request->user();

        $withdraws = Withdraw::where('user_id', $user->id)
            ->latest()
            ->paginate(15);

        // صفحة لعرض السجل
        return view($this->activeTemplate . 'user.withdraw.index', compact('withdraws'));
    }

    public function phoneForm()
{
    $pageTitle  = 'Withdraw via Phone';
    $user       = auth()->user();

    $withdraws  = Withdraw::where('user_id', $user->id)
                    ->where('method', 'phone')
                    ->latest()
                    ->paginate(15);

    return view($this->activeTemplate . 'user.withdraw.phone', compact('pageTitle','withdraws'));
}

public function usdtForm()
{
    $pageTitle  = 'Withdraw via USDT';
    $user       = auth()->user();

    $withdraws  = Withdraw::where('user_id', $user->id)
                    ->where('method', 'usdt')
                    ->latest()
                    ->paginate(15);

    return view($this->activeTemplate . 'user.withdraw.usdt', compact('pageTitle','withdraws'));
}

    public function create()
    {
        $pageTitle = 'Withdraw Credits';
        $user = auth()->user();

        $withdraws = Withdraw::with('user')
            ->where('user_id', $user->id)
            ->latest()
            ->get();

        return view($this->activeTemplate . 'user.withdraw.create', compact('pageTitle', 'withdraws'));
    }

    public function store(Request $request)
{
    // تأمين method لو مفقود (نعتبرها phone من صفحة الهاتف)
    if (!$request->filled('method')) {
        $request->merge(['method' => 'phone']);
    }

    // نسمح فقط بالقيم المعروفة
    $method = $request->input('method');
    if (!in_array($method, ['phone','usdt'], true)) {
        $method = 'phone';
        $request->merge(['method' => $method]);
    }

    // اجلب الحدود الدنيا من الإعدادات (افتراضي 0 لو غير مضبوط)
    $minPhone = (float) (optional(gs())->withdraw_min_phone ?? 0);
    $minUsdt  = (float) (optional(gs())->withdraw_min_usdt  ?? 0);
    $dynamicMin = $method === 'usdt' ? $minUsdt : $minPhone;

    // التحقق الأساسي
    $request->validate([
        'credits'    => ['required','numeric','min:0.01'], // قيمة موجبة
        'phone'      => $method === 'phone' ? ['required','numeric'] : ['nullable'],
        'binance_id' => $method === 'usdt'  ? ['required','string']  : ['nullable'],
        'method'     => ['required','string','in:phone,usdt'],
    ]);

    // تحقّق الحد الأدنى حسب الطريقة
    if ((float)$request->credits < $dynamicMin) {
        return back()
            ->withInput()
            ->withErrors([
                'credits' => __(
                    'The minimum withdraw amount for :type is :min.',
                    [
                        'type' => strtoupper($method),
                        'min'  => number_format($dynamicMin, 2, '.', '')
                    ]
                ),
            ]);
    }

    $user = auth()->user();

    return \DB::transaction(function () use ($request, $user, $method) {

        $user->refresh();

        if ($user->credits < $request->credits) {
            return back()->withErrors(['credits' => __('Insufficient credits')])->withInput();
        }

        // اختر سعر الصرف حسب الطريقة
        // إن كان عندك إعدادات منفصلة (withdraw_rate_phone / withdraw_rate_usdt) استخدمها
        $rate = $method === 'phone'
            ? (optional(gs())->withdraw_rate_phone ?? optional(gs())->withdraw_rate ?? 1)
            : (optional(gs())->withdraw_rate_usdt  ?? optional(gs())->withdraw_rate ?? 1);

        $withdraw = \App\Models\Withdraw::create([
            'user_id'    => $user->id,
            'credits'    => $request->credits,
            'phone'      => $request->phone,
            'binance_id' => $request->binance_id,
            'method'     => $method,             // phone | usdt
            'rate'       => (float) $rate,       // خزّنا السعر الصحيح
            'status'     => 0,                   // pending
        ]);

        // الخصم مرة واحدة
        $user->credits -= $request->credits;
        $user->save();

        $notify[] = ['success', __('Withdraw request submitted')];

        // رجوع لصفحة الطريقة نفسها
        return redirect()
            ->route('user.withdraw.' . ($method === 'phone' ? 'phone' : 'usdt'))
            ->withNotify($notify);
    });
}


    public function cancel(Request $request)
{
    $request->validate([
        'id' => ['required', 'integer'],
    ]);

    $user = auth()->user();

    return DB::transaction(function () use ($request, $user) {
        $withdraw = Withdraw::where('id', $request->id)
            ->where('user_id', $user->id)
            ->whereIn('status', [0, '0', 'pending'])
            ->firstOrFail();

        // رجّع الرصيد
        $user->credits = $user->credits + (float) $withdraw->credits;
        $user->save();

        // ✅ ثبّت المصدر هنا دائمًا
        $withdraw->status       = 2;         // cancelled
        $withdraw->cancelled_by = 'user';    // ← مهم: خارج أي شرط
        if (method_exists($withdraw, 'isFillable') && $withdraw->isFillable('cancelled_at')) {
            $withdraw->cancelled_at = now();
        }
        $withdraw->save();

        $notify[] = ['success', __('Withdraw request canceled')];
        return back()->withNotify($notify);
    });
}

}
