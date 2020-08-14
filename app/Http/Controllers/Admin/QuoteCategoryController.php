<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;


class QuoteCategoryController extends Controller
{
    
    public function index(){
        $quoteCategories = DB::table('quote_categories')->orderBy('nazov', 'ASC')->get();
        return view('admin.quotecategory.index', compact('quoteCategories'));
    }
    
    
    public function store(Request $request){
        $validator=$this->validateQuoteCategory($request);
	if ($validator->fails()) return redirect('admin/citatykategorie')->withErrors($validator)->withInput();
        DB::table('quote_categories')->insert([
                                        'nazov' => Input::get('nazov'),
                                        'slug' => str_slug(Input::get('nazov'))
                                        ]);
        return redirect('admin/citatykategorie')->with('succeed', 'Kategória citátov bola pridaná.');
    }
    
          
    public function edit($quoteCategory_id){
        if(!$quoteCategory = DB::table('quote_categories')->where('id', $quoteCategory_id)->first()) return back()->with('error', 'Kategória sa v databáze nenachádza.');
        return view('admin.quotecategory.edit', compact('quoteCategory'));       
    }
    public function update(Request $request, $quoteCategory_id){
        if(!$quoteCategory = DB::table('quote_categories')->where('id', $quoteCategory_id)->first()) return back()->with('error', 'Kategória sa v databáze nenachádza.');
        $validator=$this->validateQuoteCategory($request, $quoteCategory_id);
	if ($validator->fails()) return redirect('admin/citatykategorie/'.$quoteCategory_id.'/upravit')->withErrors($validator)->withInput();
        DB::table('quote_categories')->where('id', $quoteCategory_id)->update([
                                                    'nazov' => Input::get('nazov'),
                                                    'slug' => str_slug(Input::get('nazov'))
                                    ]);
        return redirect('admin/citatykategorie/'.$quoteCategory_id.'/upravit')->with('succeed', 'Kategória bola upravená.');
    }
            
            
    public function delete($quoteCategory_id){
        if(!$quoteCategory = DB::table('quote_categories')->where('id', $quoteCategory_id)->delete()) return back()->with('error', 'Kategória sa v databáze nenachádza.');
        return redirect('admin/citatykategorie')->with('succeed', 'Kategória bola vymazaná.');
    }
            
    
    public function validateQuoteCategory($request, $id="")
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
