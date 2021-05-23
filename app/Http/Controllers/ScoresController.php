<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ScoresController extends Controller
{
    public function retrieve ()
    {
        $abscissa = ['2015','2016','2017','2018','2019','2020'];

        $ordinate = [];
        foreach ($ordinate as $key => $value) {
            $ordinate[] = User::where(\DB::raw("DATE_FORMAT(created_at, '%Y')"),$value)->count();
        }

    	return view('pages.scores')->with('abscissa',json_encode($abscissa,JSON_NUMERIC_CHECK))->with('ordinate',json_encode($ordinate,JSON_NUMERIC_CHECK));
    }

    public function feed(Request $request)
    {
        return view('pages.scores');
    }
}