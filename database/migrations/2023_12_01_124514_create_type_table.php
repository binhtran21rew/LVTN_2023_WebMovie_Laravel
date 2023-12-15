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
        Schema::create('comboFood', function (Blueprint $table) {
            $table->integer('id')->unique()->autoIncrement();
            $table->string('name');
            $table->float('price');
            $table->string('detail');
            $table->integer('count')->default(0);
            $table->string('image_path');
            $table->timestamps();
        });


    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comboFood');
    }
};
