@extends('layouts.default')
@section('content')
<br>
<br>
<div class = "m-auto w-4/5 py-24">
    <div class = "text-center">
        <h1 class = "text-5xl uppercase bold">
            Course Planner
        </h1>
    </div>
</div>
<br>
<br>
<div class = "row justify-content-md-center">
    <div class = "card col-md-5">
        <form id = "course-form" action = "" autocomplete = "off">
            {{-- Form Superset --}}
            <legend></legend>
            {{-- ENABLER form Subset 0.0: Course Entry --}}
            <div class = "row d-flex justify-content-center">
                <div class = "mb-3">
                    <label for="courseList" class="form-label">Course</label>
                    <div class = "input-group mb-3">
                        <input class="form-control" list="courseOptions" id="selected-course" placeholder="Search courseID... ">
                        <datalist id="courseOptions">
                            @foreach($course as $item)
                                <option value="{{ $item->courseID }}">
                            @endforeach
                            @foreach($course as $item)
                                <option value="{{ $item->course_title }}">
                            @endforeach
                        </datalist>
                        <span>
                            <button type="submit" class="btn course-generator" id = "generator" href="#" role="button">
                              <i class = "fa fa-search" aria-hidden = "true"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
        </form>
        <form action="" id = "assessment-form" disabled = "true">
            {{-- Form Subset 0.1: Section Entry --}}
            <legend>Assessment Entry</legend>
            <br>
            <div class = "mb-3" style = "justify-content-center; ">
                <label for="courseList" class="form-label">Section</label>
                <select class="form-select form-select-md" id = "section-selection" aria-label=".form-select-sm example" id = "section-selection" disabled = "true">
                    <option selected>Select</option>
                    @for($i = 0; $i < 6; $i++)
                        <option>{{ $i }}
                    @endfor
                </select>
            </div>
            {{-- Form Subset 0.2: Exam Type Entry --}}
            <div class = "mb-3">
                <label for="courseList" class="form-label">Assessment Type</label>
                <select class="form-select form-select-md" id = "assessment--selection" aria-label=".form-select-lg example" disabled = "true">
                    <option selected>Choose</option>
                    <option value="1">Quiz</option>
                    <option value="2">Mid</option>
                    <option value="3">Final</option>
                    <option value="3">Project</option>
                </select>
            </div>
            {{-- Form Subset 0.3: Total Questions Entry --}}
            <div class="mb-3">
                <label for="total_questions" class="form-label">Total Questions</label>
                <input type="text" class="form-control" id="total_questions-selection" aria-describedby="marks_footnote" disabled = "true">
                <div id="marks_footnote" class="form-text">
                    This field must be a positive whole number for valid consideration. 
                </div>
            </div>
            {{-- Form Subset 0.4: Total Marks Entry --}}
            <div class="mb-3">
                <label for="total_marks" class="form-label">Total Marks</label>
                <input type="text" class="form-control" id="total-marks-selection" aria-describedby="marks_footnote" disabled = "true">
                <div id="marks_footnote" class="form-text">
                    The total score must be a whole number for grade calculation procedures. 
                </div>
            </div>
            <br>
            {{-- Form Subset 0.5: Check Submission Toggle --}}
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Show Entry After Submission</label>
            </div>
            {{-- Form Subset 0.5: Submission Button --}}
            <button type="submit" class="btn btn-primary text-center">Submit</button>
        </form>
    </div>
    <div class = "col-md-1">
        <br>
    </div>
    <div class = "card col-md-5">
        {{-- Form Superset --}}
        <form id = "course-section-form" action = "" autocomplete = "off">
            <br>
            <div class = "row d-flex justify-content-center">
                {{-- ENABLER: Form Subset 1.0: Course-Section Entry --}}
                <div class = "mb-3">
                    <label for="sectionList" class="form-label">Select Course & Section</label>
                    <select class = "form-select form-select-md" id="course-section-selection" aria-label = ".form-select-lg example">
                        @foreach($section as $item)
                            <option value="{{ $item->sectionID }}">
                        @endforeach
                    </select>
                    {{-- <input class="form-control" list="sectionOptions" id="section-list" placeholder="Search courseID... " autocomplete = "off">
                    <datalist id="sectionOptions">
                       
                    </datalist> --}}
                </div>
            </div>
        </form>
        <form id = "question-form" action = "" autcomplete = "off">
            <legend>Question Mapping</legend>
            <br>
            <div class = "row d-flex justify-content-center">
                {{-- Form Subset 1.1: Assessment Number --}}
                <div class = "mb-3">
                    <label for="courseList" class="form-label">Assessment Num</label>
                    <select class="form-select form-select-md" id = "assessment-selection-too" aria-label=".form-select-lg example" disabled = "true">
                        <option selected>Choose</option>
                        @foreach($exam_type as $items)
                            <option value={{ $items->assessmentID }}>{{ $items->exam_type }}</option>
                        @endforeach
                    </select>
                </div>
                {{-- Form Subset 1.2: Course Outcome --}}
                <div class = "mb-3">
                    <label for="courseList" class="form-label">Question</label>
                    <select class="form-select form-select-md" id = "num-of-questions-selection" aria-label=".form-select-lg example" disabled = "true">
                        <option selected>Choose</option>
                        @foreach($exam_type as $items)
                            <option value={{ $items->assessmentID }}>{{ $items->exam_type }}</option>
                        @endforeach
                    </select>
                </div>
                {{-- Form Subset 1.2: Course Outcome --}}
                <div class = "mb-3">
                    <label for="courseList" class="form-label">Course Outcome</label>
                    <select class="form-select form-select-md" id = "num-of-questions-selection" aria-label=".form-select-lg example" disabled = "true">
                        <option selected>Choose</option>
                        @foreach($exam_type as $items)
                            <option value={{ $items->assessmentID }}>{{ $items->exam_type }}</option>
                        @endforeach
                    </select>
                </div>
                {{-- Form Subset 1.3 --}}
                <div class="mb-3">
                    <label for="total_marks" class="form-label">Marks Attainable</label>
                    <input type="text" class="form-control" id="total-marks-selection-too" aria-describedby="marks-footnote" disabled = "true" >
                    <div id="marks-footnote" class="form-text">
                        The total score must be a whole number for grade calculation procedures. 
                    </div>
                </div>
                {{-- Form Subset 2 --}}
                <div class="mb-3 form-check">
                    <br>
                    <input type="checkbox" class="form-check-input" id="question-form-check">
                    <label class="form-check-label" for="question-form-check">Check me out</label>
                </div>
                {{-- Form Subset 3 --}}
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
<br>
<div class = "jumbotron" style = "margin: 20px;">
    <form id = "course-section-form" action = "" autocomplete = "off">
        <legend>Student Marks Entry</legend>
        <br>
        <div class = "row d-flex justify-content-center">
            {{-- ENABLER: Form Subset 1.0: Course-Section Entry --}}
            <div class = "mb-3">
                <label for="sectionList" class="form-label">Select Course & Section</label>
                <select class = "form-select form-select-md" id="course-section-selection" aria-label = ".form-select-lg example">
                    @foreach($section as $item)
                        <option value="{{ $item->sectionID }}">
                    @endforeach
                </select>
                {{-- <input class="form-control" list="sectionOptions" id="section-list" placeholder="Search courseID... " autocomplete = "off">
                <datalist id="sectionOptions">
                   
                </datalist> --}}
            </div>
        </div>
    </form>
    <form action="">
    <legend>Marks Entry</legend>
        <br>
        <div class = "mb-3" style = "justify-content-center; ">
            <label for="courseList" class="form-label">Section</label>
            <select class="form-select form-select-md" id = "section-selection" aria-label=".form-select-sm example" id = "section-selection" disabled = "true">
                <option selected>Select</option>
                @for($i = 0; $i < 6; $i++)
                    <option>{{ $i }}
                @endfor
            </select>
        </div>
        {{-- Form Subset 0.2: Exam Type Entry --}}
        <div class = "mb-3">
            <label for="courseList" class="form-label">Assessment Type</label>
            <select class="form-select form-select-md" id = "assessment--selection" aria-label=".form-select-lg example" disabled = "true">
                <option selected>Choose</option>
                <option value="1">Quiz</option>
                <option value="2">Mid</option>
                <option value="3">Final</option>
                <option value="3">Project</option>
            </select>
        </div>
        {{-- Form Subset 0.3: Total Questions Entry --}}
        <div class="mb-3">
            <label for="total_questions" class="form-label">Total Questions</label>
            <input type="text" class="form-control" id="total_questions-selection" aria-describedby="marks_footnote" disabled = "true">
            <div id="marks_footnote" class="form-text">
                This field must be a positive whole number for valid consideration. 
            </div>
        </div>
        {{-- Form Subset 0.4: Total Marks Entry --}}
        <div class="mb-3">
            <label for="total_marks" class="form-label">Total Marks</label>
            <input type="text" class="form-control" id="total-marks-selection" aria-describedby="marks_footnote" disabled = "true">
            <div id="marks_footnote" class="form-text">
                The total score must be a whole number for grade calculation procedures. 
            </div>
        </div>
        <br>
        {{-- Form Subset 0.5: Check Submission Toggle --}}
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Show Entry After Submission</label>
        </div>
        {{-- Form Subset 0.5: Submission Button --}}
        <button type="submit" class="btn btn-primary text-center">Submit</button>
    </form>
</div>
<br>
<br>
<script type = "text/javascript">
    
    // document.getElementById('selected-course').addEventListener('change', event(function){


    // });

    document.getElementById("course-form").addEventListener("submit", function(event){
        event.preventDefault();
        
        var selected_course = document.getElementById('selected-course').value; 
        var course_options = document.getElementById('selected-course').children;
        
        console.log(selected_course);
        console.log(course_options.length);

        var flag = false; 
        for(var i = 0; i < course_options.length; i++)
        {
            console.log(course_options[i].value);
            if(course_options[i].value == selected_course)
            {
                flag = true;        
                break; 
            }
        }

        if(flag)
            alert('this works!');
        else
            alert('this does not work!');

        $.ajax({
            url: "{{ url('/marksheet') }}",
            data: {
                dept: selected-dept,
            },
            type: "POST", 
            dataType: 'json',

            success: function(response)
            {

            },
            error: function(response)
            {

            }
        });
    });

    // $('#course-form').submit(function(e) {
        
    //     e.preventDefault();

    //     var selected_course = $("#selected-cousre").val();
    //     var course_options = $('#courseOptions').val();

    //     var i; 
    //     for(i = 0; i < course_options.length; i++)
    //         if(course_options[i] == selected_course)
    //             alert('show error!');
    // });
    
    // $(document).ready(function(){

    //    console.log('This works!');

    //    $.ajaxSetup({
    //       headers: {
    //         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    //       }
    //     });

    //     var value; var selection = 0; 
    //     $('#exam-type-selection').on('change', function() {
    //         value = $(this).val();
    //         selection = 1; 
    //     });
        
        $('#num-of-questions-selection').on('change', function() {
            value = $(this).val();
            selection = 2; 
        });

        $('#section-selection').on('change', function() {
            value = $(this).val();
            selection = 3; 
        });

        $.ajax({
          url: "{{ url('/marksheet') }}",
          data: {
            value: value,
            selection: selection,
          },
          type: "POST",
          dataType: 'json',
          
          success: function (response)
          {
            console.log(response);
            if(response) 
            {
                console.log('Access this course section!')
            }
          },
          error: function(response) 
          {
            console.log("Error" + response);
          }
        });
    });

    $('#assessment-form').submit(function(e) {

    });

    $('#question-form').submit(function(e) {

    });
</script>
@stop