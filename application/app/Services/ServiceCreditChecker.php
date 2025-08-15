<?php

namespace App\Services;

use App\Models\Service;
use App\Models\User;
use App\Models\ServiceView;

class ServiceCreditChecker
{
    /**
     * Deactivate any active services whose allocated credits
     * exceed the current available credits of the user.
     */
    public static function run(User $user): void
    {
        $services = Service::where('user_id', $user->id)
            ->where('status', 1)
            ->orderBy('id')
            ->get();

        $total = 0;
        foreach ($services as $service) {
            $total += $service->allocated_credits;
            if ($total > $user->credits) {
                $service->status = 0;
                $service->save();
            }
        }
    }

    public function check(): void
    {
        Service::where('status', 1)->chunkById(100, function ($services) {
            foreach ($services as $service) {
                $spent = ServiceView::where('service_id', $service->id)->sum('credits');
                $service->spent_credits = $spent;
                if ($service->spent_credits >= $service->allocated_credits) {
                    $service->status = 0;
                }
                $service->save();
            }
        });
    }
}