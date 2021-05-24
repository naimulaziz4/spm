<nav class = "navbar fixed-top navbar-expand-lg navbar-custom">
    <div class = "container-fluid">
        <a class = "navbar-brand" href="">
            <img src="storage/app/logo.svg" alt="" width = "30">
        </a>
        <button class = "navbar-toggler" type = "button" data-bs-toggle = "collapse" data-bs-target = "#navbarSupportedContent" aria-controls = "navbarSupportedContent" aria-expanded = "false" aria-label = "Toggle navigation">
            <span class = "navbar-toggler-icon"><i class="fa fa-bars" style = "border:none;"></i></span>
        </button>
        <div class = "collapse navbar-collapse" id = "navbarSupportedContent">
            <a href="{{ url('home') }}" class = "nav-link active">Home</a>
            <a href="{{ url('curriculum') }}" class = "nav-link">Curriculum Viewer</a>
            <a href="{{ url('marksheet') }}" class = "nav-link">Course Planner</a>
            <a href="{{ url('scores') }}" class = "nav-link">Score Tracker</a></li>
            <a href="{{ url('performance') }}" class = "nav-link">Performance Metrics</a></li>
            <a href="{{ url('curriculum') }}" class = "nav-link">Enrollment Trends</a></li>
        </div>
    </div>
</nav>
<br>

{{-- <nav>
    <input type="checkbox" id= "check">
    <label for="check" class = "checkbtn">
        <i class = "fas fa-bars"></i>
    </label>
    <div class = "logo">
        <p>SPM Advanced</p>
    </div>

    <ul>
        <li><a href="" class = "active">Home</a></li>
        <li><a href="">School</a></li>
        <li><a href="">Department</a></li>
        <li><a href="">Course</a></li>
        <li><a href="">Class</a></li>
    </ul>
</nav> --}}