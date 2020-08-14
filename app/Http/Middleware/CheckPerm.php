<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CheckPerm
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $role="")
    {
        //AK JE TO ZAVOLANE TAK MUSI BYT MINIMALNE PRIHLASENY
        if(!Auth::check()){
            return redirect('/')->with('error', 'Iba prihlásený užívatelia môžu pristupovať do tejto časti stránky.');
        }
        
       //HLAVNY ADMIN VSADE POVOLENIE
        if(Auth::check() && Auth::id()==1) return $next($request);
        
        //AK JE PRIHLASENY SKONTROLUJE SA CI MA POVOLENIE
        if($role!="" && DB::table('permission_join_user')
                ->join('permissions', 'permissions.id', '=', 'permission_join_user.permission_id')
                ->where('permission_join_user.user_id', Auth::id())
                ->where('permissions.key', $role)->first())
                {
           return $next($request);
        }
       
        if($role!="" && DB::table('group_join_permission')
                ->join('permissions', 'permissions.id', '=', 'group_join_permission.permission_id')
                ->join('group_join_user', 'group_join_user.group_id', '=', 'group_join_permission.group_id')
                ->where('group_join_user.user_id', Auth::id())
                ->where('permissions.key', $role)->first())
            {
            return $next($request);
        }
        
        if(empty($role) && Auth::check()){
            return $next($request);
        }

        
        return redirect('/')->with('error', 'Nemáte oprávnenie vstupovať do tejto časti stránky.');
        
    }
}
