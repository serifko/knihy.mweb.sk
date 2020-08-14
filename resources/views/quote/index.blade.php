@extends('layouts.app')
@section('title', 'citáty z kníh')
@section('content')
<h1><?= $headtitle ?? 'Citáty:' ?></h1>
    @foreach($quotes as $quote)
        @include('quote._show_quote')
    @endforeach
    <?= $quotes->links() ?>
@endsection


@section('page_menu')
    @include('quote.page_menu')
@endsection