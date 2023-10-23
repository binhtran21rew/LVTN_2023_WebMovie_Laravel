<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Movie extends Model
{
    use HasFactory;

    protected $table = 'movies';

    protected $fillable = ['title', 'post_path', 'backdrop_path', 'release'];

    public function movie_detail(): HasOne{
        return $this->hasOne(Movie_detail::class);
    }

    public function movie_trailer(): HasOne{
        return $this->hasOne(Trailer::class);
    }

    public function movie_cast(): BelongsToMany{
        return $this->belongsToMany(Cast::class, 'movie_casts', 'movie_id', 'cast_id');
    }

    public function schedule(): HasMany{
        return $this->hasMany(Schedule::class);
    }

    public $incrementing = true;

}
