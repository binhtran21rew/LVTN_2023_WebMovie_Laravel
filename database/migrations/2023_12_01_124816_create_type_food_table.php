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
        Schema::create('type_food', function (Blueprint $table) {
            $table->id();
            $table->integer('food_id');
            $table->integer('combo_id');
            $table->timestamps();

            $table->foreign('combo_id')->references('id')->on('comboFood');
            $table->foreign('food_id')->references('id')->on('food');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('type_food');
    }
};
