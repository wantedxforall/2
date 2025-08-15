<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class ApiSettingController extends Controller
{
    public function index()
    {
        $pageTitle = 'API Settings';
        $admin = auth('admin')->user();
        return view('admin.setting.api', compact('pageTitle', 'admin'));
    }

    public function generate(Request $request)
    {
        $admin = auth('admin')->user();
        $admin->api_token = Str::random(60);
        $admin->save();

        $notify[] = ['success', 'API key generated successfully'];
        return back()->withNotify($notify);
    }
}