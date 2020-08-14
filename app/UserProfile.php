<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserProfile extends Model
{
    
    protected $fillable = ['user_id', 'email_pub', 'realname_pub', 'realname', 
                           'birthday', 'birthday_pub', 'age_pub', 'about', 'about_pub',
                           'website_pub', 'website', 'facebook_pub', 'facebook',
                           'twitter_pub', 'twitter', 'instagram_pub', 'instagram',
                            'tumblr_pub', 'tumblr', 'photo', 'photo_pub'];
    
    
        
    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }
    

    public function getAge(){
        if(empty($this->birthday)){
            return "neznámy";
        } else{
            $birthDate = explode("-", $this->birthday);
            //get age from date or birthdate
            $age = (date("md", date("U", mktime(0, 0, 0, $birthDate[2], $birthDate[1], $birthDate[0]))) > date("md")
              ? ((date("Y") - $birthDate[0]) - 1)
              : (date("Y") - $birthDate[0]));
            return $age;
        }
    }
    
    
    
}
