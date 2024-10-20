<?php

use Illuminate\Support\Facades\Route;
// use App\Http\Controllers\PostController;
use App\Http\Controllers\PostController;

Route::get('/', function () {
    return view('welcome');
    return view('welcome');
});


Route::get('/index', [PostController::class, 'index']);