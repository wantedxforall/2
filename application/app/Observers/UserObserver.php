<?php

namespace App\Observers;

use App\Models\User;
use App\Services\ServiceCreditChecker;

class UserObserver
{
    /**
     * Handle the User "updated" event.
     */
    public function updated(User $user): void
    {
        if ($user->wasChanged('credits')) {
            ServiceCreditChecker::run($user);
        }
    }
    
    public function saved(User $user): void
    {
        foreach ($user->services()->where('status', 1)->get() as $service) {
            if ($service->allocated_credits > $user->credits) {
                $service->status = 0;
                $service->save();
            }
        }
    }
}