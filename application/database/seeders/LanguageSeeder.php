<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LanguageSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('languages')->insert([
            'name' => 'English',
            'code' => 'en',
            'icon' => null,
            'text_align' => 0,
            'is_default' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}