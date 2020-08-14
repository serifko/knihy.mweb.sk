@extends('layouts.app')
@section('title', 'citát od '.$quote->author->getName())
@section('content')
<h2>Citát od <a href="{{ url('autor/'.$quote->author->slug) }}">{{ $quote->author->getName() }}</a></h2>
@if(!empty($quote->book_id))
<h3>z knihy <a href="{{ url('kniha/'.$quote->book->slug) }}" title="kniha {{ $quote->book->name }}">{{ $quote->book->name }}</a></h3>
@endif
<div class='row'>
    <div class='col-10'>
        <blockquote class="blockquote">
        <q class="mb-0 quote" style='font-style: italic;'>{{ $quote->text }}</q> 
   </blockquote>
   </div>
   <div class="col-2">
       <div class="fb-like" data-href="{{ url('citat/'.$quote->id) }}" data-layout="box_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>

   </div>
</div>
@endsection
