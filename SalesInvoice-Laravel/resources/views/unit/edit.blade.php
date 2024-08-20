@extends('layouts.master')

@section('title', 'Unit | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i> Edit Unit</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Unit</li>
                <li class="breadcrumb-item"><a href="#">Edit Unit</a></li>
            </ul>
        </div>

        @if(session()->has('message'))
            <div class="alert alert-success">
                {{ session()->get('message') }}
            </div>
        @endif

        <div class="row">
            <div class="clearix"></div>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Unit</h3>
                    <div class="tile-body">
                        <form class="row" method="POST" action="{{route('unit.update', $unit->id)}}">
                            @csrf
                            @method('PUT')
                            <div class="form-group col-md-8">
                                <label class="control-label">Unit</label>
                                <input name="name" value="{{ $unit->name }}" class="form-control @error('name') is-invalid @enderror" type="text" placeholder="Enter your name">
                                @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="form-group col-md-4 align-self-end">
                                <button class="btn btn-success" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection



