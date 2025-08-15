<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Level;
use Illuminate\Http\Request;

class LevelViewController extends Controller
{
    public function index(Request $request)
{
    $user = $request->user();
    $userPoints = (int) $user->credits;

    // اجلب المستويات الفعّالة مرتبة تصاعديًا + فوائدها
    $levels = Level::with('benefits')
        ->where('is_active', 1)                // استخدم 1 أو boolean cast في الموديل
        ->orderBy('min_points_spent', 'asc')
        ->get();

    // آخر مستوى حدّه الأدنى <= نقاط المستخدم
    $currentLevel = $levels
        ->where('min_points_spent', '<=', $userPoints)
        ->last();

    // أول مستوى حدّه الأدنى > نقاط المستخدم
    $nextLevel = $levels->first(function ($lvl) use ($userPoints) {
        return $lvl->min_points_spent > $userPoints;
    });

    $pointsToNext = $nextLevel ? max(0, $nextLevel->min_points_spent - $userPoints) : 0;

    return view($this->activeTemplate.'user.levels.index', [
        'levels'       => $levels,
        'currentLevel' => $currentLevel,
        'nextLevel'    => $nextLevel,
        'pointsToNext' => $pointsToNext,
        'user'         => $user,
    ]);
}

}