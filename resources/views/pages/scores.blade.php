@extends('layouts.default')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>
                <div class="panel-body">
                    <canvas id="canvas" height="280" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<div class = "jumbotron">
    <label for="scores">Select class</label>
    <select class="form-select form-select-md" id = "dept" aria-label=".form-select-lg example">
        <option selected>Select One</option>
        <option value="">CSC303.1</option>
        <option value="">CSC303.1</option>
        <option value="">CSC303.1</option>
    </select>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script>
    setData()
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
@stop