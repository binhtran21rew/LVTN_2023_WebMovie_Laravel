<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking_food extends Model
{
    use HasFactory;

    protected $table = 'booking_combo';

    protected  $fillable = ['booking_id', 'combo_id'];
}
