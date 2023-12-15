<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Room extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'rooms';

    protected $fillable = ['name', 'status'];

    public function seat(): HasMany{
        return $this->hasMany(Seat::class);
    }

    public function schedule(): HasMany{
        return $this->hasMany(Schedule::class);
    }
}
