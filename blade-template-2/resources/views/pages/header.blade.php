<h1>This is Header page</h1>


{{-- @foreach ($names as $key => $value )
    <p>{{ $key }} - {{ $value }}</p>
@endforeach --}}

@forelse ( $names as $key => $value  )
    <p>{{ $key }} - {{ $value }}</p>
@empty
       <p>No Value Found</p> 
@endforelse