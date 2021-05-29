@extends('layouts.default')
@section('content')
<div class = "jumbotron">
    <h3>Performance Metrics</h3>
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-body justify-content-center">
                    <canvas id="canvas" height="280" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
    <form action="" id = "score-form">
        <div class = "row">
            <div class = "col-md-6">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="section">Select class</label>
                        <select class="form-select form-select-md form-control" id = "section" aria-label=".form-select-lg example">
                            <option selected>Select One</option>
                            @foreach($sections as $item)
                                <option value={{ $item->sectionID }}>{{ $item->sectionID }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class = "col-md-6">
                <div class = "input-group mb-3">
                    <div class = "col-md-12">
                        <label for="question">Select question</label>
                        <select class="form-select form-select-md form-control" id = "question" aria-label=".form-select-lg example" disabled = "false">
                            <option selected>Select Question Number</option>
                            @foreach($questions as $item)
                                <option value={{ $item->questionID % 10 }}>{{ $item->questionID % 10 }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class = "input-group mb-3">
            <div class="form-check form-switch">
                <input class="form-check-input form-control" type="checkbox" id="outcome-enabler" disabled>
                <label class="form-check-label" for="outcome-enabler" id = "enabler-text">PLO - CO</label>
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
    document.getElementById('section').onchange = event => {
        event.preventDefault();
        
        document.getElementById('score-button').disabled = false; 
        document.getElementById('outcome-enabler').disabled = false; 
        document.getElementById('assessment').disabled = false; 
        distribute(); 
    });

    document.getElementById('outcome-enabler').onchange = event => {
        event.preventDefault();  
        distribute(); 
    });

    document.getElementById('assessment').onchange = event => {
        event.preventDefault();

        document.getElementById('question').disabled = false; 
    });

    function distribute()
    {   
        document.getElementById('enabler-text').innerHTML = document.getElementById('outcome-grade-enabler').checked ? "Grade Distribution": "Outcome Distribution";
    }

    document.getElementById('score-button').onclick = event => {
        event.preventDefault();

        var section = document.getElementById('section').value; 
        var assessment = document.getElementById('assessment').value; 
        var question = document.getElementById('question').value; 

        console.log(section);
        console.log(assessment);
        console.log(question);

        $.ajaxSetup({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
        });
        $.ajax({
            url: "{{ url('/performance') }}", 
            type: "POST", 

            dataType: "json", 
            data: {
                section:section, 
                assessment:assessment, 
                question:question 
            }, 
            success: response => {
                console.log(response);
                // for (var i = 0 ; i < response.length ; i++) {
                //     person.push(result[i]["name"]);
                //     console.log("pushed " + result[i]["name"] );
                //     personAge.push(result[i]["age"]);
                //     console.log("pushed " + result[i]["age"] );
                //     }
                // setData(response['questionID'], response['marks_attainable'], document.getElementById('enabler-text').value.substr(0, 5));
                showChart();
            }, 
            error: response => {
                console.log("this doesn't work!");
            }
        });
    });

    function setData(abscissa, ordinate, distributive_property)
    {
        var barChartData = {
            labels: abscissa,
            datasets: [{
                label: distributive_property,
                backgroundColor: "pink",
                data: ordinate 
            }]
        };
        showChart(barChartData, "Marks");
    }
    
    function showChart(new_data, new_title) 
    {
        new_title = "Marks";
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myBar = new Chart(ctx, {
            type: 'bar',
            data: new_data,
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
                    text: new_title                }
            }
        });
    }
</script>
@stop