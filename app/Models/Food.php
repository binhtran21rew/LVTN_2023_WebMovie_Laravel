<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Food extends Model
{
    use HasFactory;

    protected $table = 'food';
    protected $fillable = ['name', 'count', 'image_path'];

    public function booking(): BelongsToMany{
        return $this->belongsToMany(Booking::class, 'booking_food', 'booking_id', 'food_id');
    }

    public function type(): BelongsToMany{
        return $this->belongsToMany(Type::class, 'type_food', 'type_id', 'food_id');
    }
}
