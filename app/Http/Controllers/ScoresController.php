<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Response;


class ScoresController extends Controller
{
    public function retrieve ()
    {
        $abscissa = ['2015','2016','2017','2018','2019','2020'];
        $ordinate = [];
        // foreach ($abscissa as $key => $value) {
        //     $ordinate[] = User::where(\DB::raw("DATE_FORMAT(created_at, '%Y')"),$value)->count();
        // }

        $sections = DB::table('section')->select('sectionID', 'facultyID')->get();
        $assessments = DB::table('assessment')->select('exam_type')->distinct()->get(); 
        $questions = DB::table('question')->select('questionID')->distinct()->get();

    	return view('pages.performance')->with(compact('sections', 'assessments', 'questions'))->with('abscissa', json_encode($abscissa,JSON_NUMERIC_CHECK))->with('ordinate',json_encode($ordinate,JSON_NUMERIC_CHECK));
    }

    public function feed(Request $request)
    {
        // $dataset = DB::table('score')
        //     ->join('question', 'score.questionID', '=', 'question.questionID')
        //     ->join('assessment', DB::raw('floor(score.questionID)'), '=', 'assessment.assessmentID')
        //     ->where('assessment.sectionID', $section)
        //     ->where('exam_type', $exam_type)
        //     ->groupBy('score.questionID')
        //     ->selectRaw('score.questionID % 10 as question_num')
        //     ->selectRaw('avg(score.marks_attained) as avg_score')
        //     ->selectRaw('avg(marks_attained / marks_attainable * 100 as avg_pctg')
        //     ->get(); 
            
        // $dataset = DB::select(DB::raw(
        //     "SELECT SC.questionID % 10 AS question_num, AVG(marks_attained) AS avg_score,
        //     AVG(marks_attained) / marks_attainable * 100 AS avg_pctg 
        //     FROM score as SC, question AS Q, assessment AS A
        //     WHERE SC.questionID = Q.questionID AND FLOOR(SC.questionID / 10) = A.assessmentID 
        //     AND A.sectionID = 'CSE303.1' AND exam_type = Final' GROUP BY SC.questionID"
        // )); 

        $section = $request->section; 
        $exam_type = $request->assessment; 
        $question = $request->question;
        
        $dataset = DB::table('score')->where('sectionID', $section)->select('studentID', 'marks_attained')->get(); 

        return response()->json([$dataset]);

        // return response()->json([$section, $exam_type]);

        // $abscissa = 0; 
        // $ordinate = [];
        // foreach ($abscissa as $key => $value) {
        //     $ordinate[] = '1';
        // }
        //ajax request implementation
        // ->with('abscissa', json_encode($abscissa,JSON_NUMERIC_CHECK))->with('ordinate',json_encode($ordinate,JSON_NUMERIC_CHECK));
        
        // return response()->with('abscissa', json_encode($abscissa, JSON_NUMERIC_CHECK))->with('ordinate', json_encode($ordinate, JSON_NUMERIC_CHECK));
    }
}