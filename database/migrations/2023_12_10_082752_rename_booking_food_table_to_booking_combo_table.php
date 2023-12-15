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
        Schema::rename('booking_food', 'booking_combo');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('booking_combo', function (Blueprint $table) {
            //
        });
    }
};
