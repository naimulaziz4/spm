<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UniversityController extends Controller
{
    public function index() 
    {
        $deptID = "CSE";
        
        $ploutcomes = DB::table('ploutcome')->select('ploutcomeID', 'plo_title', 'details', 'peo_complex')->get();

        $peobjectives = DB::table('peobjective')->select('peobjectiveID', 'objective', 'definition')->get();

        $program = DB::table('program')->where('deptID', $deptID)->select('programID', 'program_name', 'deptID')->get();
        
        return view('pages.curriculum', compact('ploutcomes', 'peobjectives', 'program'));
    }

    public function feed(Request $request)
    {
        $id = $request->course; 

        $course_title = DB::table('course')->where('courseID', $id)->value('course_title');   
       
        $coutcomes = DB::select
        (
            DB::raw("SELECT CO.coutcomeID % 10 as co_id, co_title, 
            CO.description as co_description, plo_trace
            from coutcome as CO, course as C, syllabus as S 
            where FLOOR(CO.coutcomeID / 10) = S.syllabusID 
            and S.courseID = C.courseID and C.courseID = '$id'")
        );

        return response()->json([$coutcomes, $course_title]);
    }

    public function show($id)
    {
        if(strlen($id) > 3)
            $id = strtoupper($id);

        $coutcomes = DB::select(DB::raw("SELECT CO.coutcomeID % 10 as co_id, co_title, CO.description as co_description, plo_trace
        from coutcome as CO, course as C, syllabus as S 
        where FLOOR(CO.coutcomeID / 10) = S.syllabusID and S.courseID = C.courseID and C.courseID = '$id'"));

        if($course_title)
            return $this->index()->with(compact('coutcomes', 'course_title', 'id'));
        
        return $this->index();
    }

    public function school()
    {
        return view('pages/about');
    }    

    public function dept()
    {
        return view('pages/curriculum');
    }

    public function program()
    {
        return view('pages/curriculum');
    }
    public function course()
    {
        return view('pages/marksheet');
    }
}