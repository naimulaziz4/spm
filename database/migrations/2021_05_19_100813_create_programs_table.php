<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProgramsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('program', function (Blueprint $table) {
            $table->string('programID', 7)->primary();
            $table->string('program_name', 50);
            $table->string('program_coordinator', 30);
        });

        Schema::create('peobjective', function (Blueprint $table) {
            $table->increments('peobjectiveID');
            $table->string('objective', 30);
            $table->string('definition', 722);
            $table->tinyInteger('peo_weight')->length(4);

            $table->string('programID', 7);
            $table->foreign('programID')->references('programID')->on('program')->onDelete('cascade');
        });

        Schema::create('ploutcome', function (Blueprint $table) {
            $table->char('ploutcomeID', 1)->primary();
            $table->string('plo_title', 40);
            $table->string('details', 250);
            $table->unsignedSmallInteger('plo_weight')->length(3);
            $table->char('peo_complex', 1);
        });

        Schema::create('coutcome', function(Blueprint $table) {
            $table->unsignedSmallInteger('coutcomeID')->length(3);
            $table->string('co_title', 50);
            $table->string('description', 350);
            $table->string('plo_trace', 11);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('peobjective');
        Schema::dropIfExists('program');
        Schema::dropIfExists('ploutcome');
        Schema::dropIfExists('coutcome');
    }
}
