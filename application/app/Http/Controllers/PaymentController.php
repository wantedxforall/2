<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class PaymentController extends Controller
{
    public function confirmTransfer(Request $request)
    {
        $request->validate([
            'phone' => 'required|regex:/^(92|94)\d{7}$/',
            'amount' => 'required|numeric|min:1',
        ]);

        $username = auth()->user()->username ?? $request->user_name ?? 'guest';
        $lang = app()->getLocale();

        try {
            $apiUrl  = config('services.libyana.api_url');
            $storeId = config('services.libyana.store_id');

            $response = Http::get($apiUrl, [
                'phone'     => $request->phone,
                'amount'    => $request->amount,
                'user_name' => $username,
                'store_id'  => $storeId,
                'lang'      => $lang,
            ]);

        $data = $response->json();
        } catch (\Throwable $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'فشل الاتصال بخادم الدفع.',
            ], 500);
        }

        if (isset($data['message']) && str_contains($data['message'], 'Success')) {
            return response()->json([
                'status' => 'success',
                'message' => '✅ تم تأكيد التحويل بنجاح.'
            ]);
        }

        return response()->json([
            'status' => 'error',
            'message' => $data['message'] ?? 'فشل في تأكيد التحويل.'
        ]);
    }
}
