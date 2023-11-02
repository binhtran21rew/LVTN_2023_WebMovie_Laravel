<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Genre extends Model
{
    use HasFactory;

    protected $table = 'Genres';

    protected $fillable = ['name'];

    public function movie_detail(): BelongsToMany{
        return $this->belongsToMany(Movie_detail::class, 'movie_genres', 'movie_id', 'genre_id');
    }
}
