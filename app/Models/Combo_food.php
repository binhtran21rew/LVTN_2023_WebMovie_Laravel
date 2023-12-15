<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Combo_food extends Model
{
    use HasFactory;

    protected $table = 'combo_food';
    protected $fillable = ['combo_id', 'food_id'];
}
