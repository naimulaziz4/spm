<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSegmentsTable extends Migration
{
    public function up() 
    {
        Schema::create('student', function (Blueprint $table) {
            $table->mediumInteger('studentID')->length(7)->primary();
            $table->string('student_name', 30)->nullable();
            $table->string('contact', 18)->nullable();
        });

        Schema::create('score', function (Blueprint $table) {
            $table->smallInteger('scoreID')->primary();
            
            $table->string('sectionID', 9);
            $table->foreign('sectionID')->references('sectionID')->on('section')->onDelete('cascade');
            
            $table->tinyInteger('questionID')->length(1);
            $table->foreign('questionID')->references('questionID')->on('question')->onDelete('cascade');

            $table->tinyInteger('marks_attained')->length(1); 

            $table->mediumInteger('studentID')->length(7);
            $table->foreign('studentID')->references('studentID')->on('student')->onDelete('cascade');
        });

        Schema::create('segment', function (Blueprint $table) {
            $table->increments('segment');

            $table->string('schoolID', 5);
            $table->string('deptID', 7);
            $table->string('programID', 7);
            
            $table->unsignedTinyInteger('termID')->length(1);
            $table->foreign('termID')->references('termID')->on('term')->onDelete('cascade');
            
            $table->mediumInteger('enrolled')->length(7);
        });

        Schema::create('curriculum', function (Blueprint $table) {
            $table->string('curriculumID', 10)->primary();
            $table->tinyInteger('num_of_courses')->length(1);
            $table->unsignedTinyInteger('credits_reqd')->length(1);
            $table->date('effective_date')->nullable();

            $table->string('programID', 7);
            $table->foreign('programID')->references('programID')->on('program')->onDelete('cascade');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('curriculum');
        Schema::dropIfExists('segment');
        Schema::dropIfExists('student');
        Schema::dropIfExists('score');
    }
}
