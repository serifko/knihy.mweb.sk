@extends('layouts.app')

@section('content')
<h1>Skupiny: </h1>
<table class="table table-sm">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">nazov: </td>
        <th scope="col">popis: </td>
        <th scope="col">upraviť: </td>
        <th scope="col">upraviť: </td>
    </tr>       
    </thead>
    <tbody>
    @foreach ($groups as $group)
        <tr>
            <th scope="row"><?= $group->id ?></th>
            <td><?= $group->nazov ?></td>
            <td><?= $group->description ?></td>
            <td><a href='/admin/skupiny/<?= $group->id ?>/upravit'> upraviť </a></td>
            <td><a href='/admin/povolenia/<?= $group->id ?>/nastavitskupinu'> oprávnenia </a></td>
        </tr>    
    @endforeach
    </tbody>
    </table>

        
        
    <?= ($groups->count()==0) ? '<span style="color:red">Zatiaľ nie sú pridané žiadne skupiny.</span>' : '' ?>
<br/><hr/>
<h2>Pridanie skupiny:</h2>
<form action='/admin/skupiny/pridat' method='POST'>
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
