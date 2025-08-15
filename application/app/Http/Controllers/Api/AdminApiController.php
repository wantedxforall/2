<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Transaction;
use App\Models\User;
use App\Services\ServiceCreditChecker;
use Illuminate\Http\Request;

class AdminApiController extends Controller
{
    public function handleRequest(Request $request)
    {
        \Log::info('📩 Incoming Request', [
            'method'  => $request->method(),
            'url'     => $request->fullUrl(),
            'ip'      => $request->ip(),
            'headers' => $request->headers->all(),
            'query'   => $request->query(),
            'body'    => $request->all(),
        ]);

        if ($request->query('action') === 'addPayment') {
            return $this->addPayment($request);
        }

        return response()->json([
            'status' => 'fail',
            'error' => 'invalid_action'
        ]);
    }

    public function addPayment(Request $request)
    {
        $data = $request->query();

        $validator = validator($data, [
            'key' => 'required',
            'amount' => 'required|numeric|gt:0',
            'details' => 'nullable|string|max:255',
            'affiliate_commission' => 'nullable',
            'username' => 'required_without:id',
            'id' => 'nullable|integer'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'fail',
                'error' => $validator->errors()->first()
            ]);
        }

        $admin = Admin::where('api_token', $data['key'])->first();
        if (!$admin) {
            return response()->json([
                'status' => 'fail',
                'error' => 'bad_key'
            ]);
        }

        $userQuery = User::query();
        if (!empty($data['username'])) {
            $userQuery->where('username', $data['username']);
        }
        if (!empty($data['id'])) {
            $userQuery->orWhere('id', $data['id']);
        }

        $user = $userQuery->first();
        if (!$user) {
            return response()->json([
                'status' => 'fail',
                'error' => 'bad_username'
            ]);
        }

        $user->balance += $data['amount'];
        $user->save();

        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->amount = $data['amount'];
        $transaction->charge = 0;
        $transaction->post_balance = $user->balance;
        $transaction->trx_type = '+';
        $transaction->trx = getTrx(); // تأكد من أن هذه الدالة معرفة
        $transaction->details = $data['details'] ?? 'API Topup';
        $transaction->remark = 'balance_add';
        $transaction->save();

        ServiceCreditChecker::run($user); // تأكد أن هذه الخدمة معرفة

        return response()->json([
            'status' => 'success',
            'user_id' => $user->id,
            'new_balance' => $user->balance,
        ]);
    }
}
