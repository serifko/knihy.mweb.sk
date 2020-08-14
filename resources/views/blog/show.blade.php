@extends('layouts.app')

@section('title', $blog->title)

@section('content')
<div style="float: right; margin-top: 15px; width:85px;" title="zobrazené {{ $blog->num_visitors }}-krát">
    <p style="text-align: center;">
        <i class="material-icons">remove_red_eye</i><br/>
        <span style="font-style: italic">{{ $blog->num_visitors }}-krát</span>
    </p>
</div>

<h1><?= $blog->title ?> </h1>
<p>
    <span>Napísal: <a href="{{ url('profil/'.$blog->user->name) }}"><?= $blog->user->getUsername() ?></a></span>
    @if(Auth::check() && Auth::user()->role>=2 or Auth::check() && $blog->user_id==Auth::id())
     - <span><a href="{{ url('blog/'.$blog->id.'/upravit') }}">upraviť príspevok</a></span>
    @endif
</p>
    @if(!empty($blog->title_image))
        <img src="uploads/blog/'.$blog->title_image.'" alt='{{ $blog->title }}' style='float: left; width: 250px; margin: 0px 10px 10px 0px;'/>
    @endif
{!! $blog->text !!}
@endsection


@section('page_menu')
    @include('blog.page_menu')
@endsection
