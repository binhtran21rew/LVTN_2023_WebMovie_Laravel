<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cast extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'casts';
    protected $fillable = ['name', 'profile_path'];

    public function movie(): BelongsToMany{
        return $this->belongsToMany(Movie::class, 'movie_casts');
    }
    public function movie_delete(): BelongsToMany{
        return $this
        ->belongsToMany(Movie::class, 'movie_casts')
        ->whereNull('movie_casts.deleted_at')
        ->withTimestamps();
    }
}
