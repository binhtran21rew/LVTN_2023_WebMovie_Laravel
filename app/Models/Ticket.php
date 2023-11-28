<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Ticket extends Model
{
    use HasFactory;

    protected $table = 'ticket';

    protected $fillable = ['seat_id', 'schedule_id', 'booking_id', 'status'];

    public function seat(): BelongsTo{
        return $this->belongsTo(Seat::class);
    }

    public function booking(): BelongsTo{
        return $this->belongsTo(Booking::class);
    }

    public function schedule(): BelongsTo{
        return $this->belongsTo(Schedule::class);
    }
}
