<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\User;

class UserController extends Controller
{
    
    public function index(){
        $users = User::select('id', 'name', 'email', 'role')->orderBy('name', 'ASC')->paginate(20);
        return view('admin.user.index', compact('users'));  
    }
    
    
    
}
