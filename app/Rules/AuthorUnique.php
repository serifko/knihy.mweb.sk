<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\DB;

class AuthorUnique implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($firstName="", $lastName, $birthDate="")
    {
        if(empty($birthDate)){
            if(!DB::table('authors')->where('first_name', $firstName)->where('last_name', $lastName)->first()) return false;
        }else{
            if(!DB::table('authors')->where('first_name', $firstName)->where('last_name', $lastName)->where('birth_date', $birthDate)->first()) return false;
        }
        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Tento autor sa už v databáze nachádza. Ak ide o menovca, zadajte dátum narodenia.';
    }
}
