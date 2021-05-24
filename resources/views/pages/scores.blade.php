@extends('layouts.default')
@section('content')
<div class = "jumbotron">
    <h3>Score Tracker</h3>
    <br>
    <br>
    <br>
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading" style = "font-family: Comic Sans; font-size: 25px; margin-left: 5px;"></div>
                <div class="panel-body" id = "parent-canvas">
                    <canvas style = "margin-right: 100px;" id="canvas" height="200" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
    <br>
    <form action="" id = "score-form">
        <div class = "row">
            <div class = "col-md-6">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="student-list" class="form-label">Student</label>
                        <div class = "input-group mb-3">
                            <input class="form-control" list="student-options" id="selected-student" placeholder="Search studentID... ">
                            <datalist id="student-options">
                                @foreach($scores as $item)
                                    <option value="{{ $item->studentID }}">
                                @endforeach
                            </datalist>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "col-md-6">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="assessment" class="form-label">Select assessment</label>
                        <select class="form-select form-select-md form-control" id = "assessment" aria-label=".form-select-lg example" disabled = "true">
                            <option selected>All Assessments</option>
                            @foreach($assessments as $key=>$item)
                                <option value={{ $item->exam_type }}>{{ $item->exam_type }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class = "input-group mb-3">
            <div class="form-check form-switch">
                <input class="form-check-input form-control" type="checkbox" id="percentage-enabler" disabled>
                <label class="form-check-label" for="percentage-enabler" id = "enabler-text">Output Toggle</label>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type = "text/javascript">
    document.getElementById('selected-student').addEventListener('change', function(event){
        event.preventDefault();
        
        document.getElementById('score-button').disabled = false; 
        document.getElementById('percentage-enabler').disabled = false; 
        document.getElementById('assessment').disabled = false; 
    });

    document.getElementById('score-button').addEventListener('click', function(event){
        event.preventDefault();
        generate(document.getElementById('selected-student').value, document.getElementById('assessment').value, 0);
    });

    document.getElementById('percentage-enabler').addEventListener('change', function(event){
        event.preventDefault();  
        document.getElementById('enabler-text').innerHTML = document.getElementById('percentage-enabler').checked ? "Percentage": "Score";
        if(!document.getElementById('percentage-enabler').disabled)
            console.log('Is this working?');
    });

    function distribute(indicator)
    {   
        
        generate(document.getElementById('selected-student').value, document.getElementById('assessment').value, );
    }

    function generate(argument, parameter, indicator)
    {
        clearChart(); 
        console.log(argument);
        console.log(parameter);
        console.log("Indicator: " + indicator);

        $.ajaxSetup({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
        });
        $.ajax({
            url: "{{ url('/scores') }}", 
            type: "POST", 

            dataType: "json", 
            data: {
                student:argument, 
                assessment:parameter, 
                indicator: indicator
            }, 
            success: function(response)
            {
                console.log(response);
        
                var abscissa = [];
                var ordinate = [];
                var maximum = response[1][0]["maximum"];
                for(var i = 0; i < response[0].length; i++)
                {
                    console.log(response[0][i]);
                    abscissa.push('Q'+ (response[0][i]["questionID"] % 10));
                    ordinate.push(response[0][i]["marks_attained"]);
                }
                var barChartData = {
                    labels: abscissa,
                    datasets: [{
                        label: "Distribution",
                        data: ordinate, 
                        backgroundColor: 
                        [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderColor:
                        [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ]    
                    }]
                };
                console.log(response);
                console.log("The maximum for the exam is " + maximum);
                showChart(barChartData, "Question", "Individual Score", maximum);
            }, 
            error: function(response)
            {
                console.log("this doesn't work!");
            }
        });
    }
    
    function showChart(new_data, x_title, y_title, maximum) 
    {
        var ctx = document.getElementById("canvas").getContext("2d");
        var barChart = new Chart(ctx, {
            type: 'bar',
            data: new_data,
            options: {
                elements: {
                    rectangle: {
                        borderWidth: 2,
                        borderColor: "black",
                        borderSkipped: 'bottom'
                    }
                },
                legend: 
                {
                    display: false
                },
                scales: {
                    xAxes: [{
                        scaleLabel: {
                            display: true, 
                            labelString: x_title
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            max: maximum, 
                            min: 0
                        },
                        scaleLabel : {
                            display: true, 
                            labelString: y_title
                        }
                    }],
                    display: true, 
                    ticks: {
                        beginAtZero:true
                    }
                }
            },
            responsive: true,
            title: {
                display: false,
                text: "Distribution"             
            }
        });
    }
    function clearChart() 
    {
        event.preventDefault();
        var parent = document.getElementById('parent-canvas');
        var child = document.getElementById('canvas');          
        parent.removeChild(child);            
        parent.innerHTML ='<canvas id="canvas" width="600" height="200" ></canvas>';             
        return;
    }
</script>
@stop