@extends('layouts.app')

@section('title', 'nastavenie profilu')

@section('content')

<h1>Nastavenie profilu</h1>

<form action='/profil/nastavenie' method='POST' enctype='multipart/form-data'>
    @csrf 
    <h2>Osobné údaje</h2>
    <div class="row">
        <div class="col-2" class="text-center">
            <img src="/uploads/profiles/<?= !empty($userProfile->photo) ? $userProfile->photo : 'silueta.png' ?>" class="img-fluid rounded-circle align-middle" />
        </div>
        <div class="col-10">
            <div class="form-row">
                <div class="col-2">
                    <label for='email' class="col-sm-2 col-form-label" style='font-weight: bold'>Email: </label>
                </div>
                <div class="col-4" style="padding-left: 15px">
                    <label for='email' class="col-sm-2 col-form-label">{{ $user->email }}</label>        
                </div>
                <div class="col-6 form-group row" style="padding-left: 20px">
                    <label for="realname_pub" style='font-weight: bold' class="col-sm-6 col-form-label" title="Bude sa zobrazovať vo vašom profile.">zverejniť:</label> 
                    <select name="email_pub" class="form-control" style="max-width: 120px">
                        <option value="0" <?= $userProfile->email_pub==0 ? "selected":"" ?>> nikomu </option>
                        <option value="1 "<?= $userProfile->email_pub==1 ? "selected":"" ?>> priateľom </option>
                        <option value="2" <?= $userProfile->email_pub==2 ? "selected":"" ?>> všetkým </option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="col-2">
                    <label for='realname' class="col-sm-2 col-form-label" style='font-weight: bold'>Meno: </label>
                </div>
                <div class="col-4">
                    <input type="text" name="realname" id="realname" value="{{ $userProfile->realname }}"  class="form-control"/>
                </div>
                <div class="col-6 form-group row" style="padding-left: 20px">
                    <label for="realname_pub" style='font-weight: bold'  class="col-sm-6 col-form-label" title="Bude sa zobrazovať miesto prezývky zvolenej pri registrácii."> zverejniť: </label> 
                    <select name="realname_pub"  class="form-control" style="max-width: 120px">
                        <option value="0" <?= $userProfile->realname_pub==0 ? "selected":"" ?>> nikomu </option>
                        <option value="1 "<?= $userProfile->realname_pub==1 ? "selected":"" ?>> priateľom </option>
                        <option value="2" <?= $userProfile->realname_pub==2 ? "selected":"" ?>> všetkým </option>
                    </select>
                </div>
            </div>
            
            <div class="form-row">
                <div class="col-2">
                    <label for='birthday' class="col-sm-2 col-form-label" style='font-weight: bold'>Dátum narodenia: </label>
                </div>
                <div class="col-4">
                    <input type="date" name="birthday" id="birthday" value="{{ $userProfile->birthday }}"  class="form-control"/>
                </div>
                <div class="col-6 form-group row" style="padding-left: 20px">
                    <label for="birthday_pub" style='font-weight: bold'  class="col-sm-6 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť: </label> 
                    <select name="birthday_pub"  class="form-control" style="max-width: 120px">
                        <option value="0" <?= $userProfile->birthday_pub==0 ? "selected":"" ?>> nikomu </option>
                        <option value="1 "<?= $userProfile->birthday_pub==1 ? "selected":"" ?>> priateľom </option>
                        <option value="2" <?= $userProfile->birthday_pub==2 ? "selected":"" ?>> všetkým </option>
                    </select>
                    <br/><br/>
                    <label for="age_pub" style='font-weight: bold'  class="col-sm-6 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť vek: </label> 
                    <select name="age_pub"  class="form-control" style="max-width: 120px">
                        <option value="0" <?= $userProfile->age_pub==0 ? "selected":"" ?>> nikomu </option>
                        <option value="1 "<?= $userProfile->age_pub==1 ? "selected":"" ?>> priateľom </option>
                        <option value="2" <?= $userProfile->age_pub==2 ? "selected":"" ?>> všetkým </option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="col-2">
                    <label for='photo' class="col-sm-2 col-form-label" style='font-weight: bold'>Fotka: </label>
                </div>
                <div class="col-4">
                    <input type="file" name="photo" id="photo" class="form-control"/>
                </div>
                <div class="col-6 form-group row" style="padding-left: 20px">
                    <label for="photo_pub" style='font-weight: bold'  class="col-sm-6 col-form-label" title="Bude sa zobrazovať miesto siluety."> zverejniť: </label> 
                    <select name="photo_pub"  class="form-control" style="max-width: 120px">
                        <option value="0" <?= $userProfile->photo_pub==0 ? "selected":"" ?>> nikomu </option>
                        <option value="1 "<?= $userProfile->photo_pub==1 ? "selected":"" ?>> priateľom </option>
                        <option value="2" <?= $userProfile->photo_pub==2 ? "selected":"" ?>> všetkým </option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="form-row form-group">
        <label for="about" class="col-form-label label-primary" style='font-weight: bold'>O mne:</label>
        <textarea name="about" class="form-control" rows="4" >{{ $userProfile->about }}</textarea>
        <div class="col-12 form-group row justify-content-end" style="padding-left: 20px">
            <label for="about_pub" style='font-weight: bold'  class="col-sm-2 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť: </label> 
            <select name="about_pub"  class="form-control" style="max-width: 120px">
                <option value="0" <?= $userProfile->about_pub==0 ? "selected":"" ?>> nikomu </option>
                <option value="1 "<?= $userProfile->about_pub==1 ? "selected":"" ?>> priateľom </option>
                <option value="2" <?= $userProfile->about_pub==2 ? "selected":"" ?>> všetkým </option>
            </select>
        </div>  
    </div>

    <hr/>
    <h2>Kde ťa nájdeme</h2>
    <div class="form-row">
        <div class="col-2">
            <label for='website' class="col-sm-2 col-form-label" style='font-weight: bold'>Webstránka: </label>
        </div>
        <div class="col-4">
            <input type="url" name="website" id="website" value="{{ $userProfile->website }}" class="form-control"/>      
        </div>
        <div class="col-1">
            @if(!empty($userProfile->website))
                <a href="{{ $userProfile->website }}" target="_blank" class="col-sm-5 col-form-label" title="zobraziť webstránku">
                    <img src="{{ asset('./public/images/web.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť moju webstránku">
                </a>
            @endif
        </div>
        <div class="col-5 form-group row" style="padding-left: 20px">
            <label for="website_pub" style='font-weight: bold'  class="col-sm-5 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť: </label> 
            <select name="website_pub"  class="form-control" style="max-width: 120px">
                <option value="0" <?= $userProfile->website_pub==0 ? "selected":"" ?>> nikomu </option>
                <option value="1 "<?= $userProfile->website_pub==1 ? "selected":"" ?>> priateľom </option>
                <option value="2" <?= $userProfile->website_pub==2 ? "selected":"" ?>> všetkým </option>
            </select>
        </div>
    </div> 
    <div class="form-row">
        <div class="col-2">
            <label for='facebook' class="col-sm-2 col-form-label" style='font-weight: bold'>Facebook: </label>
        </div>
        <div class="col-4">
            <input type="text" name="facebook" id="facebook" value="{{ $userProfile->facebook }}" class="form-control"/>      
        </div>
        <div class="col-1">
            @if(!empty($userProfile->facebook))
                <a href="https://www.facebook.com/{{ $userProfile->facebook }}" target="_blank" class="col-sm-5 col-form-label" title="zobraziť facebook účet">
                    <img src="{{ asset('./public/images/facebook.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť facebook účet">
                </a>
            @endif
        </div>
        <div class="col-5 form-group row" style="padding-left: 20px">
            <label for="facebook_pub" style='font-weight: bold'  class="col-sm-5 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť: </label> 
            <select name="facebook_pub"  class="form-control" style="max-width: 120px">
                <option value="0" <?= $userProfile->facebook_pub==0 ? "selected":"" ?>> nikomu </option>
                <option value="1 "<?= $userProfile->facebook_pub==1 ? "selected":"" ?>> priateľom </option>
                <option value="2" <?= $userProfile->facebook_pub==2 ? "selected":"" ?>> všetkým </option>
            </select>
        </div>
    </div>                        
    <div class="form-row">
        <div class="col-2">
            <label for='twitter' class="col-sm-2 col-form-label" style='font-weight: bold'>Twitter: </label>
        </div>
        <div class="col-4">
            <input type="text" name="twitter" id="twitter" value="{{ $userProfile->twitter }}" class="form-control"/>      
        </div>
        <div class="col-1">
            @if(!empty($userProfile->twitter))
                <a href="https://twitter.com/{{ $userProfile->twitter }}" target="_blank" class="col-sm-5 col-form-label" title="zobraziť twitter účet">
                    <img src="{{ asset('./public/images/twitter.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť twitter účet">
                </a>
            @endif
        </div>
        <div class="col-5 form-group row" style="padding-left: 20px">
            <label for="twitter_pub" style='font-weight: bold'  class="col-sm-5 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť: </label> 
            <select name="twitter_pub"  class="form-control" style="max-width: 120px">
                <option value="0" <?= $userProfile->twitter_pub==0 ? "selected":"" ?>> nikomu </option>
                <option value="1 "<?= $userProfile->twitter_pub==1 ? "selected":"" ?>> priateľom </option>
                <option value="2" <?= $userProfile->twitter_pub==2 ? "selected":"" ?>> všetkým </option>
            </select>
        </div>
    </div>   
    <div class="form-row">
        <div class="col-2">
            <label for='instagram' class="col-sm-2 col-form-label" style='font-weight: bold'>Instagram: </label>
        </div>
        <div class="col-4">
            <input type="text" name="instagram" id="instagram" value="{{ $userProfile->instagram }}" class="form-control"/>      
        </div>
        <div class="col-1">
            @if(!empty($userProfile->instagram))
                <a href="https://www.instagram.com/{{ $userProfile->instagram }}" target="_blank" class="col-sm-5 col-form-label" title="zobraziť instagram účet">
                    <img src="{{ asset('./public/images/instagram.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť instagram účet">
                </a>
            @endif
        </div>
        <div class="col-5 form-group row" style="padding-left: 20px">
            <label for="instagram_pub" style='font-weight: bold'  class="col-sm-5 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť: </label> 
            <select name="instagram_pub"  class="form-control" style="max-width: 120px">
                <option value="0" <?= $userProfile->instagram_pub==0 ? "selected":"" ?>> nikomu </option>
                <option value="1 "<?= $userProfile->instagram_pub==1 ? "selected":"" ?>> priateľom </option>
                <option value="2" <?= $userProfile->instagram_pub==2 ? "selected":"" ?>> všetkým </option>
            </select>
        </div>
    </div>    
    <div class="form-row">
        <div class="col-2">
            <label for='tumblr' class="col-sm-2 col-form-label" style='font-weight: bold'>Tublr: </label>
        </div>
        <div class="col-4">
            <input type="text" name="tumblr" id="tumblr" value="{{ $userProfile->tumblr }}" class="form-control"/>      
        </div>
        <div class="col-1">
            @if(!empty($userProfile->tumblr))
                <a href="https://www.tumblr.com/{{ $userProfile->tumblr }}" target="_blank" class="col-sm-5 col-form-label" title="zobraziť tublr účet">
                    <img src="{{ asset('./public/images/tumblr.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť tublr účet">
                </a>
            @endif
        </div>
        <div class="col-5 form-group row" style="padding-left: 20px">
            <label for="tumblr_pub" style='font-weight: bold'  class="col-sm-5 col-form-label" title="Bude sa zobrazovať vo Vašom profile."> zverejniť: </label> 
            <select name="tumblr_pub"  class="form-control" style="max-width: 120px">
                <option value="0" <?= $userProfile->tumblr_pub==0 ? "selected":"" ?>> nikomu </option>
                <option value="1 "<?= $userProfile->tumblr_pub==1 ? "selected":"" ?>> priateľom </option>
                <option value="2" <?= $userProfile->tumblr_pub==2 ? "selected":"" ?>> všetkým </option>
            </select>
        </div>
    </div>
    <div class="form-row text-center">
        <div class="col-12">
            <button name="submit" class="btn btn-primary" style="margin-top: 20px"> ULOŽIŤ PROFIL </button>
        </div>
    </div>
</form>




@endsection
