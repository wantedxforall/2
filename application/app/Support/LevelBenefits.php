<?php

namespace App\Support;

use App\Models\Level;
use App\Models\User;
use Illuminate\Support\Facades\Cache;

class LevelBenefits
{
    /**
     * اجلب مزايا المستخدم الفعّالة مع كاش 5 دقائق.
     */
    public static function getActive(User $user): array
    {
        $ttlSeconds = (int) (config('levels.cache_ttl', 300)); // 5 دقائق افتراضيًا
        $ver = Cache::rememberForever('levels:version', fn () => 1);
        $key = "user:{$user->id}:level_benefits:v{$ver}";

        return Cache::remember($key, now()->addSeconds($ttlSeconds), function () use ($user) {
            // ---- احسب المزايا هنا كما هو عندك ----
            // مثال تقريبي: اجلب مستوى المستخدم ومزاياه الفعّالة
            $userLevel = $user->userLevel()->with(['level.benefits' => function ($q) {
                $q->where('is_active', true);
            }])->first();

            $benefits = [];
            if ($userLevel && $userLevel->level) {
                foreach ($userLevel->level->benefits as $b) {
                    $benefits[] = [
                        'type'  => $b->type,
                        'value' => (float) $b->value,
                    ];
                }
            }

            return $benefits;
        });
    }

    /**
     * نادِ هذه عند تغيّر مستوى المستخدم إن أردت إبطال كاش مستخدم واحد.
     * (لكننا نستخدم النسخة العامة من Level::flushCaches، فلا تحتاج عادةً).
     */
    public static function flushUser(User $user): void
    {
        // بإمكانك فقط زيادة النسخة العامة ليتم إبطال كل المستخدمين:
        if (!Cache::has('levels:version')) {
            Cache::forever('levels:version', 1);
        } else {
            Cache::increment('levels:version');
        }
    }
}
