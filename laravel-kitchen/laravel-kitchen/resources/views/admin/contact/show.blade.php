@extends('layouts.app')

@section('title', 'Slider')

@push('css')


@endpush

@section('content')

<div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              @include('layouts.partial.msg')
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">{{$contact->subject}}</h4>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-12">
                      <strong>Name: {{ $contact->name }}</strong>
                      <strong>Email: {{ $contact->email }}</strong>
                      <strong>Message: <p>{{ $contact->message }}</p></strong>
                    </div>
                  </div>
                  <a href="{{route('contact.index')}}" class="btn btn-danger">Back</a>
                </div>
              </div>
            </div>
          </div>
        </div>
</div>

@endsection


@push('script')



@endpush