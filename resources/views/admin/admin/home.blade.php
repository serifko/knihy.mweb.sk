@extends('layouts.app')

@section('content')
<h2>Administrácia</h2>
<div class="row">
    <div class="col-4">
        <ul>Knihy:
            <li><a href="{{ url('/admin/knihykategorie') }}">kategórie</a></li>
        </ul>
        <ul>Citáty:
            <li><a href="{{ url('/admin/citatykategorie') }}">kategórie</a></li>
        </ul>
        <ul>Blog:
            <li><a href="{{ url('/admin/blog/zoznam') }}">zoznam</a></li>
            <li><a href="{{ url('/blog/pridat') }}">pridať</a></li>
        </ul>
    </div>
    <div class="col-4">
        <ul>Užívateľia:
    <li><a href="{{ url('/admin/uzivatelia') }}">užívatelia</a></li>
    <li><a href="{{ url('/admin/kontakty') }}">kontakty ({{ $num_contacts }})</a></li>

    </ul>
    <ul>Stránka:
        <li><a href="{{ url('/admin/novinky') }}">novinky</a></li>
        <li><a href="{{ url('/admin/narodnosti') }}">národnosti</a></li>
        <li><a href="{{ url('/admin/povolenia') }}">povolenia</a></li>
        <li><a href="{{ url('/admin/skupiny') }}">skupiny</a></li>
    </ul>
    </div>
</div>




@endsection
