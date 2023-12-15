<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Booking extends Model
{
    use HasFactory;

    protected $table = 'bookings';
    protected $fillable = ['user_id', 'count', 'total_price', 'date', 'status'];

    public function payment(): HasOne{
        return $this->HasOne(Payment::class);
    }

    public function user(): BelongsTo{
        return $this->belongsTo(User::class);
    }

    public function ticket(): HasMany{
        return $this->hasMany(Ticket::class);
    }

    public function combofood(): BelongsToMany{
        return $this->belongsToMany(ComboFood::class, 'booking_combo', 'booking_id', 'combo_id');
    }
}
