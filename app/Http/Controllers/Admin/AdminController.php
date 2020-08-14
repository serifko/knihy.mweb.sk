<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function home(){
        $num_contacts = DB::table('contacts')->where('read', 0)->count();       
        return view('admin.admin.home', compact('num_contacts'));
    }
    
    public function contacts(){
        $contacts = DB::table('contacts')->orderBy('created_at', 'DESC')->paginate(20);
        return view('admin.admin.contacts', compact('contacts'));               
    }
    public function contact($id_contact){
        $contact = DB::table('contacts')->where('id', $id_contact)->first();
        $user = DB::table('users')->select('id', 'name')->where('id', $contact->user_id)->first();  
        return view('admin.admin.contact', compact('contact', 'user'));               
    }
    public function contactRead($id_contact){
        DB::table('contacts')->where('id', $id_contact)->update([
                                                            'read'=>1,
                                                        ]);
        return back()->with('succeed', 'Správa bola označená ako prečítaná.');
    }
    public function contactDelete($id_contact){
        DB::table('contacts')->where('id', $id_contact)->delete();
        return redirect('admin/kontakty')->with('succeed', 'Správa bola vymazaná.');
    }
    
}
