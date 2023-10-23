<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Schedule extends Model
{
    use HasFactory;

    protected $table = 'schedules';

    protected $fillable= ['room_id', 'movie_id', 'data', 'price', 'time_start', 'time_end'];

    public function ticket(): HasMany{
        return $this->hasMany(Ticket::class);
    }

    public function room(): BelongsTo{
        return $this->belongsTo(Room::class);
    }

    public function movie(): BelongsTo{
        return $this->belongsTo(Movie::class);
    }
}
