<?php

namespace App\Http\Controllers;

use App\Notifications\NewWithdrawRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;

class WithdrawController extends Controller
{
    /**
     * Handle incoming withdraw requests.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $withdraw = $request->all();

        Notification::route('mail', gs()->withdraw_notify_email)
            ->notify(new NewWithdrawRequest($withdraw));

        return response()->json(['message' => 'withdraw request submitted']);
    }
}