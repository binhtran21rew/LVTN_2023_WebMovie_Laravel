<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking_food extends Model
{
    use HasFactory;

    protected $table = 'booking_food';

    protected  $fillable = ['booking_id', 'food_id'];
}
