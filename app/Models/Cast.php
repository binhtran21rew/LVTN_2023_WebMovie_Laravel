<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
class Cast extends Model
{
    use HasFactory;

    protected $table = 'casts';
    protected $fillable = ['name', 'profile_path'];

    public function movie(): BelongsToMany{
        return $this->belongsToMany(Movie::class, 'movie_casts', 'movie_id', 'cast_id');
    }
}
