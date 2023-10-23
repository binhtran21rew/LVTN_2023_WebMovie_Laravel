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
        Schema::create('movie_detail', function (Blueprint $table) {
            $table->integer('id')->unique()->autoIncrement();

            $table->integer('movie_id');
            $table->string('title');
            $table->string('overview');
            $table->integer('vote_count');
            $table->float('vote_average');
            $table->string('status');
            $table->timestamps();

            $table->foreign('movie_id')->references('id')->on('movies');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('movie_detail');
    }
};
