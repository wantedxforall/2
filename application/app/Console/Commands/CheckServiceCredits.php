<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Services\ServiceCreditChecker;

class CheckServiceCredits extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'service:check-credits';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update service statuses based on spent credits';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $checker = new ServiceCreditChecker();
        $checker->check();

        $this->info('Service credit check completed.');
        return Command::SUCCESS;
    }
}