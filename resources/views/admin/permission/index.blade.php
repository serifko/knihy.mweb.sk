@extends('layouts.app')

@section('content')
<h1>Povolenia: </h1>
<table class="table table-sm">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">povolenie: </td>
        <th scope="col">key: </td>
        <th scope="col">popis: </td>
        <th scope="col">upraviť: </td>
    </tr>       
    </thead>
    <tbody>
    @foreach ($permissions as $permission)
        <tr>
            <th scope="row"><?= $permission->id ?></th>
            <td><?= $permission->nazov ?></td>
            <td><?= $permission->key ?></td>
            <td><?= $permission->description ?></td>
            <td><a href='/admin/povolenia/<?= $permission->id ?>/upravit'> upraviť </a></td>
        </tr>    
    @endforeach
    </tbody>
    </table>



    <?= ($permissions->count()==0) ? '<span style="color:red">Zatiaľ nie sú pridané žiadne povolenia.</span>' : '' ?>
<br/><hr/>
<h2>Pridanie povolenia:</h2>
<form action='/admin/povolenia/pridat' method='POST'>
    @csrf
    <table>
        <tr>
            <td><label for='nazov'>Názov: </label></td>
            <td><input type='text' name='nazov' value='{{ old("nazov") }}' class="form-control{{ $errors->has('nazov') ? ' is-invalid' : '' }}">
                @if ($errors->has('nazov'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('nazov') }}</strong>
                    </span>
                @endif
        </td>
        </tr>
        <tr>
            <td><label for='key'>Kľúč: </label></td>
            <td><input type='text' name='key' value='{{ old("key") }}' class="form-control{{ $errors->has('key') ? ' is-invalid' : '' }}">
                @if ($errors->has('key'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('key') }}</strong>
                    </span>
                @endif
            </td>
        </tr>
        <tr>
            <td><label for='description'>Popis: </label></td>
            <td><input type='text' name='description' value='{{ old("description") }}' class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}">
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
@endsection
