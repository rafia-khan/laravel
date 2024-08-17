<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ItemController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\ContactController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('welcome');
Route::post('/reservation',[ReservationController::class, 'reserve'])->name('reservation.reserve');
Route::post('/contact', [ContactController::class, 'sendMessage'])->name('contact.send');


Route::group(['prefix'=> 'admin', 'middleware'=> 'auth'], function(){
	Route::get('dashboard', [DashboardController::class, 'index'])->name('admin.dashboard');
	Route::resource('slider', SliderController::class);
	Route::resource('category', CategoryController::class);
	Route::resource('item', ItemController::class);

	Route::get('reservation', [ReservationController::class, 'index'])->name('reservation.index');
	Route::post('reservation/{id}', [ReservationController::class, 'status'])->name('reservation.status');
	Route::delete('reservation/{id}', [ReservationController::class, 'destroy'])->name('reservation.destroy');

	Route::get('contact', [ContactController::class, 'index'])->name('contact.index');
	Route::get('contact/{id}', [ContactController::class, 'show'])->name('contact.show');
	Route::delete('contact/{id}', [ContactController::class, 'destroy'])->name('contact.destroy');
});
