<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
})->name('home');
Route::get('/about', function(){
    return view('about');
});

Route::get('/post/home', function(){
    return view('post');
})->name('mypost');
