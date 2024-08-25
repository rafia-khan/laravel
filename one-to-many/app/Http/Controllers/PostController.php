<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;
use App\Models\Post;

class PostController extends Controller
{
    public function index(){ 

        $posts = Post::with('comments')->get();
        return $posts;
        dd($posts);
    }
}
