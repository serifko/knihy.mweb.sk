<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BlogPostStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => 'required|min:3|max:150',
            'link_type' => 'nullable|integer',
            'link_id' => 'nullable|integer',
            'title_image' => 'nullable|image',
            'text' => 'required|min:30|max:5000',
        ];
    }
    
    public function messages()
    {
        return [
            'title.required' => 'Názov príspevku po povinný.',
            'title.min'  => 'Názov príspevku musí obsahovať minimálne :min znakov.',
            'title.max' => 'Názov príspevku môže obsahovať maximálne :max znakov.',
            'link_type.integer' => 'Chyba pri výbere typu príspevku.',
            'link_id.integer'  => 'Chyba pri výbere typu príspevku. Musíte vybrať o ktorej knihe alebo autorovi je príspevok.',
            'title_image.image'  => 'Titulný obrázov v zlom formáte.',
            'text.required' => 'Text príspevku je povinný.',
            'text.min' => 'Text príspevku musí obsahovať mnimálne :min znakov.',
            'text.max' => 'Text príspevku môže obsahovať maximálne :max znakov.',
        ];
    }
}
