<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Phone;

class StudentController extends Controller
{
    public function index(){ 
        $students = Student::with('phone')->get();

        return $students;

        // return view('welcome',compact('students'));
    }
}
