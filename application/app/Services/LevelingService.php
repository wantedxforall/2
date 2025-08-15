<?php

namespace App\Services;

use App\Models\Level;
use App\Models\User;
use App\Models\UserLevel;
use App\Models\UserLevelHistory;
use Illuminate\Support\Facades\Cache;

class LevelingService
{
    public function addPointsConsumption(User $user, int $points): void
    {
        $userLevel = UserLevel::firstOrCreate(
            ['user_id' => $user->id],
            ['points_spent' => 0]
        );

        $userLevel->points_spent += $points;
        $userLevel->save();

        $this->recomputeLevel($user);
    }

    public function removePointsConsumption(User $user, int $points): void
    {
        $userLevel = UserLevel::firstOrCreate(
            ['user_id' => $user->id],
            ['points_spent' => 0]
        );

        $userLevel->points_spent = max(0, $userLevel->points_spent - $points);
        $userLevel->save();

        $this->recomputeLevel($user);
    }

    public function recomputeLevel(User $user): void
    {
        $userLevel = UserLevel::firstOrCreate(
            ['user_id' => $user->id],
            ['points_spent' => 0]
        );

        $pointsSpent = $userLevel->points_spent;

        $level = Level::where('status', 1)
            ->where('min_points_spent', '<=', $pointsSpent)
            ->orderByDesc('priority')
            ->orderByDesc('min_points_spent')
            ->first();

        $levelId = $level?->id;
        if ($userLevel->level_id !== $levelId) {
            $userLevel->level_id = $levelId;
            $userLevel->achieved_at = $level ? now() : null;
            $userLevel->save();

            UserLevelHistory::create([
                'user_id'      => $user->id,
                'level_id'     => $levelId,
                'points_spent' => $pointsSpent,
                'achieved_at'  => now(),
            ]);

            Cache::forget('user_benefits_' . $user->id);
        }
    }
}