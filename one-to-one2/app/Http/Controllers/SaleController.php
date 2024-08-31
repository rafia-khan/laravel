<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Sale;

class SaleController extends Controller
{
    public function index(){
        $sales = Sale::with('purchase')->get();
        return $sales;
    }
}
