<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('admins', function (Blueprint $table) {
            if (!Schema::hasColumn('admins', 'tsc')) {
                $table->string('tsc')->nullable()->after('api_token');
            }
            if (!Schema::hasColumn('admins', 'ts')) {
                $table->boolean('ts')->default(0)->after('tsc');
            }
            if (!Schema::hasColumn('admins', 'tv')) {
                $table->boolean('tv')->default(0)->after('ts');
            }
        });
    }

    public function down()
    {
        Schema::table('admins', function (Blueprint $table) {
            $table->dropColumn(['ts', 'tv', 'tsc']);
        });
    }
};