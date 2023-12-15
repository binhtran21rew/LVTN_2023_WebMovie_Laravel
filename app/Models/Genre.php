<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Genre extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'Genres';

    protected $fillable = ['name'];

    public function movie_detail(): BelongsToMany{
        return $this->belongsToMany(Movie_detail::class, 'movie_genres', 'movie_id', 'genre_id');
    }

    public function movie_detail_delete(): BelongsToMany{
        return $this
        ->belongsToMany(Genre::class, 'movie_genres', 'movie_id', 'genre_id')
        ->whereNull('movie_genres.deleted_at')
        ->withTimestamps();
    }
}
