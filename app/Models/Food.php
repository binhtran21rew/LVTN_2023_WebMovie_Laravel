<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Food extends Model
{
    use HasFactory;

    protected $table = 'food';
    protected $fillable = ['name'];


    public function combo(): BelongsToMany{
        return $this->belongsToMany(ComboFood::class, 'combo_food', 'combo_id', 'food_id');
    }
}
