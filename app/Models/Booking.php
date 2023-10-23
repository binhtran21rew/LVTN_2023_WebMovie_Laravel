<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Booking extends Model
{
    use HasFactory;

    protected $table = 'bookings';
    protected $fillable = ['user_id', 'payment_id', 'count', 'date', 'status'];

    public function payment(): BelongsTo{
        return $this->belongsTo(Payment::class);
    }

    public function user(): BelongsTo{
        return $this->belongsTo(User::class);
    }

    public function ticket(): HasMany{
        return $this->hasMany(Ticket::class);
    }
}
