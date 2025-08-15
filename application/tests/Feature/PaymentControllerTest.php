<?php

namespace Tests\Feature;

use Illuminate\Support\Facades\Http;
use Tests\TestCase;
use App\Http\Controllers\PaymentController;
use Illuminate\Http\Request;
use Illuminate\Testing\TestResponse;

class DummyRequest extends Request
{
    public function validate(array $rules, ...$params)
    {
        return $this->all();
    }
}

class PaymentControllerTest extends TestCase
{
    public function test_confirm_transfer_returns_error_on_connection_failure(): void
    {
        Http::fake(fn() => throw new \Exception('connection failure'));

        $request = DummyRequest::create('/payment/confirm', 'POST', [
            'phone' => '920000000',
            'amount' => 10,
        ]);

        $controller = new PaymentController();
        $rawResponse = $controller->confirmTransfer($request);
        $response = TestResponse::fromBaseResponse($rawResponse);

        $response->assertStatus(500)
                 ->assertJson([
                     'status' => 'error',
                     'message' => 'فشل الاتصال بخادم الدفع.',
                 ]);
    }
}