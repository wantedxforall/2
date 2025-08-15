<?php

namespace Tests\Unit;

use App\Lib\CurlRequest;
use PHPUnit\Framework\TestCase;

class CurlRequestTest extends TestCase
{
    public function test_rejects_url_not_in_whitelist(): void
    {
        $this->expectException(\InvalidArgumentException::class);
        CurlRequest::curlContent('http://example.com', null, true, [
            'allowed_urls' => ['http://allowed.com'],
        ]);
    }

    public function test_rejects_url_via_callback(): void
    {
        $this->expectException(\InvalidArgumentException::class);
        CurlRequest::curlContent('http://example.com', null, true, [
            'url_validator' => function ($url) {
                return false;
            },
        ]);
    }

    public function test_throws_on_connection_failure(): void
    {
        $this->expectException(\RuntimeException::class);
        // Intentionally malformed URL to force curl to error
        CurlRequest::curlContent('http://', null, true, [
            'connect_timeout' => 1,
            'timeout' => 2,
        ]);
    }
}