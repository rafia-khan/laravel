@include('layouts.welcome')
  
    <div class="flex-center position-ref full-height">
        @if (Route::has('login'))
        <div class="top-right links color-white">
            @auth
            <a href="{{ url('/admin') }}">Admin</a>
            @else
            <a class="btn btn-secondary btn-md" style="color: white" href="{{ route('login') }}">Go To Login Panel</a>

            @if (Route::has('register'))
            <a href="{{ route('register') }}">Register</a>
            @endif
            @endauth
        </div>
        @endif

        <div class="content">
            <div class="title m-b-md">
                <h1 class="text-center">Welcome to Simple Attendance System</h5>
                <div class="clockStyle" id="clock">123</div>
            </div>

            
        </div>
    </div>

