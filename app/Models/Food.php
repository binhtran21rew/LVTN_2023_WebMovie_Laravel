<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Food extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'food';
    protected $fillable = ['name', 'type'];


    public function combo(): BelongsToMany{
        return $this->belongsToMany(ComboFood::class, 'combo_food', 'combo_id', 'food_id');
    }
}
