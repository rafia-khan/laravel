<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

Route::get('/', function () {
    return view('welcome');
});


// Route::get('data', [ProductController::class, 'index']);
Route::get('data', [ProductController::class, 'index']);
