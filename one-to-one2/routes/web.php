<?php

use Illuminate\Support\Facades\Route;
use App\http\Controllers\SaleController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('data',[SaleController::class,'index']);
