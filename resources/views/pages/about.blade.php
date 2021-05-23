@extends('layouts.default')
@section('content')

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="{{ asset('js/todo.js') }}" defer></script>
    
    <script>
        $(function(){
            alert("Jquery works!");
        });
    </script>
    <h3>Welcome to the About page for SPM!</h3>
@stop