@extends('layouts.app')

@section('content')
<a href='/admin/uzivatelia'> <-- užívatelia </a>
<h2>Upraviť skupiny: <?= $user->name ?></h2>
<form action='/admin/skupiny/<?= $user->id ?>/nastavit' method='POST'>
    @csrf
    @method('PATCH')
    @foreach($groups as $group)
    <div style='display: inline-block;'>
        <?php
            echo '<label for="group_'.$group->id.'">';
            echo '<input type="checkbox" name="group_'.$group->id.'" id="group_'.$group->id.'" ';
            foreach($groups_old as $group_old){
                if($group->id == $group_old->group_id) echo 'checked';
            }
            echo '/> '.$group->nazov.'</label>';
        ?>     
    </div>
    <br clear='all'/>
    @endforeach
    <button class='btn btn-primaty'> Uložiť </button>
</form>

@endsection
