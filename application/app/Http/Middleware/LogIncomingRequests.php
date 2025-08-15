<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class LogIncomingRequests
{
    public function handle(Request $request, Closure $next)
    {
        $logData = [
            'method'  => $request->method(),
            'url'     => $request->fullUrl(),
            'ip'      => $request->ip(),
            'headers' => $request->headers->all(),
            'query'   => $request->query(),
            'body'    => $request->all(),
        ];

        Log::channel('daily')->info('📩 Incoming Request', $logData);

        return $next($request);
    }
}