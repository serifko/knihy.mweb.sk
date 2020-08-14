<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserProfileStoreRequest extends FormRequest
{

    
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'birthday' => 'nullable|date',
        ];
    }
    
    public function messages()
    {
        return [
            'birthday.date'  => 'Dátum narodenia musí byť dátum.',
        ];
    }
}