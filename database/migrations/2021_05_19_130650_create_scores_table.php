<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('faculty', function (Blueprint $table) {
            $table->char('facultyID', 8)->primary();
            $table->string('faculty_name', 30);
            $table->string('faculty_initials', 5);
        });
        
        Schema::create('term', function (Blueprint $table) {
            $table->unsignedTinyInteger('termID')->length(1)->primary();
            $table->smallInteger('year')->length(4);
            $table->tinyInteger('trimester')->length(1);
            $table->smallInteger('enrolled')->length(5);
        });

        Schema::create('section', function (Blueprint $table) {
            $table->string('sectionID', 9)->primary();
            $table->tinyInteger('num_of_exams')->length(1);
            $table->tinyInteger('enrolled')->length(1);

            $table->char('facultyID', 8);
            $table->foreign('facultyID')->references('facultyID')->on('faculty')->onDelete('cascade');

            $table->unsignedTinyInteger('termID')->length(1);
            $table->foreign('termID')->references('termID')->on('term')->onDelete('cascade');
        });

        Schema::create('assessment', function (Blueprint $table) {
            $table->tinyInteger('assessmentID')->length(1)->primary();
            $table->string('exam_type', 10);
            $table->tinyInteger('num_of_questions')->length(1);
            $table->unsignedTinyInteger('total_marks')->length(3);
            $table->double('percentage', 4, 2);

            $table->string('sectionID', 9);
            $table->foreign('sectionID')->references('sectionID')->on('section')->onDelete('cascade');
        });

        Schema::create('question', function (Blueprint $table) {
            $table->tinyInteger('questionID')->length(1)->primary();
            $table->smallInteger('coutcomeID')->length(3);
            $table->tinyInteger('marks_attainable')->length(1);
        });        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('question');
        Schema::dropIfExists('assessment');
        Schema::dropIfExists('section');
        Schema::dropIfExists('faculty');
        Schema::dropIfExists('term');
    }
}
