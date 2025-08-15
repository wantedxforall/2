<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Lib\GoogleAuthenticator;
use Illuminate\Http\Request;

class TwoFactorController extends Controller
{
    public function show2faForm()
    {
        $general = gs();
        $ga = new GoogleAuthenticator();
        $admin = auth('admin')->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($admin->username . '@' . $general->site_name, $secret);
        $pageTitle = '2FA Setting';
        return view('admin.twofactor', compact('pageTitle', 'secret', 'qrCodeUrl'));
    }

    public function enable2fa(Request $request)
    {
        $admin = auth('admin')->user();
        $request->validate([
            'key' => 'required',
            'code' => 'required',
        ]);
        $response = verifyG2fa($admin, $request->code, $request->key);
        if ($response) {
            $admin->tsc = $request->key;
            $admin->ts = 1;
            $admin->save();
            $notify[] = ['success', 'Google authenticator activated successfully'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }

    public function disable2fa(Request $request)
    {
        $admin = auth('admin')->user();
        $request->validate([
            'code' => 'required',
        ]);
        $response = verifyG2fa($admin, $request->code);
        if ($response) {
            $admin->tsc = null;
            $admin->ts = 0;
            $admin->save();
            $notify[] = ['success', 'Two factor authenticator deactivated successfully'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }
}