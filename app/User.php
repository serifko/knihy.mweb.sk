<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    
    
    public function hasSomeRole(){
        
    }
    public function hasRole($role){
        
    }
    
    
    public function readings(){
        return $this->hasMany('App\BookStatus', 'user_id');
    }
    
    public function userProfile()
    {
        return $this->hasOne('App\UserProfile', 'user_id');
    }
    
    
    public function getUsername(){
        $real = DB::table('user_profiles')->select('realname_pub', 'realname')->where('user_id', $this->id)->first();
        if(DB::table('relations')->where('user_id_f', Auth::id())->where('user_id_s', $this->id)->where('status', 1)->where('blocked', 0)
                ->orWhere('user_id_f', $this->id)->where('user_id_s', Auth::id())->where('status', 1)->where('blocked', 0)->count()>0){
            $isFriend = 1;
        }
   
        $isFriend = 0;
        if(($real->realname_pub==2 or ($real->realname_pub==1 && $isFriend == 1)) && !empty($real->realname)){
            return $real->realname;
        }else {
            return $this->name;
        }
    }
    
    
    
    

}
