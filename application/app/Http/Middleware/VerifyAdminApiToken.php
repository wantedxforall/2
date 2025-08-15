<?php

namespace App\Http\Middleware;

use App\Models\Admin;
use Closure;
use Illuminate\Http\Request;

class VerifyAdminApiToken
{
    public function handle(Request $request, Closure $next)
    {
        $authHeader = $request->header('Authorization');
        if (!$authHeader || !preg_match('/Bearer\s+(.*)/', $authHeader, $matches)) {
            return response()->json(['status' => 'fail', 'error' => 'unauthenticated'], 401);
        }

        $token = $matches[1];
        $admin = Admin::where('api_token', $token)->first();
        if (!$admin || !hash_equals($admin->api_token, $token)) {
            return response()->json(['status' => 'fail', 'error' => 'unauthenticated'], 401);
        }

        $request->attributes->set('admin', $admin);

        return $next($request);
    }
}