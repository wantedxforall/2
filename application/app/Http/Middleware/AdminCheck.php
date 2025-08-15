<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AdminCheck
{
    public function handle(Request $request, Closure $next)
    {
        if (auth('admin')->check()) {
            $admin = auth('admin')->user();
            if ($admin->status && $admin->tv) {
                return $next($request);
            }
            return to_route('admin.authorization');
        }
        abort(403);
    }
}