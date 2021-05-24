<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Response;
use App\Models\Test;

class StudentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function retrieve()
    {
        $scores = DB::table('score')->select('studentID', 'marks_attained')->get(); 
        $assessments = DB::table('assessment')->select('assessmentID', 'exam_type')->distinct()->get();

        return view('pages.scores')->with(compact('scores', 'assessments'));

        // $courseID = "CSE303";
        // $studentID = 1414732;
        // $questionID = 1; 
        // $assessmentID = 4;

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
        
    }
    
    public function feed(Request $request)
    {
        $student = $request->student; 
        $exam_type = $request->assessment; 
        
        if($request->indicator)
        {
            $dataset = DB::select(
                DB::raw("SELECT exam_type, SC.questionID % 10 AS question_num, 
                ROUND(marks_attained / marks_attainable * 100, 2) AS score_percentage 
                FROM score AS SC, question AS Q, assessment AS A 
                WHERE SC.questionID = Q.questionID AND FLOOR(Q.questionID / 10) = A.assessmentID AND studentID = '$student'
                GROUP BY exam_type, SC.questionID;"));
        }
        else
            $dataset = DB::select(DB::raw("SELECT questionID, marks_attained from score as SC, assessment as A 
            where floor(SC.questionID / 10) = A.assessmentID and exam_type = '$exam_type' and studentID = '$student'"));
        
        // $dataset = DB::table('score')->where('studentID', $student)->select('questionID', 'marks_attained')->get(); 
        //->max('marks_attainable'); 

        $maximum = DB::select(DB::raw("SELECT MAX(marks_attainable) as maximum from question as Q, assessment as A where A.assessmentID = floor(Q.questionID / 10) and exam_type = '$exam_type'"));
        // $maximum = DB::table('question')
        //     ->join('assessment', DB::raw("floor(question.questionID / 10")), '=', 'assessmentID')
        //     ->where('exam_type', $exam_type)
        //     ->max('marks_attainable');
        return response()->json([$dataset, $maximum]);
    }

    public function index()
    {   
        $course = DB::table('course')->select('courseID', 'course_title')->get();
        $section = DB::table('section')->select('sectionID', 'num_of_exams', 'enrolled')->get();
        $exam_type = DB::table('assessment')->select('assessmentID', 'exam_type')->distinct()->get();
        
        return view('pages.marksheet')->with(compact('course', 'section', 'exam_type'));
    }

    public function form()
    {
        return view('pages.marksheet'); 
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
