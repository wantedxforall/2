<?php

namespace App\Traits;

use App\Services\LevelingService;

trait AppliesLevelBenefits
{
    /**
     * Apply a level-based discount when purchasing points.
     *
     * @param float $amount
     * @param mixed $user  User instance with a `level` relation/attribute
     * @return float
     */
    protected function applyBuyPointsDiscount(float $amount, $user): float
    {
        $discount = $user->level->buy_points_discount ?? 0;
        return $amount - ($amount * $discount / 100);
    }

    /**
     * Calculate bonus points granted on purchase based on the user's level.
     *
     * @param int   $points  Base purchased points
     * @param mixed $user    User instance with a `level` relation/attribute
     * @return int
     */
    protected function calcBonusPoints(int $points, $user): int
    {
        $bonusPercentage = $user->level->bonus_points ?? 0;
        return (int) round($points * $bonusPercentage / 100);
    }

    /**
     * Apply service discount and track the discounted consumption.
     *
     * @param float $cost  Service cost before discount
     * @param mixed $user  User instance
     * @return float       Discounted cost
     */
    protected function applyServiceDiscount(float $cost, $user): float
    {
        $discount = $user->level->service_discount ?? 0;
        $discounted = $cost - ($cost * $discount / 100);

        // Track consumption of points for level progression
        LevelingService::addPointsConsumption($user, $discounted);

        return $discounted;
    }

    /**
     * Remove previously tracked points consumption (e.g., on refund or cancel).
     *
     * @param mixed $user   User instance
     * @param float $points Points to revert
     * @return void
     */
    protected function removePointsConsumption($user, float $points): void
    {
        LevelingService::removePointsConsumption($user, $points);
    }

    /**
     * Adjust withdrawal amount based on level-specific fees and minimums.
     *
     * @param float $amount Requested withdrawal amount
     * @param mixed $user   User instance
     * @return float        Final amount after adjustments
     */
    protected function applyWithdrawAdjustments(float $amount, $user): float
    {
        $min = $user->level->withdraw_min ?? 0;
        $fee = $user->level->withdraw_fee ?? 0;

        $amount = max($amount, $min);
        $feeAmount = $amount * $fee / 100;

        return $amount - $feeAmount;
    }
}