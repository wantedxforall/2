<?php
namespace Tests\Feature;

use App\Http\Controllers\Admin\AdController;
use Mockery;
use Tests\TestCase;

class AdRedirectTest extends TestCase
{
    public function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }

    public function test_redirect_rejected_for_external_domain(): void
    {
        Mockery::mock('overload:App\\Models\\Ad')
            ->shouldReceive('find')
            ->with(1)
            ->andReturn((function(){
                $ad = new \App\Models\Ad();
                $ad->redirect_url = 'https://evil.com';
                return $ad;
            })());
        $controller = new AdController();
        $response = $controller->adClicked(1);
        $this->assertEquals(url('/'), $response->getTargetUrl());
    }

    public function test_redirect_allows_whitelisted_domain(): void
    {
        $allowedHost = parse_url(config('app.url'), PHP_URL_HOST);
        Mockery::mock('overload:App\\Models\\Ad')
            ->shouldReceive('find')
            ->with(2)
            ->andReturn((function() use ($allowedHost){
                $ad = new \App\Models\Ad();
                $ad->redirect_url = 'http://' . $allowedHost . '/test';
                return $ad;
            })());
        $controller = new AdController();
        $response = $controller->adClicked(2);
        $this->assertEquals('http://' . $allowedHost . '/test', $response->getTargetUrl());
    }
}