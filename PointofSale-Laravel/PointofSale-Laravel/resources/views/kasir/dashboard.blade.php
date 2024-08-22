@extends('layouts.master')

@section('title')
    Dashboard
@endsection

@section('breadcrumb')
    @parent
    <li class="active">Dashboard</li>
@endsection

@section('content')
<!-- Small boxes (Stat box) -->
<div class="row">
    <div class="col-lg-12">
        <div class="box">
            <div class="box-body text-center">
                <h1>WELCOME,</h1>
                <h2>You are logged in as CASHIER</h2>
                <br><br>
                <a href="{{ route('transaksi.baru') }}" class="btn btn-success btn-lg">New Transaction</a>
                <br><br><br>
            </div>
        </div>
    </div>
</div><!-- visit "codeastro" for more projects! -->
<!-- /.row (main row) -->
@endsection