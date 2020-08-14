<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FavoritBook extends Model
{
    protected $table = 'favorit_book';
    
    public function book()
    {
        return $this->belongsTo('App\Book', 'book_id');
    }
    
    
}
