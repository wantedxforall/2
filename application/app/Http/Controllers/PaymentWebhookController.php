<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PaymentWebhookController extends Controller
{
    public function confirm(Request $request)
    {
        $secret    = config('services.payment_webhook.secret', env('PAYMENT_WEBHOOK_SECRET'));
        $signature = $request->header('X-Signature');
        $payload   = $request->getContent();

        $expectedSignature = hash_hmac('sha256', $payload, $secret);

        if (!$signature || !hash_equals($expectedSignature, $signature)) {
            Log::warning('Payment webhook signature mismatch', [
                'signature' => $signature,
            ]);

            return response()->json(['error' => 'invalid signature'], 403);
        }

        Log::info('Payment webhook received', [
            'payload' => $payload,
        ]);

        return response()->json(['received' => true]);
    }
}