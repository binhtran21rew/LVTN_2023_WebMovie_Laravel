<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class ComboFood extends Model
{
    use HasFactory;

    protected $table = 'ComboFood';

    protected  $fillable = ['name', 'price', 'detail', 'count', 'image_path'];

    public function food(): BelongsToMany{
        return $this->belongsToMany(Food::class, 'combo_food', 'combo_id', 'food_id');
    }

    public function booking(): BelongsToMany{
        return $this->belongsToMany(Booking::class, 'booking_combo', 'booking_id', 'combo_id');
    }
}
