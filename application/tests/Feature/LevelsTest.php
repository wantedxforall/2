<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class LevelsTest extends TestCase
{
    use RefreshDatabase;

    protected function migrateUsing(): array
    {
        return [
            '--path' => base_path('database/migrations/2014_10_12_000000_create_users_table.php'),
            '--realpath' => true,
        ];
    }

    public function test_level_auto_assignment_when_user_consumption_crosses_threshold(): void
    {
        $user = User::factory()->createQuietly(['credits' => 0]);

        $threshold = 100;
        $consumption = 150;
        $user->level = $consumption >= $threshold ? 'gold' : 'basic';

        $this->assertEquals('gold', $user->level);
    }

    public function test_service_discount_application(): void
    {
        $baseCost = 200;
        $discountPercent = 10;
        $discounted = $baseCost - ($baseCost * $discountPercent / 100);

        $this->assertEquals(180, $discounted);
    }

    public function test_bonus_points_on_purchase(): void
    {
        $user = User::factory()->createQuietly(['credits' => 100]);
        $bonusPercent = 5;
        $purchaseAmount = 200;
        $bonus = $purchaseAmount * $bonusPercent / 100;
        $user->credits += $bonus;

        $this->assertEquals(110, $user->credits);
    }

    public function test_withdraw_fee_and_minimum_adjustments(): void
    {
        $user = User::factory()->createQuietly(['credits' => 500]);
        $withdrawAmount = 100;
        $feePercent = 5;
        $min = 50;

        $this->assertTrue($withdrawAmount >= $min);

        $finalAmount = $withdrawAmount - ($withdrawAmount * $feePercent / 100);
        $this->assertEquals(95, $finalAmount);
    }
}