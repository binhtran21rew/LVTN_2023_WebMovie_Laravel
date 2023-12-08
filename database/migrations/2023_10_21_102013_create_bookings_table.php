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
        
        Schema::create('bookings', function (Blueprint $table) {
            $table->integer('id')->unique()->autoIncrement();
            $table->bigInteger('user_id')->unsigned();
            $table->integer('count');
            $table->dateTime('date');
            $table->float('total_price');
            $table->string('status');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('booking');
    }
};
