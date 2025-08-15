<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasTable('admins')) {
            return;
        }

        Schema::table('admins', function (Blueprint $table) {
            $table->string('api_token', 64)->nullable()->unique()->after('remember_token');
        });

        DB::table('admins')->update(['api_token' => Str::random(60)]);
    }

    public function down(): void
    {
        if (! Schema::hasTable('admins')) {
            return;
        }
        
        Schema::table('admins', function (Blueprint $table) {
            $table->dropColumn('api_token');
        });
    }
};