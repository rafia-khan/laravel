<?php

use Illuminate\Support\Facades\Route;



// Route::get('/', function () {
//     return view('welcome');
// })->name('home');
// Route::get('/about', function(){
//     return view('about');
// });

// Route::get('/post/home', function(){
//     return view('post');
// })->name('mypost');

////Route-group////
Route::get('/', function(){
    return view('welcome');
});

route::prefix('page')->group(function(){
    Route::get('/about',function () {
        return "<h1>About Page</h1>";
    });
    
    Route::get('/gallery',function () {
        return "<h1>Gallery Page</h1>";
    });
    
    Route::get('/post/firstpost',function () {
        return "<h1>First post Page</h1>";
    });
});

Route::fallback(function(){
    return "<h1?> Page Not found</h1>";
});
