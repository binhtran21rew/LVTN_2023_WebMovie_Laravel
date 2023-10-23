<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Room extends Model
{
    use HasFactory;

    protected $table = 'rooms';

    protected $fillable = ['name'];

    public function seat(): HasMany{
        return $this->hasMany(Seat::class);
    }

    public function schedule(): HasMany{
        return $this->hasMany(Schedule::class);
    }
}
