@extends('layouts.app')

@section('content')
<h1>Príspevky v blogu: </h1>
    <table class="table table-sm">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">názov</th>
            <th scope="col">vlozil</th>
            <th scope="col" style="width:100px">zverejnené</th>
            <th scope="col">upraviť</th>
          </tr>
        </thead>
        <tbody>
        @foreach ($blogs as $blog)
          <tr>
            <th scope="row"><?= $blog->id ?></th>
            <td><a href="{{ url('blog/'.$blog->slug) }}"><?= $blog->title ?></a></td>
            <td>{{ $blog->user->name }}</td>
            <td style="text-align: center;">
                <?php $checkImg = ($blog->is_publised==1 or $blog->publish_date>Date("Y-m-d H:i")) ? 'check.png' : 'close.png' ?>
                <img src="{{ asset('./public/images/'.$checkImg) }}" style="max-width: 30px; max-height: 30px;">
            </td>
            <td><a href='/blog/<?= $blog->id ?>/upravit'> upraviť </a></td>
          </tr> 
        @endforeach
        </tbody>
</table>
    <?= ($blogs->count()==0) ? '<span style="color:red">Zatiaľ nie sú pridané žiadne príspevky.</span>' : '' ?>
<div class="center-block">{{ $blogs->links() }}</div>
@endsection
