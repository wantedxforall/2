<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('levels', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('min_points_spent');
            $table->unsignedTinyInteger('priority');
            $table->string('badge')->nullable();
            $table->boolean('is_active');
            $table->timestamps();
        });

        Schema::create('level_benefits', function (Blueprint $table) {
            $table->id();
            $table->foreignId('level_id')->constrained('levels')->cascadeOnDelete();
            $table->string('type')->index();
            $table->decimal('value', 12, 4);
            $table->boolean('is_active');
            $table->timestamps();
        });

        Schema::create('user_levels', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->foreignId('level_id')->nullable()->constrained('levels')->nullOnDelete();
            $table->unsignedBigInteger('points_spent_total')->default(0);
            $table->timestamp('achieved_at')->nullable();
            $table->timestamps();

            $table->unique('user_id');
        });

        Schema::create('user_level_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->foreignId('from_level_id')->nullable()->constrained('levels')->nullOnDelete();
            $table->foreignId('to_level_id')->nullable()->constrained('levels')->nullOnDelete();
            $table->unsignedBigInteger('points_spent_total_at_change')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_level_histories');
        Schema::dropIfExists('user_levels');
        Schema::dropIfExists('level_benefits');
        Schema::dropIfExists('levels');
    }
};