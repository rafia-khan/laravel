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
        			<h4 class="card-title">Add New Category</h4>
        		</div>
        	</div>
        	<div class="card-body">
            @include('layouts.partial.msg')
        		<form action="{{ route('category.store')}}" method="POST" enctype="multipart/form-data">
        			@csrf
        			<div class="row">
        				<div class="col-md-12">
                	<div class="form-group">
                  		<label class="bmd-label-floating">Name</label>
                  		<input type="text" class="form-control" name="name">
                	</div>
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