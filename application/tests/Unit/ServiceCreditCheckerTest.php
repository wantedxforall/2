<?php

namespace Tests\Unit;

use App\Models\Service;
use App\Models\User;
use App\Services\ServiceCreditChecker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ServiceCreditCheckerTest extends TestCase
{
    use RefreshDatabase;

    public function test_excess_services_are_deactivated_when_total_exceeds_user_credits(): void
    {
        $user = User::factory()->create(['credits' => 10]);

        //$service1 = Service::factory()->create(['user_id' => $user->id, 'allocated_credits' => 4, 'status' => 1]);
        //$service2 = Service::factory()->create(['user_id' => $user->id, 'allocated_credits' => 4, 'status' => 1]);
        //$service3 = Service::factory()->create(['user_id' => $user->id, 'allocated_credits' => 4, 'status' => 1]);
        $service1 = Service::factory()->create(['user_id' => $user->id, 'allocated_credits' => 8, 'status' => 1]);
        $service2 = Service::factory()->create(['user_id' => $user->id, 'allocated_credits' => 12, 'status' => 1]);
        $service3 = Service::factory()->create(['user_id' => $user->id, 'allocated_credits' => 6, 'status' => 1]);

        ServiceCreditChecker::run($user);

        $this->assertSame(1, $service1->fresh()->status);
        //$this->assertSame(1, $service2->fresh()->status);
        //$this->assertSame(0, $service3->fresh()->status);
        $this->assertSame(0, $service2->fresh()->status);
        $this->assertSame(1, $service3->fresh()->status);
    }
}