<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Seat extends Model
{
    use HasFactory;

    protected $table = 'seats';

    protected $fillable = ['room_id','number'];

    public function ticket(): HasMany{
        return $this->hasMany(Ticket::class);
    }
    public function room(): BelongsTo{
        return $this->belongsTo(Room::class);
    }
}
