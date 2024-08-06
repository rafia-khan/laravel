<?php

use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('welcome');
// });
// Route::get('/post', function () {
//     return view('post');

//     // 3rd way_____
//     // return "<h1>our rafia</h1>";
// }); -->

// _______ 2nd way_____
// Route::view('/post','post');

// Route::get('/post/firstpost', function () {
//     return view('firstpost');
// });

// Route::get('/secondpage', function () {
//     return view('secondpage');
// });



//////Routing Parameters and constraints ////


// Route::get('/', function () {
//     return view('welcome');
// });
// Route::get('/post/{id?}', function (string $id = null) {
// if($id){
//     return "<h1>Post Id: ".$id."</h1>";
// }else {
//     return "<h1>No Id Found</h1>";
// }
// });

/////Maltipul parameters Value////

// Route::get('/', function () {
//     return view('welcome');
// });
// Route::get('/post/{id?}/comment/{commentid?}', function (string $id = null, string $comment) {
// if($id){
//     return "<h1>Post Id: ".$id."</h1> <h1>.$comment.</h2>";
// }else {
//     return "<h1>No Id Found</h1>";
// }
// });


/////whereNumber/////////

// Route::get('/', function () {
//     return view('welcome');
// });
// Route::get('/post/{id?}', function (string $id = null) {

// if($id){

//     return "<h1>Post Id: ". $id ."</h1>";

// }else {
//     return "<h1>No Id Found</h1>";
// }
// })->whereNumber('id');

//////whereAlpha/////


// Route::get('/', function () {
//     return view('welcome');
// });
// Route::get('/post/{id?}', function (string $id = null) {

// if($id){

//     return "<h1>Post Id: ". $id ."</h1>";

// }else {
//     return "<h1>No Id Found</h1>";
// }
// })->whereAlpha('id');

/////WhereAlphaNumeric////
// Route::get('/', function() {
//     return view('welcome');
// });

// Route::get('/post/{id?}', function(string $id = null){
//     if($id){
//         return "<h1>Post id : ". $id ."</h1>";
//     }else{
//         return "<h1>No ID Found</h1>";
//     }
// })->WhereAlphaNumeric('id');


//////whereIn////
// Route::get('/', function(){
//     return view('welcome');
// });

// Route::get('/post/{id?}', function(string $id = null){
//     if($id){
//         return"<h1> Post Id :". $id ."</h1>";
//     }else{
//         return "<h1>No ID FOUND</h1>";
//     }
// })->whereIn('id', ['movie', 'song', 'painting']);

//////where////
// Route::get('/', function(){
//     return view('welcome');
// });
// Route::get('/post/{id?}', function(string $id = null){
//     if($id){
//         return "<h1>POst id :". $id ."</h1>";
//     }else{
//         return "<h1>No found</h1>";
//     }
// // })->where('id', '[0-9]+');
// })->where('id', '[a-zA-Z]+');


//////multipul value////

Route::get('/', function(){
    return view('welcome');
});

Route::get('/post/{id?}/comment/{commentid?}', function(string $id = null, string $comment = null){
    if($id){
        return"<h1>Post Id :". $id ."& comment :". $comment ."</h1>";
    }else{
        return "<h1> No Id Found</h1>";
    }
})->where('id', '[0-9]+')->whereAlpha('commentid');