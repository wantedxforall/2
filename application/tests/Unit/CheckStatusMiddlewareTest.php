<?php

namespace Tests\Unit;

use App\Http\Middleware\CheckStatus;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Tests\TestCase;
use function gs;

class CheckStatusMiddlewareTest extends TestCase
{
    use RefreshDatabase;

    public function test_api_returns_effective_requirements(): void
    {
        $user = User::factory()->create([
            'status' => 1,
            'ev' => 0,
            'sv' => 0,
            'tv' => 1,
        ]);

        $general = gs();
        $general->ev = 1;
        $general->sv = 1;

        $this->actingAs($user);

        $request = Request::create('/api/test', 'GET');
        $response = (new CheckStatus())->handle($request, fn () => response('ok'));

        $this->assertSame('unverified', $response->getData()->remark);
        $data = (array) $response->getData()->data;
        $this->assertFalse($data['email_verified']);
        $this->assertFalse($data['mobile_verified']);
    }

    public function test_middleware_allows_when_verification_disabled(): void
    {
        $user = User::factory()->create([
            'status' => 1,
            'ev' => 0,
            'sv' => 0,
            'tv' => 1,
        ]);

        $general = gs();
        $general->ev = 0;
        $general->sv = 0;

        $this->actingAs($user);

        $request = Request::create('/api/test', 'GET');
        $response = (new CheckStatus())->handle($request, fn () => response('ok'));

        $this->assertSame('ok', $response->getContent());
    }

    public function test_web_request_redirects_when_unverified(): void
    {
        $user = User::factory()->create([
            'status' => 1,
            'ev' => 0,
            'sv' => 0,
            'tv' => 1,
        ]);

        $general = gs();
        $general->ev = 1;
        $general->sv = 1;

        $this->actingAs($user);

        Route::get('/authorization', fn () => 'auth')->name('user.authorization');

        $request = Request::create('/home', 'GET');
        $response = (new CheckStatus())->handle($request, fn () => response('ok'));

        $this->assertTrue($response->isRedirect(route('user.authorization')));
    }
}