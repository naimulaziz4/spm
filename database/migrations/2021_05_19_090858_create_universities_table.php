<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUniversitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('university', function(Blueprint $table) {
            $table->string('universityID', 10)->primary();
            $table->string('university_name', 50);
            $table->string('vice_chancellor', 30);
            $table->unsignedMediumInteger('enrolled')->length(6);
        });
        
        Schema::create('school', function (Blueprint $table) {
            $table->string('schoolID', 5)->primary();
            $table->string('school_name', 50);
            $table->string('dean', 30);
        });

        Schema::create('dept', function (Blueprint $table) {
            $table->string('deptID', 7)->primary();
            $table->string('dept_name', 50);
            $table->string('head', 30);
            
            $table->string('schoolID', 5);
            $table->foreign('schoolID')->references('schoolID')->on('school')->onDelete('cascade');
        });

        Schema::create('course', function (Blueprint $table) {
            $table->string('courseID', 7)->primary();
            $table->string('course_title', 50);
            $table->string('course_type', 10);
            $table->tinyInteger('sections');

            $table->string('deptID', 7); 
            $table->foreign('deptID')->references('deptID')->on('dept')->onDelete('cascade');
        });

        Schema::create('syllabus', function(Blueprint $table) {
            $table->string('syllabusID')->primary();
            $table->tinyInteger('num_of_outcomes')->length(1);

            $table->string('courseID');
            $table->foreign('courseID')->references('courseID')->on('course');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('universities');
        Schema::dropIfexists('syllabus');
        Schema::dropIfExists('course');
        Schema::dropIfExists('dept');
        Schema::dropIfExists('school');
    }
}
