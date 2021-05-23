@extends('layouts.default')
@section('content')
<div class = "jumbotron">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading" style = "font-family: Comic Sans; font-size: 25px; margin-left: 5px;">Dashboard</div>
                <div class="panel-body">
                    <canvas id="canvas" height="280" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
    <form action="" id = "score-form">
        <div class = "row">
            <div class = "col-md-4">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="class">Select class</label>
                        <select class="form-select form-select-md" id = "class" aria-label=".form-select-lg example">
                            <option selected>Select One</option>
                            @foreach($sections as $item)
                                <option value="">{{ $item->sectionID }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class = "col-md-4">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="assessment">Select assessment</label>
                        <select class="form-select form-select-md" id = "assessment" aria-label=".form-select-lg example" disabled = "true">
                            <option selected>Select Exam Type</option>
                            @foreach($assessments as $item)
                                <option value="">{{ $item->exam_type }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class = "col-md-4">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="question">Select question</label>
                        <select class="form-select form-select-md" id = "question" aria-label=".form-select-lg example" disabled = "false">
                            <option selected>Select Question Number</option>
                            @foreach($questions as $item)
                                <option value="">{{ $item->questionID % 10 }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class = "input-group mb-3">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="outcome-grade-enabler" disabled>
                <label class="form-check-label" for="outcome-grade-enabler" id = "enabler-text">Outcome - Grade</label>
            </div> 
        </div>
        <br>
        <div>
            <button type="submit" class="btn btn-score text-center" id = "score-button" disabled = "true">Submit</button>
        </div>  
    </form>
</div>
<br>
<br>
<script type = "text/javascript">
    document.getElementById('class').addEventListener('change', function(event){
        event.preventDefault();
        
        document.getElementById('score-button').disabled = false; 
        document.getElementById('outcome-grade-enabler').disabled = false; 
        document.getElementById('assessment').disabled = false; 
        distribute(); 
    });

    document.getElementById('outcome-grade-enabler').addEventListener('change', function(event){
        event.preventDefault();  
        distribute(); 
    });

    document.getElementById('assessment').addEventListener('change', function(event){
        event.preventDefault();

        document.getElementById('question').disabled = false; 
    });

    document.getElementById('score-button').addEventListener('click', function(event){
        event.preventDefault();

        var section = document.getElementById('class').value; 
        var assessment = document.getElementById('assessment').value; 
        var question = document.getElementById('question').value; 

        console.log(section);
        console.log(assessment);
        console.log(question);
    });

    // document.getElementById('score-button').addEventListener('click', function(event){
    //     event.preventDefault();

    //     var section = document.getElementById('class').value;
    //     var assessment = document.getElementById('assessment').value;
    //     var question = document.getElementById('question').value;

    //     $.ajax({
    //         url: "{{ url('/marksheet') }}",
    //         type: "POST", 
    //         dataType: "json" , 
    //         data: {
    //             section = class,
    //             assessment = assessment, 
    //             question = question;
    //         },

    //         success: function(response)
    //         {
    //             setData();
    //             showChart();
    //         },
    //         error: function(response)
    //         {

    //         }
    //     });
    // });

    function distribute()
    {   
        document.getElementById('enabler-text').innerHTML = document.getElementById('outcome-grade-enabler').checked ? "Grade Distribution": "Outcome Distribution";
    }

    function setData()
    {
        var abscissa;
        var ordinate ;
        var barChartData = {
            labels: abscissa,
            datasets: [{
                label: 'User',
                backgroundColor: "pink",
                data: ordinate
            }]
        };
    }
    
    function showChart() 
    {
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myBar = new Chart(ctx, {
            type: 'bar',
            data: barChartData,
            options: {
                elements: {
                    rectangle: {
                        borderWidth: 2,
                        borderColor: '#c1c1c1',
                        borderSkipped: 'bottom'
                    }
                },
                responsive: true,
                title: {
                    display: true,
                    text: 'Yearly User Joined'
                }
            }
        });
    }
</script>
@stop