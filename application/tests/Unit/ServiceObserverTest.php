<?php

namespace Tests\Unit;

use App\Models\Service;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ServiceObserverTest extends TestCase
{
    use RefreshDatabase;

    public function test_service_deactivates_when_allocated_exceeds_balance(): void
    {
        $user = User::factory()->create(['credits' => 10]);
        $service = Service::factory()->create([
            'user_id' => $user->id,
            'allocated_credits' => 8,
            'status' => 1,
        ]);

        $user->credits = 5;
        $user->save();

        $this->assertSame(0, $service->fresh()->status);
    }

    public function test_service_stays_active_when_balance_sufficient(): void
    {
        $user = User::factory()->create(['credits' => 10]);
        $service = Service::factory()->create([
            'user_id' => $user->id,
            'allocated_credits' => 8,
            'status' => 1,
        ]);

        $user->credits = 8;
        $user->save();

        $this->assertSame(1, $service->fresh()->status);
    }
}