<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BookCommentRequest extends FormRequest
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
            'rating' => 'required|integer|min:0|max:5',
            'text' => 'nullable|min:10|max:1050',
        ];
    }
    
    public function messages()
    {
        return [
            'rating.required'  => 'Hodnotenie knihy nemôže byť prázdne.',
            'rating.integer' => 'Hodnotenie knihy nemôže byť prázdne.',
            'rating.min' => 'Hodnotenie knihy nemôže byť prázdne..',
            'rating.max'  => 'Hodnotenie knihy nemôže byť prázdne.',
            'text.min'  => 'Text hodnotenie musí obsahovať minimálne :min znakov.',
            'text.max' => 'Text hodnotenie môže obsahovať maximálne :max znakov.',
        ];
    }
}
