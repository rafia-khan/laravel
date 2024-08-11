@php
    $fruits =[];
@endphp


@include('pages.header', ['names' => $fruits])


<h1>This is home page</h1>

@include('pages.footer')