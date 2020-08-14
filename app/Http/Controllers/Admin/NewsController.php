<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\News;
use Illuminate\Support\Facades\Validator;



class NewsController extends Controller
{
    
    public function index(){
        $news = News::orderBy('public_at', 'DESC')->paginate(5);
        return view('admin.news.index', compact('news'));
    }
    
    public function store(Request $request){
        
        $validator=$this->validateNew($request);
	if ($validator->fails()) return redirect('admin/novinky')->withErrors($validator)->withInput();
        $new = new News($request->all());
        $new->public_at = empty($request->public_at) ? Date("Y-m-d H:i:s") : trim($request->public_at);
        $new->save();
        return redirect('admin/novinky')->with('succeed', 'Novinka bola pridaná.');  
    }
    
    public function edit($new_id){
        if(!$new = News::find($new_id)) return redirect('admin/novinky')->with('error', 'Novinka s týmto ID neexistuje.');
        return view('admin.news.edit', compact('new'));
    }
    
    public function update(Request $request, $new_id){
        if(!$new = News::find($new_id)) return redirect('admin/novinky')->with('error', 'Novinka s týmto ID neexistuje.');

        $validator=$this->validateNew($request);
	if ($validator->fails()) return redirect('admin/novinky/'.$news_id.'/upravit')->withErrors($validator)->withInput();
        $new->fill($request->all());       
        $new->public_at = empty($request->public_at) ? Date("Y-m-d H:i:s") : trim($request->public_at);
        $new->save();
        
        return redirect('admin/novinky/'.$new->id.'/upravit')->with('succeed', 'Novinka bola upravená.');  
        
    }
    
    public function delete(Request $request, $new_id){
        if(!$new = News::find($new_id)) return redirect('admin/novinky')->with('error', 'Novinka s týmto ID neexistuje.');
        $new->delete();
        return redirect('admin/novinky')->with('succeed', 'Novinka bola vymazaná.');        
    }
    
    public function validateNew($request)
    {
        $messages=[
		'title.min'=>'Nadpis novinky musí mať minimálne :min znakov.',
		'title.max'=>'Nadpis novinky môže obsahovať maximálne :max znakov.',
		'text.required'=>'Text novinky nemôže byť prázdny.',
                'text.min'=>'Text novinky musí obsahovať minimálne :min znakov.',
		'text.max'=>'Text novinky môže obsahovať maximálne :max znakov.',
                'public_at.date'=>'Dátum publikovania musí byť dátum!',
	];
        $validator = Validator::make($request->all(), [
            'title' => 'nullable|min:5|max:50',
            'text' => 'required|min:10|max:1000',
            'public_at' => 'nullable|date',
        ], $messages);
	return $validator;
    }
    
}
