<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Reponse;
use App\Models\Test;

class StudentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $sections = DB::table('section')->select('sectionID', 'num_of_exams', 'enrolled')->get();

        return view('pages.marksheet')->with(compact($sections));
    }

    public function form()
    {
        return view('pages.marksheet'); 
    }

    public function feed(Request $request)
    {
        return response()->json('Error');
    }

    public function retrieve()
    {
        // $courseID = "CSE303";
        // $studentID = 1414732;
        // $questionID = 1; 
        // $assessmentID = 4;
        $sectionID = "CSE303.1";
        $courseID = substr($sectionID, 0, 6); 

        // $courses = DB::table('coutcome')
        //     ->where('coutcome.coutcomeID', '111')
        //     ->selectRaw('coutcomeID % 10, coutcome.co_title, coutcome.description')
        //     ->get();

        // $courses = DB::table(DB::raw('course, coutcome, syllabus'))
        //     ->where('course.courseID', $courseID)
        //     ->where('course.courseID', 'syllabus.courseID')
        //     ->whereRaw('floor(coutcome.coutcomeID / 10) = syllabus.syllabusID')
        //     ->select('course_title')
        //     ->selectRaw('coutcome.*, coutcome.coutcomeID % 10 as co_id, co_title, coutcome.description')
        //     ->get();

        // $posts = DB::table('assessment', 'section')
        //     ->where('sectionID', $sectionID)
        //     ->get();

        // dd($coutcomes);
        // $coutcome = DB::table('coutcome')->whereRaw('coutcomeID % 10 = syllabus.syllabusID')->where('syllabus.courseID', $courseID)->select('coutcomeID')->get();
        // $question = DB::table('question')->all();
        $course = DB::table('course')->select('courseID', 'course_title')->get();
        $section = DB::table('section')->select('sectionID')->get();
        $exam_type = DB::table('assessment')->where('sectionID', $sectionID)->select('assessmentID', 'exam_type')->distinct()->get();
        
        return view('pages.marksheet')->with(compact('course', 'section', 'exam_type'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
