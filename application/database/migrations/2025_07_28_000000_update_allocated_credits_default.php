<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateAllocatedCreditsDefault extends Migration
{
    public function up()
    {
        if (Schema::getConnection()->getDriverName() === 'sqlite') {
            return;
        }

        Schema::table('services', function (Blueprint $table) {
            $table->integer('allocated_credits')->default(0)->change();
        });
    }

    public function down()
    {
        if (Schema::getConnection()->getDriverName() === 'sqlite') {
            return;
        }

        Schema::table('services', function (Blueprint $table) {
            $table->integer('allocated_credits')->nullable()->change();
        });
    }
}
