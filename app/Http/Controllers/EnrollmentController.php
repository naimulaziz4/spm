<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EnrollmentController extends Controller
{
    public function index() 
    {
        return view('pages.enrollment');
    }
    
    public function feed()
    {
        return view('pages.enrollment');
    }
}
