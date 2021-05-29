@extends('layouts.default')
@section('content')
    <div class = "col-md-12 justify-contente center">
        <center><h1>Welcome to the SPM Home page</h1></center>
        <br>
        <br>
        <p>Dashboard currently in development...</p>
        <br>   
        <br>
        <div class = "row">
            <div class = "col-md-6">
                <div class = "card">
                    <div>
                        <br>
                        <p>Individual PLO Rate for Program Curriculum</p>
                        <canvas style = "margin-right: 100px;" id="canvas" height="200" width="600"></canvas>
                        <br>
                        <div canvas></div>
                    </div>
                </div>
            </div>
            <div class = "col-md-6">
                <div class = "card">
                    <div>
                        <br>
                        <p>Individual PLO Achivement Rate versus Standard PLO Achievement Rate</p>
                        <canvas style = "margin-right: 100px;" id="canvas" height="200" width="600"></canvas>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <div class = "row">
            <div class = "col-md-6">
                <div class = "card">
                    <div>
                        <br>
                        <p>PEO Achievement Rate versus Standard PEO Achievement Rate</p>
                        <canvas style = "margin-right: 100px;" id="canvas" height="200" width="600"></canvas>
                        <br>
                    </div>
                </div>
            </div>
            <div class = "col-md-6">
                <div class = "card">
                    <div>
                        <br>
                        <p>Top 10 Outcomes Achieved</p>
                        <br>
                        <ul>
                            @for($i = 0; $i < 10; $i++)
                                <li>{{ $i }}li</li>
                            @endfor
                        </ul>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
    </div>
@stop