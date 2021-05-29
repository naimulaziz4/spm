<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UniversityController;
use App\Http\Controllers\StudentsController;
use App\Http\Controllers\ScoresController; 
use App\Http\Controllers\EnrollmentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return View::make('pages.home');
});

Route::get('/home', function (){
    return View::make('pages.home');
});

Route::get('about', function() {
    return View::make('pages.about');
});



Auth::routes();
Route::get('/login', [App\Http\Controllers\HomeController::class, 'index'])->name('home');



//Front page for Syllabus Viewer Tested
Route::get('curriculum/', [UniversityController::class, 'index']);
Route::post('/curriculum', [UniversityController::class, 'feed']);
//Front page for Score Tracker 
Route::get('/scores', [StudentsController::class, 'retrieve']);
Route::post('/scores', [StudentsController::class, 'feed']);
//Front page for Performance Indicator
Route::get('/performance', [ScoresController::class, 'retrieve']);
Route::post('/performance', [ScoresController::class, 'feed']);



//Front page for Enrollment Studies
Route::get('/enrollment', [EnrollmentController::class, 'index']);
Route::post('/enrollment', [EnrollmentController::class, 'index']);

//Front page for Marksheet Manager Running ... Insertion Based Concern
Route::get('/marksheet', [StudentsController::class, 'index']);
Route::post('/marksheet', [StudentController::class, 'form']);
