@extends('layouts.app')

@section('content')
<h1>Knihy - kategórie: upraviť <?= $bookCategory->nazov ?></h1>
<a href="{{ url('admin/knihykategorie') }}"><<<--- kategórie kníh</a>
<form action='/admin/knihykategorie/<?= $bookCategory->id ?>/upravit' method='POST' enctype='multipart/form-data'>
    @csrf
    @method('PUT')
    <table>
        <tr>
            <td><label for='nazov'>Názov kategórie: </label></td>
            <td><input type='text' name='nazov' value='<?= $bookCategory->nazov ?>' class="form-control{{ $errors->has('nazov') ? ' is-invalid' : '' }}">
                @if ($errors->has('nazov'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('nazov') }}</strong>
                    </span>
                @endif
        </td>
        </tr> 
    </table>
    <button name="submit" class="btn btn-primaty"> Uložiť </button>
</form>
<hr/>
<h2>Vymazať kategóriu:</h2>
<form action='/admin/knihykategorie/<?= $bookCategory->id ?>/vymazat' method='POST'>
    @csrf
    @method('DELETE')
    <button name="submit" class="btn btn-danger" onclick="return deletechecked();"> Vymazať </button>
</form>
<script type="text/javascript">  
    function deletechecked()
    {
        if(confirm("Chcete vymazať túto kategóriu?"))
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
