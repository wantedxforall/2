<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class LevelSeeder extends Seeder
{
    public function run(): void
    {
        if (!Schema::hasTable('levels')) {
            return;
        }

        $now = now();

        DB::table('levels')->insert([
            [
                'name'              => 'Bronze',
                'min_points_spent'  => 0,
                'priority'          => 1,
                'badge'             => null,
                'is_active'         => true,
                'created_at'        => $now,
                'updated_at'        => $now,
            ],
            [
                'name'              => 'Silver',
                'min_points_spent'  => 1000,
                'priority'          => 2,
                'badge'             => null,
                'is_active'         => true,
                'created_at'        => $now,
                'updated_at'        => $now,
            ],
            [
                'name'              => 'Gold',
                'min_points_spent'  => 5000,
                'priority'          => 3,
                'badge'             => null,
                'is_active'         => true,
                'created_at'        => $now,
                'updated_at'        => $now,
            ],
        ]);
    }
}