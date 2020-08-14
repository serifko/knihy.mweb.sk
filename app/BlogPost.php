<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\Book;
use App\Author;

class BlogPost extends Model
{
    protected $fillable = ['user_id','link_type','link_id', 'title', 'slug',
                           'text','likes','title_image','publish_date','is_publised'];
    
    
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    
    /*
    public function user(){
        return DB::table('users')->select('id', 'name')->where('id', $this->user_id)->first();
    }
    */
    public function getLink(){
        if($this->link_type==1){
            return Book::find($this->link_id);
        }elseif($this->link_type==2){
            return Author::find($this->link_id);
        }else{
            return false;
        }
    }
}
