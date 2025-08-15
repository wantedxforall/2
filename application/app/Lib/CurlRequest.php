<?php

namespace App\Lib;

use const CURLE_OPERATION_TIMEDOUT;
use const CURLE_COULDNT_CONNECT;
use const CURLE_COULDNT_RESOLVE_HOST;
use const CURLE_RECV_ERROR;
use const CURLE_SEND_ERROR;
use const CURLE_SSL_CONNECT_ERROR;
use const CURLE_SSL_PEER_CERTIFICATE;
use const CURLE_SSL_CACERT_BADFILE;
use const CURLE_SSL_CERTPROBLEM;
use const CURLE_SSL_CACERT;

class CurlRequest
{
    /**
     * Validate a URL against a whitelist or custom callback.
     *
     * @throws \InvalidArgumentException
     */
    private static function validateUrl(string $url, ?array $allowedUrls, ?callable $validator): void
    {
        if ($allowedUrls !== null && !in_array($url, $allowedUrls, true)) {
            throw new \InvalidArgumentException('URL is not allowed.');
        }

        if ($validator !== null && !$validator($url)) {
            throw new \InvalidArgumentException('URL failed validation.');
        }
    }

    /** Common curl opts */
    private static function applyCommonOpts($ch, bool $verify, array $options): void
    {
        $connectTimeout = $options['connect_timeout'] ?? 10;
        $timeout        = $options['timeout'] ?? 180;

        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER   => true,
            CURLOPT_FOLLOWLOCATION   => true,
            CURLOPT_MAXREDIRS        => 3,
            CURLOPT_CONNECTTIMEOUT   => $connectTimeout,
            CURLOPT_TIMEOUT          => $timeout,
            CURLOPT_NOSIGNAL         => true,
            CURLOPT_ENCODING         => '', // gzip/deflate/br
            CURLOPT_IPRESOLVE        => CURL_IPRESOLVE_V4, // IPv4 لتجنب تعليقات IPv6
            CURLOPT_TCP_KEEPALIVE    => 1,
            CURLOPT_TCP_KEEPIDLE     => 10,
            CURLOPT_TCP_KEEPINTVL    => 10,
            CURLOPT_HTTP_VERSION     => CURL_HTTP_VERSION_2TLS,
            CURLOPT_DNS_CACHE_TIMEOUT=> 300,
            CURLOPT_HEADER           => false,
        ]);

        // SSL verify based on env
        if ($verify) {
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
            if (!empty($options['cainfo'])) {
                curl_setopt($ch, CURLOPT_CAINFO, $options['cainfo']);
            }
        } else {
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        }
    }

    /** Execute with retries + logging */
    private static function execWithRetry($ch, string $url, array $options)
    {
        $maxAttempts = max(1, (int)($options['retries'] ?? 1));
        $attempt = 0;
        $last    = null;

        while ($attempt < $maxAttempts) {
            $attempt++;
            $resp  = curl_exec($ch);
            $errno = curl_errno($ch);
            $err   = $errno ? curl_error($ch) : null;
            $info  = curl_getinfo($ch);
            $code  = (int)($info['http_code'] ?? 0);

            $shouldRetry = false;

            if ($errno) {
                $retryErrnos = [
                    CURLE_OPERATION_TIMEDOUT,
                    CURLE_COULDNT_CONNECT,
                    CURLE_COULDNT_RESOLVE_HOST,
                    CURLE_RECV_ERROR,
                    CURLE_SEND_ERROR,
                ];
                $shouldRetry = in_array($errno, $retryErrnos, true);
            } elseif ($code >= 500 || $code === 408) {
                $shouldRetry = true;
            } elseif ($resp === '' || $resp === false) {
                $shouldRetry = true;
            }

            if (!$shouldRetry) {
                // نجاح أو خطأ منطقي 4xx
                if ($code >= 200 && $code < 300) {
                    return $resp;
                }

                \Log::warning('Curl non-2xx response', [
                    'url'    => $url,
                    'status' => $code,
                    'info'   => self::slimInfo($info),
                    'snippet'=> is_string($resp) ? mb_substr($resp, 0, 500) : null,
                ]);
                throw new \RuntimeException("Curl HTTP error: {$code}", $code ?: 0);
            }

            $last = compact('errno', 'err', 'code') + ['info' => self::slimInfo($info), 'attempt' => $attempt];

            \Log::notice('Curl retrying...', [
                'url'     => $url,
                'attempt' => $attempt,
                'errno'   => $errno,
                'error'   => $err,
                'status'  => $code,
                'info'    => $last['info'],
            ]);

            // backoff: 0.5s, 1s, 2s ...
            usleep((int) (500000 * pow(2, $attempt - 1)));
        }

        \Log::error('Curl failed after retries', ['url' => $url, 'last' => $last]);
        $msg = 'Curl error: request failed after retries. ';
        if (!empty($last['errno'])) {
            $msg .= 'Errno '.$last['errno'].': '.$last['err'];
        } elseif (!empty($last['code'])) {
            $msg .= 'HTTP '.$last['code'];
        }
        throw new \RuntimeException($msg);
    }

    private static function slimInfo(array $info): array
    {
        return [
            'namelookup_time'   => $info['namelookup_time']   ?? null,
            'connect_time'      => $info['connect_time']      ?? null,
            'appconnect_time'   => $info['appconnect_time']   ?? null,
            'pretransfer_time'  => $info['pretransfer_time']  ?? null,
            'starttransfer_time'=> $info['starttransfer_time']?? null,
            'total_time'        => $info['total_time']        ?? null,
            'primary_ip'        => $info['primary_ip']        ?? null,
            'primary_port'      => $info['primary_port']      ?? null,
            'http_code'         => $info['http_code']         ?? null,
        ];
    }

    /** GET */
    public static function curlContent(string $url, ?array $header = null, bool $verify = true, array $options = [])
    {
        self::validateUrl($url, $options['allowed_urls'] ?? null, $options['url_validator'] ?? null);

        $env = env('APP_ENV', 'production');
        $shouldVerify = $verify && $env === 'production';

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        self::applyCommonOpts($ch, $shouldVerify, $options);

        $defaultHeader = [
            'Accept: application/json, */*;q=0.8',
            'User-Agent: AbdoCenterBot/1.0 (+php-curl)',
            'Connection: keep-alive',
        ];
        if (!empty($header)) {
            $defaultHeader = array_values(array_unique(array_merge($defaultHeader, $header)));
        }
        curl_setopt($ch, CURLOPT_HTTPHEADER, $defaultHeader);

        try {
            return self::execWithRetry($ch, $url, $options);
        } finally {
            curl_close($ch);
        }
    }

    /** POST form-encoded */
    public static function curlPostContent(string $url, ?array $arr = null, ?array $header = null, bool $verify = true, array $options = [])
    {
        self::validateUrl($url, $options['allowed_urls'] ?? null, $options['url_validator'] ?? null);

        $env = env('APP_ENV', 'production');
        $shouldVerify = $verify && $env === 'production';

        $params = $arr ? http_build_query($arr) : '';

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        self::applyCommonOpts($ch, $shouldVerify, $options);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);

        $defaultHeader = [
            'Content-Type: application/x-www-form-urlencoded',
            'Accept: application/json, */*;q=0.8',
            'User-Agent: AbdoCenterBot/1.0 (+php-curl)',
            'Connection: keep-alive',
        ];
        if (!empty($header)) {
            $defaultHeader = array_values(array_unique(array_merge($defaultHeader, $header)));
        }
        curl_setopt($ch, CURLOPT_HTTPHEADER, $defaultHeader);

        try {
            return self::execWithRetry($ch, $url, $options);
        } finally {
            curl_close($ch);
        }
    }

    /** POST JSON */
    public static function curlPostJson(string $url, $jsonData, ?array $header = null, array $options = [])
    {
        self::validateUrl($url, $options['allowed_urls'] ?? null, $options['url_validator'] ?? null);

        $env = env('APP_ENV', 'production');
        $shouldVerify = ($options['verify'] ?? true) && $env === 'production';

        // يقبل مصفوفة/كائن ويحوّل إلى JSON
        if (!is_string($jsonData)) {
            $jsonData = json_encode($jsonData, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        }

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        self::applyCommonOpts($ch, $shouldVerify, $options);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);

        $defaultHeader = [
            'Content-Type: application/json',
            'Accept: application/json',
            'User-Agent: AbdoCenterBot/1.0 (+php-curl)',
            'Connection: keep-alive',
        ];
        if (!empty($header)) {
            $defaultHeader = array_values(array_unique(array_merge($defaultHeader, $header)));
        }
        curl_setopt($ch, CURLOPT_HTTPHEADER, $defaultHeader);

        try {
            return self::execWithRetry($ch, $url, $options);
        } catch (\RuntimeException $e) {
            // رسائل أوضح لأخطاء SSL
            $errno = curl_errno($ch);
            if (in_array($errno, [
                CURLE_SSL_CONNECT_ERROR,
                CURLE_SSL_CACERT,
                CURLE_SSL_PEER_CERTIFICATE,
                CURLE_SSL_CACERT_BADFILE,
                CURLE_SSL_CERTPROBLEM
            ], true)) {
                throw new \RuntimeException('SSL certificate or host verification failed: '.$e->getMessage(), $errno);
            }
            throw $e;
        } finally {
            curl_close($ch);
        }
    }
}
