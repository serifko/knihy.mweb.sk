@extends('layouts.app')

@section('content')
<h2>Upraviť skupinu: <?= $group->nazov ?></h2>
<form action='/admin/skupiny/<?= $group->id ?>/upravit' method='POST'>
    @csrf
    @method('PUT')
    <table>
        <tr>
            <td><label for='nazov'>Názov: </label></td>
            <td><input type='text' name='nazov' value='<?= $group->nazov ?>' class="form-control{{ $errors->has('nazov') ? ' is-invalid' : '' }}">
                @if ($errors->has('nazov'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('nazov') }}</strong>
                    </span>
                @endif
        </td>
        </tr>
        <tr>
            <td><label for='description'>Popis: </label></td>
            <td><input type='text' name='description' value='<?= $group->description ?>' class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}">
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
<h2>Vymazať skupinu:</h2>
<form action='/admin/skupiny/<?= $group->id ?>/vymazat' method='POST'>
    @csrf
    @method('DELETE')
    <button name="submit" class="btn btn-danger" onclick="return deletechecked();"> Vymazať </button>
</form>
<script type="text/javascript">  
    function deletechecked()
    {
        if(confirm("Chcete vymazať túto skupinu?"))
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
