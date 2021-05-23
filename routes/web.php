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

Route::get('about', function() {
    return View::make('pages.about');
});

Auth::routes();
Route::get('/login', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::resource('/curriculum', UniversityController::class);
Route::resource('/students', StudentsController::class);

//Front page for Syllabus Viewer Tested
Route::get('curriculum/', [UniversityController::class, 'index']);
Route::post('/curriculum', [UniversityController::class, 'feed']);

//Front page for Marksheet Manager Running ...
Route::get('/marksheet', [StudentsController::class, 'retrieve']);
Route::post('/marksheet', [StudentsController::class, 'feed']);

//Front page for Score Tracker 
Route::get('/scores', [ScoresController::class, 'retrieve']);
Route::post('/scores', [ScoresController::class, 'feed']);

//Front page for Enrollment Studies
Route::get('/enrollment', [EnrollmentController::class, 'index']);
Route::post('/enrollment', [EnrollmentController::class, 'index']);
