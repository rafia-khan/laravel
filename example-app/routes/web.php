<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/post', function () {
    return view('post');

    // 3rd way_____
    // return "<h1>our rafia</h1>";
});

// _______ 2nd way_____
// Route::view('post','/post');

Route::get('/post/firstpost', function () {
    return view('firstpost');
});

Route::get('/secondpage', function () {
    return view('secondpage');
});