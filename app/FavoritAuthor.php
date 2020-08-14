<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FavoritAuthor extends Model
{
    protected $table = 'favorit_author';
    
    public function author()
    {
        return $this->belongsTo('App\Author', 'author_id');
    }
}
