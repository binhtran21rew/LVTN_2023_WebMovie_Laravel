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
        Schema::create('ticket', function (Blueprint $table) {
            $table->integer('id')->unique()->autoIncrement();
            $table->integer('seat_id');
            $table->integer('schedule_id');
            $table->integer('booking_id');
            $table->string('status');
            $table->timestamps();

            $table->foreign('seat_id')->references('id')->on('seats');
            $table->foreign('schedule_id')->references('id')->on('schedules');
            $table->foreign('booking_id')->references('id')->on('bookings');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ticket');
    }
};
