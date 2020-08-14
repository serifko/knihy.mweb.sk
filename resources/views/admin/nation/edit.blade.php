@extends('layouts.app')

@section('content')
<a href="{{ url('admin/narodnosti') }}"><<-- národnosti</a>
<h2>Upraviť národnosť: <?= $nation->name_nation ?></h2>
<form action='/admin/narodnosti/<?= $nation->id ?>/upravit' method='POST' enctype='multipart/form-data'>
    @csrf
    @method('PUT')
    <table>
        <tr>
            <td><label for='name_nation'>Národnosť: </label></td>
            <td><input type='text' name='name_nation' value='<?= $nation->name_nation ?>' class="form-control{{ $errors->has('name_nation') ? ' is-invalid' : '' }}">
                @if ($errors->has('name_nation'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('name_nation') }}</strong>
                    </span>
                @endif
        </td>
        </tr>
        <tr>
            <td><label for='skratka_nation'>Skratka: </label></td>
            <td><input type='text' name='skratka_nation' maxlength="6" value='<?= $nation->skratka_nation ?>' class="form-control{{ $errors->has('skratka_nation') ? ' is-invalid' : '' }}">
                @if ($errors->has('skratka_nation'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('skratka_nation') }}</strong>
                    </span>
                @endif
            </td>
        </tr>
        <tr>
            <td><label for='flag_nation'>Vlajka: </label></td>
            <td><input type='file' name='flag_nation' class="form-control{{ $errors->has('flag_nation') ? ' is-invalid' : '' }}">
                @if ($errors->has('flag_nation'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('flag_nation') }}</strong>
                    </span>
                @endif
            </td>
        </tr>
    </table>
    <button name="submit" class="btn btn-primaty"> Uložiť </button>
</form>
<hr/>
<h2>Vymazať povolenie:</h2>
<form action='/admin/narodnosti/<?= $nation->id ?>/vymazat' method='POST'>
    @csrf
    @method('DELETE')
    <button name="submit" class="btn btn-danger" onclick="return deletechecked();"> Vymazať </button>
</form>
<script type="text/javascript">  
    function deletechecked()
    {
        if(confirm("Chcete vymazať túto národnosť?"))
        {
            return true;
        }
        else
        {
            return false;  
        } 
   }
</script> 
@endsection
