<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Book extends Model
{
    protected $fillable = ['name', 'original_name', 'publish_year', 'author_id', 'author_id', 'about', 'cover_img', 'slug', 'user_id'];
    
    
        
    public function author()
    {
        return $this->belongsTo('App\Author', 'author_id');
    }
    
    
    public function categories()
    {
        return DB::table('book_join_categories')->select('book_categories.nazov', 'book_categories.slug')
                                                ->join('book_categories', 'book_join_categories.book_category_id', '=', 'book_categories.id')
                                                ->where('book_join_categories.book_id', $this->id)->get();
    }
    
    public function user(){
        return DB::table('users')->select('id', 'name')->where('id', $this->user_id)->first();
    } 
    
    
    public function comments()
    {
        return $this->hasMany('App\BookComment', 'book_id');
    }
    
    public function rating(){
        return BookComment::where('book_id', $this->id)->avg('rating');
    }
    
}
