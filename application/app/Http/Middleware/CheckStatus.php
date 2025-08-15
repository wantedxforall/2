<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
use Illuminate\Http\Request;
use function gs;

class CheckStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::check()) {
            $user    = auth()->user();
            $general = gs();
            $emailOk  = $general->ev ? $user->ev : true;
            $mobileOk = $general->sv ? $user->sv : true;

            if ($user->status && $emailOk && $mobileOk && $user->tv) {
                return $next($request);
            }

            if ($request->is('api/*')) {
                $notify[] = 'You need to verify your account first.';
                return response()->json([
                    'remark' => 'unverified',
                    'status' => 'error',
                    'message' => ['error' => $notify],
                    'data' => [
                        'is_ban'          => $user->status,
                        'email_verified'  => $emailOk,
                        'mobile_verified' => $mobileOk,
                        'twofa_verified'  => $user->tv,
                    ],
                ]);
            }

            return to_route('user.authorization');
        }
        abort(403);
    }
}
