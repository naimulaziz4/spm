@extends('layouts.app')

@section('content')
<div class="container">
    <div class = "d-flex bd-highlight mb-4">
        <div class = "p-2 w-100 bd-highlight">
            <div class = "p-2 w-100 bd-highlight">
                <h2>Test AJAX Sample</h2>
            </div>
            <div class = "p-2 flex-shrink-0 bd-highlight">
                <button class = "btn-success" id ="btn-add">
                    Add Test
                </button>
            </div>
        </div>
    </div>
</div>
@endsection


{{-- <div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card">
            <div class="card-header">{{ __('Dashboard') }}</div>

            <div class="card-body">
                @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                @endif

                {{ __('You are logged in!') }}
            </div>
        </div>
    </div>
</div> --}}