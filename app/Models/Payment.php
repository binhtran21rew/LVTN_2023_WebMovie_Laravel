<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Payment extends Model
{
    use HasFactory;

    protected $table = 'payments';
    protected $fillable = ['id','booking_id', 'date', 'time', 'type', 'price'];

    public function booking(): BelongsTo{
        return $this->BelongsTo(Booking::class);
    }
}
