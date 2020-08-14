@extends('layouts.app')
@section('title', 'upraviť autora')
@section('content')
<h1>Upraviť autora: <?= $author->getName(); ?></h1>

<form action='/autor/<?= $author->id ?>/upravit' method='POST' enctype='multipart/form-data'>
    @csrf
    @method('PUT')
    <div class="form-row">
        <div class="col-3" style="text-align: center">
            <img src="/uploads/authors/<?= $author->photo ?? 'no_author.jpg' ?>" style="max-width: 200px"/>
        </div>
        <div class="col-4">
            <label for='first_name'>Meno: </label>
            <input type='text' name='first_name' value='<?= $author->first_name ?>' class="form-control{{ $errors->has('first_name') ? ' is-invalid' : '' }}">
                @if ($errors->has('first_name'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('first_name') }}</strong>
                    </span>
                @endif
                <br/>
                    <label for='middle_name'>Stredné meno: </label>
                <input type='text' name='middle_name' value='<?= $author->middle_name ?>' class="form-control{{ $errors->has('middle_name') ? ' is-invalid' : '' }}">
                @if ($errors->has('middle_name'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('middle_name') }}</strong>
                    </span>
                @endif
        </div>                
        <div class="col-5">             
            <label for='last_name' style="font-weight: bold">Priezvisko: </label>
            <input type='text' name='last_name' value='<?= $author->last_name ?>' class="form-control{{ $errors->has('last_name') ? ' is-invalid' : '' }}">
                @if ($errors->has('last_name'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('last_name') }}</strong>
                    </span>
                @endif
                <br/>
                <label for='real_name'>Skutočné meno: </label>
                <input type='text' name='real_name' value='<?= $author->real_name ?>' class="form-control{{ $errors->has('real_name') ? ' is-invalid' : '' }}">
                <small id="passwordHelpBlock" class="form-text text-muted">
                    Ak používa pseudonym.
                </small>
                    @if ($errors->has('real_name'))
                        <span class="invalid-feedback">
                        <strong>{{ $errors->first('real_name') }}</strong>
                        </span>
                    @endif               
        </div>

    </div>
    <br/>
    <div class="form-row">
        <div class="col-6">
            <label for='photo'>Fotka: </label>
            <input type='file' name='photo' value='{{ old("photo") }}' class="form-control{{ $errors->has('photo') ? ' is-invalid' : '' }}">
                @if ($errors->has('photo'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('photo') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-6">
            <label for='nation_id'>Národnosť: </label>
            <select name="nation_id" class="form-control{{ $errors->has('nation_id') ? ' is-invalid' : '' }}">
                <option value=''> --- národnosť --</option>
                <?php
                    foreach ($nations as $nation){
                        echo '<option value="'.$nation->id.'" ';
                        if($author->nation_id==$nation->id) echo 'selected';
                        echo '>'.$nation->name_nation.'</option>';
                    }
                ?>
            </select>
                @if ($errors->has('nation_id'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('nation_id') }}</strong>
                    </span>
                @endif
    </div>
    </div>
    <br/>
    <div class="form-row">
        <div class="col-4">
            <label for='birth_date'>Dátum narodenia: </label>
            <input type='date' name='birth_date' value='<?= $author->birth_date ?>' class="form-control{{ $errors->has('birth_date') ? ' is-invalid' : '' }}">
                @if ($errors->has('birth_date'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('birth_date') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-6">
            <label for='death_date'>Dátum úmrtia: </label>
            <input type='date' name='death_date' value='<?= $author->death_date ?>' class="form-control{{ $errors->has('death_date') ? ' is-invalid' : '' }}">
                @if ($errors->has('death_date'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('death_date') }}</strong>
                    </span>
                @endif
        </div>
    </div>
    <br/>
    <div class="form-row">
        <div class="col-6">
            <label for='birth_place'>Miesto narodenia: </label>
            <input type='text' name='birth_place' value='<?= $author->birth_place ?>' class="form-control{{ $errors->has('birth_place') ? ' is-invalid' : '' }}">
                @if ($errors->has('birth_place'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('birth_place') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-6">
            <label for='death_place'>Miesto úmrtia: </label>
            <input type='text' name='death_place' value='<?= $author->death_place ?>' class="form-control{{ $errors->has('death_place') ? ' is-invalid' : '' }}">
                @if ($errors->has('death_place'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('death_place') }}</strong>
                    </span>
                @endif
        </div>
    </div>
    <br/>
    <div class="form-row">
            <label for='info'>O autorovi: </label>
            <textarea name='info' onkeyup="countChar(this)" class="form-control{{ $errors->has('info') ? ' is-invalid' : '' }}" style='min-height: 150px'><?= $author->info ?></textarea>
            <p style="text-align: right" id="textNum">0/5000</p>
                @if ($errors->has('info'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('info') }}</strong>
                    </span>
                @endif        
    </div>
    <button name="submit" class="btn btn-primaty" style="margin-top: 20px;"> Uložiť </button>
</form>
<hr/>
<h2>Vymazať autora:</h2>
<form action='/autor/<?= $author->id ?>/vymazat' method='POST'>
    @csrf
    @method('DELETE')
    <button name="submit" class="btn btn-danger" onclick="return deletechecked();"> Vymazať </button>
</form>


<script>
    function deletechecked()
    {
        if(confirm("Chcete vymazať tohto autora?"))
        {
            return true;
        }
        else
        {
            return false;  
        } 
   }
   
   
    function countChar(val) {
        var len = val.value.length;
        if (len >= 5000) {
          val.value = val.value.substring(0, 5000);
        } else { 
          $('#textNum').text(len + "/5000");
        }
   };
</script>
@endsection

@section('page_menu')
    @include('author.page_menu')
@endsection

