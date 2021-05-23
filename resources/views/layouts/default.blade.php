<!DOCTYPE html>
<html>
    <head>
        @include('includes.head')
    </head>
    <body>
        <header class = "row">
            @include('includes.header')
        </header>
        <div class = "container">
            @yield('content')
        </div>
        <footer class = "row">
            @include('includes.footer')
        </footer>
    </body>
</html>