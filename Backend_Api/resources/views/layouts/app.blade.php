<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DashBourd</title>
    
    <link rel="stylesheet" href="{{ asset('style/style.css') }}">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<body>
    <div class="dashboard">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="logo">
                <i class="fa-solid fa-shapes"></i>
                <span>DashBoard</span>
            </div>

            <nav class="menu">
                @if (Auth::check() && Auth::user()->role === 'sudo')
                    <a href="#" class="active"><i class="fa-solid fa-users"></i> Users</a>
                @endif
                <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i
                        class="fa-solid fa-users"></i> Logout</a>
                <form action="{{ route('logout') }}" method="POST" id="logout-form" style="display: none;">
                    @csrf
                </form>
            </nav>
        </aside>

        {{ $slot }}
    </div>
    <script src="{{ asset('script/script.js') }}"></script>

</body>

</html>
