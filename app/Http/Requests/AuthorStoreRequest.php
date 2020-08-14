<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\AuthorUnique;

class AuthorStoreRequest extends FormRequest
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

    public function rules()
    {
        return [
            'first_name' => 'nullable|min:3|max:150',
            'middle_name' => 'nullable|min:3|max:150',
            'last_name' => 'required|min:3|max:150',
            'real_name' => 'nullable|max:150',
            'nation_id' => 'nullable|integer',
            'birth_date' => 'nullable|date',
            'birth_place' => 'nullable|min:5|max:150',
            'death_date' => 'nullable|date',
            'death_place' => 'nullable|min:5|max:150',
            'info' => 'nullable|min:10|max:5000',
            'photo' => 'nullable|image',
        ];
    }
    public function messages()
    {
        return [
            'first_name.min' => 'Meno autora musí obsahovať minimálne :min znakov.',
            'first_name.max'  => 'Meno autora môže obsahovať :max znakov.',
            'middle_name.min' => 'Stredné meno autora musí obsahovať minimálne :min znakov.',
            'middle_name.max'  => 'Stredné meno autora môže obsahovať :max znakov.',
            'last_name.min' => 'Priezvisko musí obsahovať minimálne :min znakov.',
            'last_name.max'  => 'Priezvisko môže obsahovať :max znakov.',
            'last_name.required'  => 'Priezvisko nemôže byž prázdne.',
            'nation_id.integer'  => 'Chybne vyplnená národnosť.',
            'birth_date.date'  => 'Chybne vyplnený dátum narodenia.',

            'birth_place.min'  => 'Miesto narodenia musí obsahovať minimálne :min znakov.',
            'birth_place.max'  => 'Miesto narodenia môže obsahovať :max znakov.',
            'death_date.date'  => 'Chybne vyplnený dátum úmrtia.',

            'death_place.min'  => 'Miesto úmrtia musí obsahovať minimálne :min znakov.',
            'death_place.max'  => 'Miesto úmrtia môže obsahovať :max znakov.',
            'info.min'  => 'Informácie o autorovi musí obsahovať :min znakov.',
            'info.max'  => 'Informácie o autorovi môžu obsahovať :max znakov.',
            'photo.image'  => 'Chybný formát obrázku.',
        ];
    }
}
