<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Reponse;

class ScoresController extends Controller
{
    public function retrieve ()
    {
        $abscissa = ['2015','2016','2017','2018','2019','2020'];

        $ordinate = [];
        foreach ($ordinate as $key => $value) {
            $ordinate[] = User::where(\DB::raw("DATE_FORMAT(created_at, '%Y')"),$value)->count();
        }

        $sections = DB::table('section')->select('sectionID', 'facultyID')->get();
        $assessments = DB::table('assessment')->select('exam_type')->distinct()->get(); 
        $questions = DB::table('question')->select('questionID')->distinct()->get();

    	return view('pages.scores')->with(compact('sections', 'assessments', 'questions'))->with('abscissa', json_encode($abscissa,JSON_NUMERIC_CHECK))->with('ordinate',json_encode($ordinate,JSON_NUMERIC_CHECK));
    }

    public function feed(Request $request)
    {
        return view('pages.scores');
    }
}