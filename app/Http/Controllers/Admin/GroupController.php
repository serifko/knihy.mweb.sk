<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use App\User;

class GroupController extends Controller{
    
    
    public function index() {
        $groups = DB::table('groups')->orderBy('nazov', 'ASC')->get();
        return view('admin.group.index', compact('groups'));
    }
    
    public function store(Request $request){
        $validator=$this->validateGroup($request);
	if ($validator->fails()) return redirect('admin/skupiny')->withErrors($validator)->withInput();
              
        DB::table('groups')->insert([
				'nazov' => trim(Input::get('nazov')),
				'description' => trim(Input::get('description'))
                            ]);		
        return redirect('admin/skupiny')->with('succeed', 'Skupina bola pridaná.');   
          
    }
    
    public function edit($id){
        $group = DB::table('groups')->where('id', $id)->first();
        return view('admin.group.edit', compact('group'));
    }
    
    public function update(Request $request, $id){
        $validator=$this->validateGroup($request, $id);
	if ($validator->fails()) return redirect('admin/skupiny/'.$id.'/upravit')->withErrors($validator)->withInput();
        
        DB::table('groups')->where('id', $id)->update([
				'nazov' => trim(Input::get('nazov')),
				'description' => trim(Input::get('description'))
        ]);	
        
        return redirect('admin/skupiny/'.$id.'/upravit')->with('succeed', 'Skupina bola upravená.');
    } 

    public function delete(Request $request, $id){
        if(DB::table('groups')->where('id', $id)->delete()){
            return redirect('admin/skupiny')->with('succeed', 'Skupina bola vymazaná.');
        }
        return back()->with('error', 'Skupinu sa nepodarilo vymazať.');
    }  
    
      
    public function validateGroup($request, $id="")
    {
        $messages=[
		'nazov.required'=>'Názov skupiny nemôže byť prázdny.',
		'nazov.min'=>'Názov skupiny musí obsahovať minimálne :min znakov.',
		'nazov.max'=>'Názov skupiny môže obsahovať maximálne :max znakov.',
                'nazov.unique'=>'Názov skupiny sa už v databáze nachádza.',
                'description.required'=>'Popis skupiny nemôže byť prázdny.',
		'description.min'=>'Popis skupiny musí obsahovať minimálne :min znakov.',
		'description.max'=>'Popis skupiny môže obsahovať maximálne :max znakov.',
	];
        $validator = Validator::make($request->all(), [
            'nazov' => 'required|min:5|max:150|unique:groups,nazov,'.$id.',id',
            'description' => 'required|min:10|max:150',
        ], $messages);
	return $validator;
    }
    
    //PRIDAVANIE UŽÍVATELOV DO SKUPIN
    public function user($user_id){
        if(!$user=User::where('id', $user_id)->first()) return back()->with('error', 'Užívatľ s týmto ID sa v databáze nenachádza.');
        $groups = DB::table('groups')->orderBy('nazov', 'ASC')->get();
        $groups_old = DB::table('group_join_user')->where('user_id', $user_id)->get();
        return view('admin.group.nastavit', compact('user', 'groups', 'groups_old'));
    }
    public function userSave(Request $request, $user_id){
        if(!$user=User::where('id', $user_id)->first()) return back()->with('error', 'Užívatľ s týmto ID sa v databáze nenachádza.');
        $groups = DB::table('groups')->orderBy('nazov', 'ASC')->get();
        DB::table('group_join_user')->where('user_id', $user_id)->delete();
        
        foreach($groups as $group){
            if(!empty(Input::get('group_'.$group->id))){
                DB::table('group_join_user')->insert([
                                                'user_id' => $user_id,
                                                'group_id' => $group->id,   
                                            ]);
            }
        }
        return back()->with('succeed', 'Nastavenie skupín bolo uložené.');
    }
        

    
}
