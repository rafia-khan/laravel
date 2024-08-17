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
        			<h4 class="card-title">Edit Category</h4>
        		</div>
        	</div>
        	<div class="card-body">
            @include('layouts.partial.msg')
        		<form action="{{ route('category.update', $category->id) }}" method="POST" enctype="multipart/form-data">
        			@csrf
                    @method('PUT')
        			<div class="row">
        				<div class="col-md-12">
                	<div class="form-group">
                  		<label class="bmd-label-floating">Name</label>
                  		<input type="text" class="form-control" name="name" value="{{ $category->name }}">
                	</div>
              	</div>
        			</div>
        			<a href="{{ route('category.index')}}" class="btn btn-primary">Back</a>
        			<button type="submit" class="btn btn-info">Update</button>
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