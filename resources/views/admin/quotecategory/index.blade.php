@extends('layouts.app')

@section('content')
<h1>Kategoórie citátov: </h1>
<table class="table table-sm">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">nazov: </td>
        <th scope="col">slug: </td>
        <th scope="col">upraviť: </td>
    </tr>       
    </thead>
    <tbody>
    @foreach($quoteCategories as $quoteCategory)
        <tr>
            <th scope="row"><?= $quoteCategory->id ?></th>
            <td><?= $quoteCategory->nazov ?></td>
            <td><?= $quoteCategory->slug ?></td>
            <td><a href='/admin/citatykategorie/<?= $quoteCategory->id ?>/upravit'> upraviť </a></td>
        </tr>    
    @endforeach
    </tbody>
    </table>
 <?= ($quoteCategories->count()==0) ? '<span style="color:red">Zatiaľ nie sú pridané žiadne kategórie citátov.</span>' : '' ?>
<br/><hr/>
<h2>Pridanie kategórie:</h2>
<form action='/admin/citatykategorie/pridat' method='POST'>
    @csrf
    <table>
        <tr>
            <td><label for='nazov'>Názov kategórie: </label></td>
            <td><input type='text' name='nazov' value='{{ old("nazov") }}' class="form-control{{ $errors->has('nazov') ? ' is-invalid' : '' }}">
                @if ($errors->has('nazov'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('nazov') }}</strong>
                    </span>
                @endif
        </td>
        </tr>
    </table>
    <button name="submit" class="btn btn-primaty">Uložiť</button>
</form>
@endsection
