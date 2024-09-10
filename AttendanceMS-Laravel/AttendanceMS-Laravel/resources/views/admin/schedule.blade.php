@extends('layouts.master')

@section('css')
    <!-- Table css -->
    <link href="{{ URL::asset('plugins/RWD-Table-Patterns/dist/css/rwd-table.min.css') }}" rel="stylesheet"
        type="text/css" media="screen">
@endsection

@section('breadcrumb')
    <div class="col-sm-6">
        <h4 class="page-title text-left">Schedules</h4>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">Schedule</a></li>
			<!-- Log on to codeastro.com for more projects! -->
 

        </ol>
    </div>
@endsection
@section('button')
    <a href="#addnew" data-toggle="modal" class="btn btn-success btn-sm btn-flat"><i class="mdi mdi-plus mr-2"></i>Add New Schedule</a>


@endsection

@section('content')
@include('includes.flash')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
				<!-- Log on to codeastro.com for more projects! -->

                    <div class="table-rep-plugin">
                        <div class="table-responsive mb-0" data-pattern="priority-columns">
                            <table id="datatable-buttons" class="table table-hover table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        
                            <thead class="thead-dark">
                                    <tr>
                                        <th data-priority="1">#</th>
                                        <th data-priority="2">Shift</th>
                                        <th data-priority="3">Time In</th>
                                        <th data-priority="4">Time Out</th>
                                        <th data-priority="5">Actions</th>
                                     

                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($schedules as $schedule)
                                        <tr>
                                            <td> {{ $schedule->id }} </td>
                                            <td> {{ $schedule->slug }} </td>
                                            <td> {{ $schedule->time_in }} </td>
                                            <td> {{ $schedule->time_out }} </td>
                                            <td>

                                                <a href="#edit{{ $schedule->slug }}" data-toggle="modal"
                                                    class="btn btn-success btn-sm edit btn-flat"><i class='fa fa-edit'></i>
                                                    </a>
                                                <a href="#delete{{ $schedule->slug }}" data-toggle="modal"
                                                    class="btn btn-danger btn-sm delete btn-flat"><i
                                                        class='fa fa-trash'></i></a>

                                            </td>
                                        </tr>
                                    @endforeach


                                </tbody>
								<!-- Log on to codeastro.com for more projects! -->
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- end col -->
    </div> <!-- end row -->

    @foreach ($schedules as $schedule)
        @include('includes.edit_delete_schedule')
    @endforeach

    @include('includes.add_schedule')

@endsection


@section('script')
    <!-- Responsive-table-->
    <script src="{{ URL::asset('plugins/RWD-Table-Patterns/dist/js/rwd-table.min.js') }}"></script>
@endsection

@section('script')
    <script>
        $(function() {
            $('.table-responsive').responsiveTable({
                addDisplayAllBtn: 'btn btn-secondary'
            });
        });
    </script>
@endsection
