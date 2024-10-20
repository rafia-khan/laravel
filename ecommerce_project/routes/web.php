<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AuthController;

Route::get('/', function () {
    return view('admin/index');
});

Route::get('/login', function () {
    return view('auth/signIn');
});

Route::get('/creatAdmin', [AuthController::class,'creatAdmin']);