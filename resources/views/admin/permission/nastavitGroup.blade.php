@extends('layouts.app')

@section('content')
<a href='/admin/skupiny'> <-- skupiny </a>
<h2>Upraviť povolenia skupiny: <?= $group->nazov ?></h2>
<form action='/admin/povolenia/<?= $group->id ?>/nastavitskupinu' method='POST'>
    @csrf
    @method('PATCH')
    @foreach($permissions as $permission)
    <div style='display: inline-block;'>
        <?php
            echo '<label for="permission_'.$permission->id.'">';
            echo '<input type="checkbox" name="permission_'.$permission->id.'" id="permission_'.$permission->id.'" ';
            foreach($permissions_old as $permission_old){
                if($permission->id == $permission_old->permission_id) echo 'checked';
            }
            echo '/> '.$permission->nazov.' ('.$permission->key.')</label>';
        ?>     
    </div>
    <br clear='all'/>
    @endforeach
    <button class='btn btn-primaty'> Uložiť </button>
</form>

@endsection
