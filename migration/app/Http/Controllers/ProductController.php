<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    public function show(){ 
        $products = Product::all();
        return view('welcome', compact('products'));
    }
}
