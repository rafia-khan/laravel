@extends('layouts.app')

@section('title', 'Slider Create')

@push('css')

@endpush

@section('content')

<div class="content">
	<div class="container-fluid">
    	<div class="row">
        <div class="col-md-12">
        	<div class="card">
        		<div class="card-header">
        		<div class="card-header card-header-primary">
        			<h4 class="card-title">Add New Slider</h4>
        		</div>
        	</div>
        	<div class="card-body">
            @include('layouts.partial.msg')
        		<form action="{{ route('slider.store')}}" method="POST" enctype="multipart/form-data">
        			@csrf
        			<div class="row">
        				<div class="col-md-12">
                        	<div class="form-group">
                          		<label class="bmd-label-floating">Title</label>
                          		<input type="text" class="form-control" name="title">
                        	</div>
                      	</div>
        			</div>
        			<div class="row">
        				<div class="col-md-12">
                        	<div class="form-group">
                          		<label class="bmd-label-floating">Sub Title</label>
                          		<input type="text" class="form-control" name="sub_title">
                        	</div>
                      	</div>
        			</div>
        			<div class="row">
        				<div class="col-md-12">
                      		<label class="bmd-label-floating">Image</label>
                      		<input type="file" name="image">
                      	</div>
        			</div>
        			<a href="{{ route('slider.index')}}" class="btn btn-primary">Back</a>
        			<button type="submit" class="btn btn-info">Save</button>
        		</form>
        	</div>
        	</div>
        </div>
    	</div>
	</div>
</div>


@endsection


@push('script')


@endpush