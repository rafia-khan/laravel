<h1>hello</h1>

{{5 + 2}}

<br><br>

{{ "hello world" }}

<br><br>

{{ "<h1>RAFIA</h1> " }}

{!! "<h1>RAFIA KHAN</h1> " !!}

{!! "<script>alert('khan')</script>" !!}

@php
    $user ="yahooBAba" ;
@endphp

{{ $user }}

@php
    $name = ["Rafia", "Tuhin", "eShan"];
    $user = "YaBbab"
@endphp

<ul>
@foreach ($name as $n )
    <li>{{ $n }}</li>
@endforeach
</ul>

<li>{{$user}}</li>


{{-- Blade Loop Variable for @foreach   INdex--}}
@php
    $name = ["Tuly", "Eshan", "Tuhin"];
    $user = "YaBbab"
@endphp

<ul>
@foreach ($name as $n )
    <li>{{ $loop->index }} - {{ $n }}</li>
@endforeach
</ul>

<li>{{$user}}</li>

{{-- Blade Loop Variable for @foreach   iteration--}}
@php
    $name = ["Tuly", "Eshan", "Tuhin"];
    $user = "YaBbab"
@endphp

<ul>
@foreach ($name as $n )
    <li>{{ $loop->iteration }} - {{ $n }}</li>
@endforeach
</ul>



{{-- Blade Loop Variable for @foreach  Count--}}
@php
    $name = ["Tuly", "Eshan", "Tuhin"];
    $user = "YaBbab"
@endphp

<ul>
@foreach ($name as $n )
    <li>{{ $loop->parent }} - {{ $n }}</li>
@endforeach
</ul>


@php
    $name = ["Tuly", "RAfia", "Tuhin"];
    $user = "YaBbab"
@endphp

<ul>
@foreach ($name as $n )
    @if ($loop->first)
    <li style="color:brown;">{{ $n }}</li>
        @elseif ($loop->last)
        <li style="color:blue;">{{ $n }}</li>

        @else
        <li>{{ $n }}</li>
    @endif

   
@endforeach
</ul>


{{-- even/odd --}}
@php
    $name = ["Tuly", "RAfia", "Tuhin","Tuhin"];
    $user = "YaBbab"
@endphp

<ul>
@foreach ($name as $n )
    @if ($loop->even)
    <li style="color:brown;">{{ $n }}</li>
        @elseif ($loop->odd)
        <li style="color:blue;">{{ $n }}</li>
    @endif
@endforeach
</ul>
