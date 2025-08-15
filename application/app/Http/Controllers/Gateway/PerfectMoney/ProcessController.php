<?php

namespace App\Http\Controllers\Gateway\PerfectMoney;

use App\Models\Deposit;
use App\Http\Controllers\Gateway\PaymentController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProcessController extends Controller
{

    /*
     * Perfect Money Gateway
     */
    public static function process($deposit)
    {
        $basic = gs();

        $gateway_currency = $deposit->gatewayCurrency();

        $perfectAcc = json_decode($gateway_currency->gateway_parameter);

        $val['PAYEE_ACCOUNT'] = trim($perfectAcc->wallet_id);
        $val['PAYEE_NAME'] = $basic->site_name;
        $val['PAYMENT_ID'] = "$deposit->trx";
        $val['PAYMENT_AMOUNT'] = round($deposit->final_amo,2);
        $val['PAYMENT_UNITS'] = "$deposit->method_currency";

        $val['STATUS_URL'] = route('ipn.'.$deposit->gateway->alias);
        $val['PAYMENT_URL'] = route(gatewayRedirectUrl(true));
        $val['PAYMENT_URL_METHOD'] = 'POST';
        $val['NOPAYMENT_URL'] = route(gatewayRedirectUrl());
        $val['NOPAYMENT_URL_METHOD'] = 'POST';
        $val['SUGGESTED_MEMO'] = auth()->user()->username;
        $val['BAGGAGE_FIELDS'] = 'IDENT';


        $send['val'] = $val;
        $send['view'] = 'user.payment.redirect';
        $send['method'] = 'post';
        $send['url'] = 'https://perfectmoney.is/api/step1.asp';

        return json_encode($send);
    }
    public function ipn(Request $request)
    {
        $request->validate([
            'PAYMENT_ID' => 'required|string',
            'PAYEE_ACCOUNT' => 'required|string',
            'PAYMENT_AMOUNT' => 'required',
            'PAYMENT_UNITS' => 'required|string',
            'PAYMENT_BATCH_NUM' => 'required|string',
            'PAYER_ACCOUNT' => 'required|string',
            'TIMESTAMPGMT' => 'required',
            'V2_HASH' => 'required|string',
        ]);

        $deposit = Deposit::where('trx', $request->input('PAYMENT_ID'))->orderBy('id', 'DESC')->first();
        $pmAcc = json_decode($deposit->gatewayCurrency()->gateway_parameter);
        $passphrase = strtoupper(md5($pmAcc->passphrase));

        define('ALTERNATE_PHRASE_HASH', $passphrase);
        define('PATH_TO_LOG', '/somewhere/out/of/document_root/');
        $string =
            $request->input('PAYMENT_ID') . ':' . $request->input('PAYEE_ACCOUNT') . ':' .
            $request->input('PAYMENT_AMOUNT') . ':' . $request->input('PAYMENT_UNITS') . ':' .
            $request->input('PAYMENT_BATCH_NUM') . ':' .
            $request->input('PAYER_ACCOUNT') . ':' . ALTERNATE_PHRASE_HASH . ':' .
            $request->input('TIMESTAMPGMT');

        $hash = strtoupper(md5($string));
        $hash2 = $request->input('V2_HASH');

        if ($hash == $hash2) {

            $details = $request->all();
            $deposit->detail = $details;
            $deposit->save();

            $amo = $request->input('PAYMENT_AMOUNT');
            $unit = $request->input('PAYMENT_UNITS');
            $track = $request->input('PAYMENT_ID');
            if ($request->input('PAYEE_ACCOUNT') == $pmAcc->wallet_id && $unit == $deposit->method_currency && $amo == round($deposit->final_amo,2) && $deposit->status == '0') {
                //Update User Data
                PaymentController::userDataUpdate($deposit);
            }
        }
    }
}
