<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AuthorizationController extends Controller
{
    /**
     * عرض صفحة التحقق الثنائي (2FA) أو صفحة الحظر.
     *
     * @return \Illuminate\View\View|\Illuminate\Http\RedirectResponse
     */
    public function authorizeForm()
    {
        $admin = auth('admin')->user();

        if (!$admin->status) {
            // حالة الحظر
            $pageTitle = 'Banned';
            $type = 'ban';
        } elseif (!$admin->tv) {
            // لم يتم التحقق من 2FA بعد
            $pageTitle = '2FA Verification';
            $type = '2fa';
        } else {
            // تم التحقق مسبقًا
            return redirect()->route('admin.dashboard');
        }

        return view("admin.auth.authorization.$type", compact('admin', 'pageTitle'));
    }

    /**
     * التحقق من كود المصادقة الثنائية (2FA).
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function g2faVerification(Request $request)
    {
        $admin = auth('admin')->user();

        $request->validate([
            'code' => 'required|string',
        ]);

        if (verifyG2fa($admin, $request->code)) {
            $admin->tv = 1;
            $admin->save();

            return redirect()
                ->route('admin.dashboard')
                ->withNotify([
                    ['success', 'Verification successful'],
                ]);
        }

        return back()->withNotify([
            ['error', 'Wrong verification code'],
        ]);
    }
}
