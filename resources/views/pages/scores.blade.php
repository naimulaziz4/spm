@extends('layouts.default')
@section('content')
<div class = "jumbotron">
    <h3 id = "component-heading">Score Tracker</h3>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading" style = "font-family: Comic Sans; font-size: 25px; margin-left: 5px;"></div>
                <div class="panel-body" id = "parent-canvas">
                    <canvas style = "margin-right: 100px;" id="canvas" height="200" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
    <form action="" id = "score-form">
        <div class = "row">
            <div class = "col-md-6">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="student-list" class="form-label">Student</label>
                        <div class = "input-group mb-3">
                            <input autofocus class="form-control" list="student-options" id="selected-student" placeholder="Search studentID... ">
                            <datalist id="student-options">
                                @foreach($students as $item)
                                    <option value="{{ $item->studentID }}">{{ $item->studentID }}</option>
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
                <input class="form-check-input form-control" type="checkbox" id="output-enabler" onclick="outputEnable()" disabled>
                <label class="form-check-label" for="output-enabler" id="enabler-text">Output Toggle</label>
            </div> 
        </div>
        <div>
            <button type="submit" class="btn btn-score text-center" onclick = "generate(2)" id = "score-button" disabled = "true">Submit</button>
        </div>  
    </form>
</div>
<br>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

<script type = "text/javascript">
    window.onload = function () 
    {
        // document.getElementById('component-heading').innerHTML = "Onload in Progress"; 
        generate(0);
    }

    //Primary Event: StudentID Selection
    document.getElementById('selected-student').addEventListener('change', event => {
        event.preventDefault();
        //Enable Select Tag for Assessment
        document.getElementById('assessment').disabled = false; 
        //Enable Toggle Check for Retrieval of Outcomes:Scores
        document.getElementById('output-enabler').disabled = false; 
        outputEnable();
        //Enable Ajax Request Button
        document.getElementById('score-button').disabled = false; 
    });

    //Secondary Event: Retrieve Information
    function outputEnable() 
    {
        if(document.getElementById('output-enabler').checked)
        {
            document.getElementById('enabler-text').innerHTML = "Outcome";
            document.getElementById('assessment').value = "All Assessments";
            document.getElementById('assessment').disabled = true; 
            generate(1);
        }
        else
        {
            document.getElementById('assessment').disabled = false; 
            document.getElementById('enabler-text').innerHTML = "Score";
        }   
    }

    //Final Event: Generate Graph
    function generate(topple)
    {
        if(topple - 1)
            event.preventDefault();
        
        clearChart(); 

        var options = document.getElementById('selected-student');

        student = document.getElementById('selected-student').value; 
        assessment = document.getElementById('assessment').value; 
        indicator = (document.getElementById('output-enabler').checked ? 0: 1);

        console.log(student);
        console.log(assessment);
        console.log(indicator);
        console.log(topple);
        
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
                student:student, 
                assessment:assessment, 
                indicator:indicator, 
                topple: topple
            }, 
            success: response => {
                console.log(response);
        
                var xvalues = [];
                var yvalues = [];
                var abscissa = (indicator ? "questionID" : "coutcomeID");
                var ordinate = (indicator ? "marks_attained" : "coutcome_coverage");
                var maximum = (indicator ? response[1][0]["maximum"] : 100);

                console.log(abscissa);
                console.log(ordinate); 

                if(topple)
                {
                    for(var i = 0; i < response[0].length; i++)
                    {
                        console.log(response[0][i]);
                        if(assessment == "project")
                            xvalues.push(response[0][1][]abscissa)
                            xvalues.push((indicator ? "Q": "CO") + (response[0][i][abscissa] % 10));
                        yvalues.push(response[0][i][ordinate]);
                    }
                }
                else
                {
                    var exam_score = [];

                    for(var i = 0; i < response[0].length; i++)
                    {
                        switch(response[0]["exam_type"])
                        {
                            
                        }
                        console.log("whatever");
                    }
                }

                var barChartData = {
                    labels: (assessment == "Project" ? "p" : xvalues),
                    datasets: [{
                        label: indicator ? "Score" : "Achievement Rate",
                        data: yvalues, 
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
                console.log("The maximum for the exam is " + maximum);
                showChart(barChartData, indicator ? "Question" : "Course Outcome", indicator ? "Individual Score" : "Achievement Rate", maximum, student, assessment);
            }, 
            error: response => {
                console.log("this doesn't work!");
            }
        });
    }
    //Internal Event: Display Chart on HTML Canvas
    function showChart(new_data, x_title, y_title, maximum, title_param, title_paramToo) 
    {
        var ctx = document.getElementById("canvas").getContext("2d");
        var barChart = new Chart(ctx, {
            type: 'bar',
            data: new_data,
            options: 
            {
                elements: 
                {
                    rectangle: 
                    {
                        borderWidth: 2,
                        borderColor: "black",
                        borderSkipped: 'bottom'
                    }
                },
                legend: 
                {
                    display: false
                },
                scales: 
                {
                    xAxes: 
                    [{
                        scaleLabel: {
                            display: true, 
                            labelString: x_title
                        }
                    }],
                    yAxes: 
                    [{
                        ticks: 
                        {
                            max: maximum, 
                            min: 0
                        },
                        scaleLabel : 
                        {
                            display: true, 
                            labelString: y_title
                        }
                    }],
                    display: true, 
                    ticks: 
                    {
                        beginAtZero:true
                    }
                },
                title: 
                {
                    display: true,
                    text: "CSE303 " + (indicator ? title_paramToo + " Score Distribution": "Course Outcome Achievement Rates") + " for " + title_param, 
                    padding: 10,
                    position: 'top',
                    fontSize: 20
                }
            },
            responsive: true
        });
    }

    //External Event: Clear Chart on HTML Canvas
    function clearChart() 
    {
        var parent = document.getElementById('parent-canvas');
        var child = document.getElementById('canvas');          
        parent.removeChild(child);            
        parent.innerHTML ='<canvas id="canvas" width="600" height="200" ></canvas>';             
        return;
    }
</script>
@stop

{{-- Generate Random Color on Background-color property for chart labels --}}
{{-- var randomColor = "#000000".replace(/0/g,function(){return (~~(Math.random()*16)).toString(16);}); --}}