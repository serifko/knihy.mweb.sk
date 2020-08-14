<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use App\User;

class PermissionController extends Controller
{
    
    
    public function index(){
        $permissions = DB::table('permissions')->orderBy('nazov', 'ASC')->get();
        return view('admin.permission.index', compact('permissions'));
    }
    
    public function store(Request $request){
        $validator=$this->validatePermission($request);
	if ($validator->fails()) return redirect('admin/povolenia')->withErrors($validator)->withInput();

        DB::table('permissions')->insert([
				'nazov' => trim(Input::get('nazov')),
				'key' => trim(Input::get('key')),
				'description' => trim(Input::get('description'))
                            ]);		
        return redirect('admin/povolenia')->with('succeed', 'Povolenie bolo pridané.');
    }
    
    public function edit($id){
        $permission = DB::table('permissions')->where('id', $id)->first();
        return view('admin.permission.edit', compact('permission'));
    }
    public function update(Request $request, $id){
        $validator=$this->validatePermission($request, $id);
	if ($validator->fails()) return redirect('admin/povolenia/'.$id.'/upravit')->withErrors($validator)->withInput();

        DB::table('permissions')->where('id', $id)->update([
				'nazov' => trim(Input::get('nazov')),
				'key' => trim(Input::get('key')),
				'description' => trim(Input::get('description'))
                            ]);		
        return redirect('admin/povolenia/'.$id.'/upravit')->with('succeed', 'Povolenie bolo upravené.');
    }
    public function delete(Request $request, $id){
        DB::table('group_join_permission')->where('permission_id', $id)->delete();
        DB::table('permission_join_user')->where('permission_id', $id)->delete();
        if(DB::table('permissions')->where('id', $id)->delete()){
            return redirect('admin/povolenia')->with('succeed', 'Povolenie bolo vymazané.');
        }
        return back()->with('error', 'Povolenie sa nepodarilo vymazať.');
    }
    
 
    public function validatePermission($request, $id="")
    {
        $messages=[
		'nazov.required'=>'Názov povolenia nemôže byť prázdny.',
		'nazov.min'=>'Názov povolenia musí obsahovať minimálne :min znakov.',
		'nazov.max'=>'Názov povolenia môže obsahovať maximálne :max znakov.',
		'key.required'=>'Kľúč povolenia nemôže byť prázdny.',
		'key.min'=>'Kľúč povolenia musí obsahovať minimálne :min znaky.',
		'key.max'=>'Kľúč povolenia môžu obsahovať maximálne :max znakov.',
		'description.max'=>'Popis povolenia môžu obsahovať maximálne :max znakov.',
	];
	
        $validator = Validator::make($request->all(), [
            'nazov' => 'required|min:5|max:150',
            'key' => 'required|min:4|max:50|unique:permissions,key,'.$id.',id',
            'description' => 'max:200',
        ], $messages);
		return $validator;
    }
    
    
    public function nastavit($user_id){
        if(!$user = User::where('id', $user_id)->first()) return back()->with('error', 'Užívateľ s týmto ID neexistuje.');
        $permissions = DB::table('permissions')->orderBy('nazov', 'ASC')->get();
        $permissions_old = DB::table('permission_join_user')->where('user_id', $user_id)->get();
        return view('admin.permission.nastavit', compact('user', 'permissions', 'permissions_old'));
    }
    public function nastavitSave($user_id){
        if(!$user = User::where('id', $user_id)->first()) return back()->with('error', 'Užívateľ s týmto ID neexistuje.');
        $permissions = DB::table('permissions')->orderBy('nazov', 'ASC')->get();
        DB::table('permission_join_user')->where('user_id', $user_id)->delete();
        foreach($permissions as $permission){
            if(!empty(Input::get('permission_'.$permission->id))){
                DB::table('permission_join_user')->insert([
                                                'user_id' => $user_id,
                                                'permission_id' => $permission->id,   
                                            ]);
            }
        }
        
        return redirect('/admin/povolenia/'.$user_id.'/nastavit')->with('succeed', 'Nastavenie oprávnení bolo uložené.');
    }
    
    // NASTAVENIE OPRAVNENI SKUPIN
    public function nastavitGroup($group_id){
        if(!$group = DB::table('groups')->where('id', $group_id)->first()) return back()->with('error', 'Skupina s týmto ID neexistuje.');
        $permissions = DB::table('permissions')->orderBy('nazov', 'ASC')->get();
        $permissions_old = DB::table('group_join_permission')->where('group_id', $group_id)->get();
        
        return view('admin.permission.nastavitGroup', compact('group', 'permissions', 'permissions_old'));
    }
    public function nastavitGroupSave($group_id){
        if(!$group = DB::table('groups')->where('id', $group_id)->first()) return back()->with('error', 'Skupina s týmto ID neexistuje.');
        $permissions = DB::table('permissions')->orderBy('nazov', 'ASC')->get();
        
        DB::table('group_join_permission')->where('group_id', $group_id)->delete();
        foreach($permissions as $permission){
            if(!empty(Input::get('permission_'.$permission->id))){
                DB::table('group_join_permission')->insert([
                                                'group_id' => $group_id,
                                                'permission_id' => $permission->id,   
                                            ]);
            }
        }
        
        return redirect('/admin/povolenia/'.$group_id.'/nastavitskupinu')->with('succeed', 'Nastavenie oprávnení bolo uložené.');
    }
    
    
    
    
}
