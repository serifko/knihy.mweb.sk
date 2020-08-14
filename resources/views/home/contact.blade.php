@extends('layouts.app')

@section('content')
<h1>Kontakt: </h1>
<p>Pre kontaktovanie administrátora použite email <span style="font-weight: bold">kni<span style="display: none;">STOP</span>hare<span style="display: none;">STOP</span>n@kni<span style="display: none;">STOP</span>har<span style="display: none;">STOP</span>en.<span style="display: none;">STOP</span>sk</span> alebo kontaktný formulár nižšie. </p>
<form action='/kontakt' method='POST'>
    @csrf
    <table>
        <tr>
            <td style="vertical-align: top"><label for='name_nation'>Email: </label></td>
            <?php
                $email = Auth::check() ? Auth::user()->email : '';
                $email = !empty(old("email")) ? old("email") : $email;
            ?>
            <td><input type='email' name='email' value='{{ $email }}' <?= Auth::check() ? 'readonly' : ''?> class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}">
                @if ($errors->has('email'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif
        </td>
        </tr>
        <tr>
            <td style="vertical-align: top"><label for='message'>Správa: </label></td>
            <td>
                <textarea name='message' style='width:200%; height: 10em' class="form-control{{ $errors->has('message') ? ' is-invalid' : '' }}">{{ old('message') }}</textarea>
                @if ($errors->has('message'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('message') }}</strong>
                    </span>
                @endif
        <tr>
            <td style="vertical-align: top">Captcha: </td>
            <td class="form-control{{ $errors->has('g-recaptcha-response') ? ' is-invalid' : '' }}">
            {!! app('captcha')->display() !!}
            <br/>
            @if ($errors->has('g-recaptcha-response'))
                <span class="invalid-feedback">
                    <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                </span>
            @endif
        </td>
        </tr>
    </table>
    <br/>
    <button name="submit" class="btn btn-primary" style='margin-left: 150px'> Odoslať </button>
</form>
@endsection


