<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Lcobucci\JWT\Configuration;
use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Signer\Key\InMemory;
use Lcobucci\JWT\Validation\Constraint\SignedWith;
use Lcobucci\JWT\Validation\Constraint\ValidAt;
use Lcobucci\Clock\SystemClock;
use RuntimeException;
use Throwable;

class WebSocketAuthenticate
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            return $next($request);
        }

        $authHeader = $request->header('Authorization');
        if ($authHeader && preg_match('/Bearer\s+(.*)/', $authHeader, $matches)) {
            $jwt = $matches[1];
            try {
                $jwtSecret = env('JWT_SECRET');

                if (empty($jwtSecret)) {
                    Log::error('JWT_SECRET environment variable is not set');
                    throw new RuntimeException('JWT_SECRET environment variable is not set');
                }

                $config = Configuration::forSymmetricSigner(
                    new Sha256(),
                    InMemory::plainText($jwtSecret)
                );

                $token = $config->parser()->parse($jwt);
                $constraints = [
                    new SignedWith($config->signer(), $config->verificationKey()),
                    new ValidAt(SystemClock::fromUTC())
                ];

                if ($config->validator()->validate($token, ...$constraints)) {
                    $userId = $token->claims()->get('sub');
                    if ($userId && ($user = User::find($userId))) {
                        Auth::login($user);
                        return $next($request);
                    }
                }
            } catch (Throwable $e) {
                // Token validation failed, fall through to unauthorized response
            }
        }

        return response()->json(['status' => 'fail', 'error' => 'unauthenticated'], 401);
    }
}