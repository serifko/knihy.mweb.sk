<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class BookCategoryController extends Controller
{
    
   
    public function index(){
        $bookCategories = DB::table('book_categories')->orderBy('nazov', 'ASC')->get();
        return view('admin.bookcategory.index', compact('bookCategories'));   
    }
    
    
    public function store(Request $request){
        $validator=$this->validateBookCategory($request);
	if ($validator->fails()) return redirect('admin/knihykategorie')->withErrors($validator)->withInput();
        DB::table('book_categories')->insert([
                                        'nazov' => Input::get('nazov'),
                                        'slug' => str_slug(Input::get('nazov'))
                                        ]);
        return redirect('admin/knihykategorie')->with('succeed', 'Kategória kníh bola pridaná.');
    }
   
    public function edit($bookCategory_id){
        if(!$bookCategory = DB::table('book_categories')->where('id', $bookCategory_id)->first()) return back()->with('error', 'Kategória sa v databáze nenachádza.');
        return view('admin.bookcategory.edit', compact('bookCategory'));       
    }
    public function update(Request $request, $bookCategory_id){
        if(!$bookCategory = DB::table('book_categories')->where('id', $bookCategory_id)->first()) return back()->with('error', 'Kategória sa v databáze nenachádza.');
        $validator=$this->validateBookCategory($request, $bookCategory_id);
	if ($validator->fails()) return redirect('admin/knihykategorie/'.$bookCategory_id.'/upravit')->withErrors($validator)->withInput();
        DB::table('book_categories')->where('id', $bookCategory_id)->update([
                                                    'nazov' => Input::get('nazov'),
                                                    'slug' => str_slug(Input::get('nazov'))
                                    ]);
        return redirect('admin/knihykategorie/'.$bookCategory_id.'/upravit')->with('succeed', 'Kategória bola upravená.');
    }
    
    
    public function delete($bookCategory_id){
        if(!$bookCategory = DB::table('book_categories')->where('id', $bookCategory_id)->first()) return back()->with('error', 'Kategória sa v databáze nenachádza.');
        DB::table('book_join_categories')->where('book_category_id', $bookCategory_id)->delete();
        DB::table('book_categories')->where('id', $bookCategory_id)->delete();
        return redirect('admin/knihykategorie')->with('succeed', 'Kategória bola vymazaná.');
    }
    
    
    
    public function validateBookCategory($request, $id="")
    {
        $messages=[
		'nazov.required'=>'Názov kategórie nemôže byť prázdny.',
		'nazov.min'=>'Názov kategórie musí obsahovať minimálne :min znakov.',
		'nazov.max'=>'Názov kategórie môže obsahovať maximálne :max znakov.',
                'nazov.unique'=>'Tento názov kategórie sa už v databáze nachádza.',
	];
        $validator = Validator::make($request->all(), [
            'nazov' => 'required|min:3|max:100|unique:book_categories,nazov,'.$id.',id',
        ], $messages);
	return $validator;
    }

    
    
}
