<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\auth\authController;

Route::get('/', function () {
    return view('admin/index');
});

Route::get('/login', function () {
    return view('auth/signIn');
});

Route::post('/login_user', [authController::class,'loginUser']);