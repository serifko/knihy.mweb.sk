@extends('layouts.app')

@section('content')
<a href='/admin/povolenia'> <-- povolenia </a>
<h2>Upravit povolenie:</h2>
<form action='/admin/povolenia/<?= $permission->id ?>/upravit' method='POST'>
    @csrf
    @method('PUT')
    <table>
        <tr>
            <td><label for='nazov'>Názov: </label></td>
            <td><input type='text' name='nazov' value='<?= $permission->nazov ?>' class="form-control{{ $errors->has('nazov') ? ' is-invalid' : '' }}">
                @if ($errors->has('nazov'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('nazov') }}</strong>
                    </span>
                @endif            
            </td>
        </tr>
        <tr>
            <td><label for='key'>Kľúč: </label></td>
            <td><input type='text' name='key' value='<?= $permission->key ?>'  class="form-control{{ $errors->has('key') ? ' is-invalid' : '' }}">
                @if ($errors->has('key'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('key') }}</strong>
                    </span>
                @endif
            </td>
        </tr>
        <tr>
            <td><label for='description'>Popis: </label></td>
            <td><input type='text' name='description' value='<?= $permission->description ?>' class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}">
                @if ($errors->has('description'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('description') }}</strong>
                    </span>
                @endif
            </td>
        </tr>
    </table>
    <button name="submit" class="btn btn-primaty">Uložiť</button>
</form>
<hr/>
<h2>Vymazať povolenie:</h2>
<form action='/admin/povolenia/<?= $permission->id ?>/vymazat' method='POST'>
    @csrf
    @method('DELETE')
    <button name="submit" class="btn btn-danger" onclick="return deletechecked();"> Vymazať </button>
</form>
<script type="text/javascript">  
    function deletechecked()
    {
        if(confirm("Chcete vymazať toto povolenie?"))
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
