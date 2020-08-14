<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;

class NationController extends Controller
{
    
    public function index(){
        $nations = DB::table('nations')->orderBy('name_nation')->paginate(15);
        return view('admin.nation.index', compact('nations'));
    }
    
    public function store(Request $request){
        $validator=$this->validateNation($request);
	if ($validator->fails()) return redirect('admin/narodnosti')->withErrors($validator)->withInput();
        
        if(Input::file('flag_nation') && Input::file('flag_nation')->isValid()) {
                $destinationPath = 'uploads/nations/'; // upload path
                $extension = Input::file('flag_nation')->getClientOriginalExtension(); // getting image extension
                $fileName = str_random(40).'.'.$extension; // renameing image
                Input::file('flag_nation')->move($destinationPath, $fileName); // uploading file to given path
        }
        else{
            $fileName="";
        }
        
        DB::table('nations')->insert([
				'name_nation' => trim(Input::get('name_nation')),
				'skratka_nation' => trim(Input::get('skratka_nation')),
				'flag_nation' => $fileName
                            ]);		
        return redirect('admin/narodnosti')->with('succeed', 'Národnosť bola pridaná.');      
    }

    
    public function edit($id){
        $nation = DB::table('nations')->where('id', $id)->first();
        return view('admin.nation.edit', compact('nation'));
    }
    public function update(Request $request, $id){
        $validator=$this->validateNation($request, $id);
	if ($validator->fails()) return redirect('admin/narodnosti/'.$id.'/upravit')->withErrors($validator)->withInput();
        
        if(Input::file('flag_nation') && Input::file('flag_nation')->isValid()) {
                $destinationPath = 'uploads/nations/'; // upload path
                $extension = Input::file('flag_nation')->getClientOriginalExtension(); // getting image extension
                $fileName = str_random(40).'.'.$extension; // renameing image
                Input::file('flag_nation')->move($destinationPath, $fileName); // uploading file to given path
                DB::table('nations')->where('id', $id)->update(['flag_nation' => $fileName]);	
        }
        DB::table('nations')->where('id', $id)->update([
				'name_nation' => trim(Input::get('name_nation')),
				'skratka_nation' => trim(Input::get('skratka_nation')),
        ]);	
        
        return redirect('admin/narodnosti/'.$id.'/upravit')->with('succeed', 'Národnosť bola upravená.');
    }
    
    
    public function delete(Request $request, $id){
        if(DB::table('nations')->where('id', $id)->delete()){
            return redirect('admin/narodnosti')->with('succeed', 'Národnosť bola vymazaná.');
        }
        return back()->with('error', 'Národnosť sa nepodarilo vymazať.');
    }  
    
    
      
    public function validateNation($request, $id="")
    {
        $messages=[
		'name_nation.required'=>'Národnosť nemôže byť prázdna.',
		'name_nation.min'=>'Národnosť musí obsahovať minimálne :min znakov.',
		'name_nation.max'=>'Národnosť môže obsahovať maximálne :max znakov.',
                'name_nation.unique'=>'Takáto národnosť sa už v databáze nachádza.',
		'skratka_nation.min'=>'Skratka národnosti  musí obsahovať minimálne :min znakov.',
		'skratka_nation.max'=>'Skratka národnosti  môže obsahovať maximálne :max znakov.',
                'skratka_nation.unique'=>'Takáto skratka národnosti sa už v databáze nachádza.',
		'flag_nation.image'=>'Vlajka musí byť obrázok.',
	];
        $validator = Validator::make($request->all(), [
            'name_nation' => 'required|min:5|max:150|unique:nations,name_nation,'.$id.',id',
            'skratka_nation' => 'min:3|max:6|unique:nations,skratka_nation,'.$id.',id',
            'flag_nation' => 'image',
        ], $messages);
		return $validator;
    }
     
  
    
    
}
