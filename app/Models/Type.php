<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Type extends Model
{
    use HasFactory;

    protected $table = 'type';

    protected  $fillable = ['type', 'name', 'price'];

    public function food(): BelongsToMany{
        return $this->belongsToMany(Food::class, 'type_food', 'type_id', 'food_id');
    }
}
