<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ApifyActorsSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();

        DB::table('apify_actors')->insert([
            [
                'name'        => 'facebeeeeook',
                'actor_id'    => 'apify~facebook-pages-scraper',
                'metric'      => 'startUrls',
                'value_field' => 'followers',
                'created_at'  => $now,
                'updated_at'  => $now,
            ],
            [
                'name'        => 'instaeeegram',
                'actor_id'    => 'apify~instagram-profile-scraper',
                'metric'      => 'usernames',
                'value_field' => 'followersCount',
                'created_at'  => $now,
                'updated_at'  => $now,
            ],
            [
                'name'        => 'tikeeetok',
                'actor_id'    => 'karamelo~tiktok-profile-scraper',
                'metric'      => 'url',
                'value_field' => 'followerCount',
                'created_at'  => $now,
                'updated_at'  => $now,
            ],
        ]);
    }
}