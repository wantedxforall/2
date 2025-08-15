<?php

namespace App\Services;

use App\Lib\CurlRequest;
use App\Models\ApifyActor;
use App\Models\GeneralSetting;
use Illuminate\Support\Arr;

class ApifyService
{
    protected ?string $token = null;

    public function __construct(?string $token = null)
    {
        if ($token) {
            $this->token = $token;
        } else {
            $this->token = optional(GeneralSetting::first())->apify_token;
        }
    }

    /**
     * تنسيق الإدخال لاسم مستخدم فقط (تُستخدم مع metrics: username/usernames)
     */
    private function normalizeUsername(string $platformHint, string $input): string
    {
        $v = trim($input);

        if (preg_match('~instagram\.com/([^/?#]+)~i', $v, $m)) {
            return ltrim($m[1], '@/');
        }
        if (preg_match('~tiktok\.com/@([^/?#]+)~i', $v, $m)) {
            return ltrim($m[1], '@/');
        }
        if (preg_match('~facebook\.com/([^/?#]+)~i', $v, $m)) {
            return ltrim($m[1], '@/');
        }

        return ltrim($v, '@/');
    }

    /**
     * ضمان أن الإدخال URL كامل (تُستخدم مع metrics: url/urls/startUrls)
     * نعتمد على الـ slug (اسم الـ actor) لمعرفة المنصة عند الحاجة.
     */
    private function ensureUrl(string $slugOrPlatformHint, string $input): string
    {
        $v = trim($input);
        // نظّف fragment و query
        $v = preg_replace('~[#?].*$~', '', $v);

        if (preg_match('~^https?://~i', $v)) {
            return $v;
        }

        $hint = strtolower($slugOrPlatformHint);

        // تخمين الدومين حسب الـ actor
        if (str_contains($hint, 'facebook')) {
            return 'https://www.facebook.com/' . ltrim($v, '/');
        }
        if (str_contains($hint, 'instagram')) {
            return 'https://www.instagram.com/' . ltrim($v, '@/');
        }
        if (str_contains($hint, 'tiktok')) {
            return 'https://www.tiktok.com/@' . ltrim($v, '@/');
        }

        // افتراضي: إن لم نعرف، لا نعدّل (أو أضف https)
        return (preg_match('~^\w[\w\-/\.]+$~', $v)) ? 'https://' . $v : $v;
    }

    /**
     * جلب عدد المتابعين من Apify
     */
    public function getFollowers(string $platform, string $input): ?int
    {
        // جلب إعدادات الـ actor من قاعدة البيانات
        $actor = ApifyActor::where('name', $platform)->first();
        if (!$actor) {
            \Log::error("❌ Apify actor غير موجود للمنصة: {$platform}");
            return null;
        }

        $slug        = $actor->actor_id;     // apify~facebook-pages-scraper ... الخ
        $metricKey   = trim($actor->metric); // حافظ على الـ case
        $metricLower = strtolower($metricKey);
        $valueField  = $actor->value_field;

        // الإدخال النهائي الذي سنستخدمه في الـ payload
        // username فقط لو metric demands username
        if (in_array($metricLower, ['username', 'usernames'], true)) {
            $finalInput = $this->normalizeUsername($slug, $input);
        } else {
            // نضمن URL صحيح لو احتجنا رابط
            $finalInput = $this->ensureUrl($slug, $input);
        }

        // إعداد URL لـ Apify
        $url = "https://api.apify.com/v2/acts/{$slug}/run-sync-get-dataset-items?token={$this->token}";

        // mapping المفاتيح بالشكل الصحيح (case مهم)
        $metricKeyMap = [
            'startUrls' => fn($val) => ['startUrls' => [['url' => $val]]],
            'urls'      => fn($val) => ['urls'      => [$val]],
            'url'       => fn($val) => ['url'       => $val],
            'usernames' => fn($val) => ['usernames' => [$val]],
            'username'  => fn($val) => ['username'  => $val],
        ];

        // بناء الـ payload (لو metric غير معروف، مرّره كما هو دون تغيير case)
        $buildPayload = $metricKeyMap[$metricKey] ?? fn($val) => [$metricKey => $val];
        $postData     = $buildPayload($finalInput);

        \Log::info('📤 Apify API URL', ['url' => $url]);
        \Log::info('📦 Apify Payload', ['payload' => $postData]);

        // مهلة أطول لو scraping صفحة كاملة
        $timeout = in_array($metricLower, ['starturls', 'urls'], true) ? 120 : 60;

        // إرسال الطلب (نمرّر مصفوفة؛ الدالة عندك تدعم json_encode داخليًا)
        $response = CurlRequest::curlPostJson($url, $postData, null, [
            'timeout' => $timeout,
            'retries' => 0,
        ]);

        // تحليل الرد
        $data = json_decode($response, true);
        if (!is_array($data) || empty($data)) {
            \Log::warning('⚠️ رد فارغ من Apify', ['response' => $response]);
            return null;
        }

        $item      = $data[0] ?? $data;
        $followers = null;

        // 1) value_field من قاعدة البيانات أولاً
        if (!empty($valueField)) {
            $followers = Arr::get($item, $valueField);
        }

        // 2) جرّب مفتاح metric (أحيانًا نفس الاسم)
        if ($followers === null && !empty($metricKey)) {
            $followers = Arr::get($item, $metricKey);
        }

        // 3) fallback مفاتيح شائعة
        if ($followers === null) {
            $followers = $item['followers'] ??
                         $item['followersCount'] ??
                         ($data['followers'] ?? null) ??
                         ($data['followersCount'] ?? null) ??
                         ($item['data']['followerCount'] ?? null) ??
                         ($item['fanCount'] ?? null);
        }

        \Log::info('✅ count fetched', ['followers' => $followers]);

        return $followers !== null ? (int) $followers : null;
    }
}
