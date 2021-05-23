@extends('layouts.default')
@section('content')
  <div class = "container">
    {{-- Syllabus Viewer Commence --}}
    <div class="jumbotron row justify-content-md-center">
      {{-- Input Form Commence --}}
      <div class = "col-md-4">
        <br>
        <h3 class="display-6" id = "syllabus-heading">Syllabus Viewer</h3>
        <p class="lead">Welcome to the Syllabus Viewer.</p>
        <p id = "syllabus-content"> 
        <br>
        This feature allow users to input either a course ID or a title.
        <br>
        <br>
        </p>
        <br>
        <form id = "search-form" action="">
          <select id = "program-selection" class="form-select" aria-label="Default select example">
              <option selected>Select Program</option>
              @foreach($program as $item)
                <option value={{ $item->programID }}>{{ $item->program_name }}</option>
              @endforeach
          </select>
          <br>
          <div class="input-group mb-3">
              <input type="text" id = "course-search" class="form-control" placeholder="CourseID or CourseTitle" aria-label="course" aria-describedby="course-footnote" autocomplete = "off">
              <span>
                  <button type="submit" class="btn course-generator" href="#" role="button">
                    <i class = "fa fa-search" aria-hidden = "true"></i>
                  </button>
              </span>
          </div>
          <div id="course-footnote" class="form-text"></div>
        </form>
        <br>
      </div>
      {{-- Input Form Terminate --}}
      <div class = "col-md-1"></div>
      {{-- Output Form Commence --}}
      <div class = " card col-md-7">
        <table class = "table table-info table-striped table-hover table-bordered caption-top">
          <caption>
            {{-- JQuery Complement --}}
            <div id = "coutcome-title">Course Outcome</div>
            </caption>
            <thead>
              <tr>
                  <th scope = "col">Outcome</th>
                  <th scope = "col">Title</th>
                  <th scope = "col">CO Description</th>
              </tr>
            </thead>
            <tbody id = "coutcome-tbody">{{-- Retrieve and Display Course Outcome Details --}}</tbody>
        </table>
      </div>
      {{-- Output Form Terminate --}}
    </div>
    {{-- Syllabus Viewer Jumbotron Terminate --}}
    <br>
    <br>
    {{-- PLO & PEO Accordion Commence --}}
    <div class="accordion border-dark" id="accordionFlushExample">
      {{-- PEO Accordion --}}
      <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingOne">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
            Educational Objectives for 
            @if(isset($id))
              CSE Program
            @else
              CSE Program
            @endif
          </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
          <div class="accordion-body">
            @foreach($peobjectives as $item)
              <div style = "margin: 5px;">
                <code>PEO{{ $item->peobjectiveID }}: {{ $item->objective }}</code>
                <br>
                {{ $item->definition }}
              </div>
            @endforeach
          </div>
        </div>
      </div>
      {{-- PLO Accordion --}}  
      <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingOne">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
            Learning Outcomes for CSE Program
          </button>
        </h2>
        <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
          <div class="accordion-body">
            @foreach($ploutcomes as $plout)
              <div>  
              <code>
                @if(is_numeric($plout->ploutcomeID))
                  PLO{{ $plout->ploutcomeID }}:
                @else
                  PLO{{ ord($plout->ploutcomeID) - 55 }}:
                @endif
                {{ $plout->plo_title }}
              </code>  
              <br>
              {{ $plout->details }}
              </div>
            @endforeach
          </div>
        </div>
      </div>
    </div>
    {{-- PLO & PEO Accordion Terminate --}}
    <div class = "jumbotron jumbotron-fluid row" style = "justify-content: center;">
    {{-- Output Set 1 --}}
    <div class = "card col-md-5">
      <form class="input-group mb-3 align-items-center" id = "manual-course-search">
        <div class = "input-group mb-3">
          <input type="text" id = "course-searched" class="form-control" placeholder="CourseID or CourseTitle" aria-label="course" aria-describedby="basic-addon1">
          <span>
              <button type="submit" class="btn course-generator" href="#" role="button">
                <i class = "fa fa-search" aria-hidden = "true"></i>
              </button>
          </span>
        </div>
        <div id="secondary-course-footnote" class="form-text"></div>
      </form>      
      <div class="table-title" id = "outcome-title">PLO – CO Mapping</div>
      <table class = "table table-info table-striped table-hover table-bordered align-top">
        <thead id = "outcome-thead">{{-- Retrieve and Set the Table Columns for each Course Outcome --}}</thead>
        <tbody id = "outcome-tbody">{{-- Retrieve and Display PLO - CO Mapping --}}</tbody>
      </table>
    </div>
    <div class = "col-md-1"><br></div>
    {{-- Output Set 2 --}}
    <div class = "card col-md-6">
      <form class = "input-group mb-3 align-items-center" id = "manual-program-search">
        <select id = "program-selected" class="form-select" aria-label="Default select example">
          <option selected>Select Program</option>
          @foreach($program as $item)
            <option value={{ $item->programID }}>{{ $item->program_name }}</option>
          @endforeach
        </select>
      </form>
      <div class="table-title" id = "objective-title">PEO – PLO Mapping</div>
      <table class = "table table-info table-striped table-hover table-bordered align-top">
        <thead>
          <tr>
            <th scope = "col">Outcome</th>
            <th scope = "col">Title</th>
            @foreach($peobjectives as $item)
              <th class = "align-top" scope = "col">PEO{{ $item->peobjectiveID }}</th>
            @endforeach
          </tr>
        </thead>
        <tbody>
          @foreach($ploutcomes as $item)
          <tr scope = "row">
              <td>
                @if(is_numeric($item->ploutcomeID))
                  PLO{{ $item->ploutcomeID }}
                @else
                  PLO{{ ord($item->ploutcomeID) - 55 }}
                @endif
              </td>  
              <td>{{ $item->plo_title }}</td>
              {{-- Optimized Mapping for this Curriculum --}}
              @for($i = 1; $i < 4; $i++)
                @if($item->ploutcomeID == 6) 
                  @if($i == $item->peo_complex)
                    <td>x</td>
                  @else
                    <td> </td>
                  @endif
                @elseif($i != $item->peo_complex)  
                  <td>x</td>
                @else
                  <td></td>
                @endif
              @endfor
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </div>
  <br>
  <br>
  </div>
  <script type = "text/javascript">
    //Select Tag Detector
    document.getElementById('program-selected').addEventListener('change', function(event){
      event.preventDefault();
      console.log('Still Awaiting Functionality');
    });

    //Secondary Course-Search Engine Commences
    document.getElementById('manual-course-search').addEventListener('submit', function(event){
      event.preventDefault();
      searchCourse("CSE", document.getElementById('course-searched').value, 0);
    });
    //Secondary Course-Search Engine Terminates

    //Primary Course-Search Engine Commences 
    document.getElementById('search-form').addEventListener('submit', function(event) {
        event.preventDefault();
        searchCourse(document.getElementById('program-selection').value, document.getElementById('course-search').value.toUpperCase(), 1);
    });
    //Primary Course-Search Engine Terminates

    //Ajax Controller Commences
    function searchCourse(program, course, search) 
    {
        $.ajaxSetup({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
        });
        
        $.ajax({
          url: "{{ url('/curriculum') }}",
          data: {
            program:program, 
            course:course, 
          },
          type: "POST",
          dataType: 'json',
          
          success: function (response)
          {
            // Coutcome Tbody Appending...
            var index; 
            var text = '<tr scope = "row"> ';
            for(index = 0; index < response[0].length; index++)
                text += ('<td>CO' + response[0][index]['co_id'] + '</td><td>' + response[0][index]['co_title'] + '</td><td>' + response[0][index]['co_description'] + '</td></tr>');
            
            $('#coutcome-tbody').html(text);
            // Coutcome Tbody Appended!

            // Outcome Thead Append...
            var thead_text = '<tr><th scope = "col">Outcomes</th>';
            for(index = 1; index <= response[0].length; index++)
                thead_text += ('<th class = "align-top" scope = "col">CO' + index + '</th>');
            
            text += '</tr';
            $('#outcome-thead').html(thead_text);
            // Outcome Thead Append!

            // Outcome Tbody Append...
            var tbody_text = '';
            var trace = '';
            for(index = 1; index < 14; index++)
            {
              tbody_text += '<tr scope = "row"><th>PLO';
              tbody_text += (index + '</th>');  

              response[0].forEach(trace => {
                tbody_text += '<td>';
                
                if(trace['plo_trace'].includes(String.fromCharCode((index < 10 ? 48 : 55) + index) ) ) 
                  tbody_text+= 'x';

                tbody_text += '</td>';
              });
              tbody_text += '</tr>';
            }
            $('#outcome-tbody').html(tbody_text);
            // Outcome Tbody Appended!

            // Table Titles Setting...
            if(response) 
            {
                document.getElementById((search == 0 ? 'secondary-': '') + 'course-footnote').innerHTML = '';
                document.getElementById('syllabus-heading').prepend(program + ' ');
                document.getElementById('objective-title').innerHTML = program + ' PLO - PEO Mapping';
                document.getElementById('outcome-title').innerHTML = course + ' PLO – CO Mapping';
                document.getElementById('coutcome-title').innerHTML = course + ': ' + response[1];
            }
            // Table Titles Set!
          },
          error: function(response) 
          {
            document.getElementById((search == 0 ? 'secondary-': '') + 'course-footnote').innerHTML = "The course you have entered does not exist. ";
            console.log("Error" + response);
          }
        });
        // Ajax Controller Terminates
    }
  </script>
@stop


{{-- $('#program-selection').trigger('reset');
console.log('Search Successful. '); --}}
{{-- <div class="dropdown mt-3">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
    Select a PEO
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <li><a class="dropdown-item" href="#">Design</a></li>
    <li><a class="dropdown-item" href="#">Implementation</a></li>
    <li><a class="dropdown-item" href="#">Testing</a></li>
  </ul>
</div> --}}