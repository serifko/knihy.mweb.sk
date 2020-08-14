<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BookStoreRequest extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'name' => 'required|min:2|max:150',
            'original_name' => 'nullable|min:3|max:150',
            'publish_year' => 'nullable|date_format:"Y"',
            'author_id' => 'required|integer',
            'about' => 'nullable|min:15|max:2500',
            'cover_img' => 'nullable|image',
            'bookCategory_' => 'nullable|array',
        ];
    }
    
    public function messages()
    {
        return [
            'name.required'  => 'Názov knihy nemôže byť prázdny.',
            'name.min' => 'Názov knihy musí obsahovať minimálne :min znakov.',
            'name.max'  => 'Názov knihy môže obsahovať :max znakov.',
            'original_name.min' => 'Originálny názov knihy musí obsahovať minimálne :min znakov.',
            'original_name.max'  => 'Originálny názov knihy  môže obsahovať :max znakov.',
            'publish_year.date_format' => 'Rok publikovania knihy  musí byť rok.',
            'author_id.required'  => 'Musíte vyplniť autora knihy.',
            'author_id.integer'  => 'Musíte vyplniť autora knihy.',
            'about.min'  => 'Informácie o autorovi musia obsahovať minimálne :min znakov.',
            'about.max'  => 'Informácie o autorovi môžu obsahovať maximálne :max znakov.',
            'cover_img.image'  => 'Obal knihy musí byť obrázok.',
        ];
    }
    
    
    
}
