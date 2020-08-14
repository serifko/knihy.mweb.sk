@extends('layouts.app')
@section('title', 'citáty od '.$author->getName())
@section('content')
<h1>Citáty od {{ $author->getName() }}</h1>
    @foreach($quotes as $quote)
        @include('quote._show_quote')
    @endforeach
    <?= $quotes->links() ?>
@endsection


@section('page_menu')
    @include('quote.page_menu')
@endsection