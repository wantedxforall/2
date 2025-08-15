<?php

if (! function_exists('__laravel_helper_progress')) {
    /**
     * احسب نسبة التقدم من مستوى حالي إلى المستوى التالي.
     *
     * يقبل أرقام مباشرة أو كائنات/مصفوفات فيها min_points_spent.
     * أمثلة:
     *  __laravel_helper_progress($userCredits, $currentLevel, $nextLevel);
     *  __laravel_helper_progress(1200, 1000, 2000);
     */
    function __laravel_helper_progress($current, $from = 0, $to = null): int
    {
        // استخرج min_points_spent لو كانت بارامترات كائن/مصفوفة
        $extractMin = function ($x, $default = null) {
            if (is_object($x)) {
                return isset($x->min_points_spent) ? (float) $x->min_points_spent : (is_numeric($x) ? (float) $x : $default);
            }
            if (is_array($x)) {
                return isset($x['min_points_spent']) ? (float) $x['min_points_spent'] : (is_numeric($x) ? (float) $x : $default);
            }
            return is_numeric($x) ? (float) $x : $default;
        };

        $current = $extractMin($current, (float) ($current ?? 0));
        $from    = $extractMin($from, 0.0);
        $to      = $extractMin($to, null);

        // لو ما في مستوى تالي، اعتبر التقدم 100%
        if ($to === null || $to <= $from) {
            return 100;
        }

        $pct = (($current - $from) / max(1e-9, ($to - $from))) * 100;
        $pct = (int) round($pct);
        return max(0, min(100, $pct));
    }
}
