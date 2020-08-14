<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class QuoteStoreRequest extends FormRequest
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
            'author_id' => 'required|integer',
            'book_id' => 'nullable|integer',
            'quoteCategory_id' => 'required|integer',
            'text' => 'required|min:10|max:2500',
        ];
    }
    
    public function messages()
    {
        return [
            'author_id.required'  => 'Musíte vyplniť autora citátu.',
            'author_id.integer' => 'Musíte vyplniť autora citátu.',
            'book_id.integer' => 'Chyba stránky, zle vyplnená kniha.',
            'quoteCategory_id.required'  => 'Kategória citátu nemôže byť prázdna.',
            'quoteCategory_id.integer' => 'Kategória citátu nemôže byť prázdna.',
            'text.required'  => 'Text citátu nemôže byť prázdny.',
            'text.min'  => 'Text citátu musí obshaovať minimálne :mn znakov.',
            'text.max'  => 'Text citátu môže obsahovať maximálne :max znakov.',
        ];
    }
}
