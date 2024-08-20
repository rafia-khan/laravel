

@extends('layouts.master')

@section('titel', 'Sales | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')

    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Sales Table</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Sales</li>
                <li class="breadcrumb-item active"><a href="#">Sales Table</a></li>
            </ul>
        </div>
        <div class="">
            <a class="btn btn-primary" href="{{route('invoice.create')}}"><i class="fa fa-plus"></i> Create New Invoice</a>
        </div>

        <div class="row mt-2">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                            <tr>
                                <th>Product </th>
                                <th>Qty </th>
                                <th>Price</th>
                                <th>Total</th>
                                <th>Date </th>
                            </tr>
                            </thead>
                            <tbody>
            @foreach($sales as $sale)
                <tr>
                    <td>{{ $sale->product->name }}</td>
                    <td>{{ $sale->qty }}</td>
                    <td>{{ $sale->price }}</td>
                    <td>{{ $sale->amount }}</td>
                    <td>{{ $sale->created_at }}</td>
                    
                </tr>
            @endforeach
        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>



@endsection

@push('js')
    <script type="text/javascript" src="{{asset('/')}}js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="{{asset('/')}}js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
    
@endpush
