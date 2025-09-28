<x-app-layout>
    <!-- Main Content -->
    <main class="main-content">
        <header class="header">
            <h2>User Status</h2>
            <div class="header-actions">
                <input type="text" id="tableSearch" placeholder="Search for..." />
            </div>
        </header>


        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        {{-- <th><input type="checkbox" id="selectAll" /></th> --}}
                        <th>Id</th>
                        <th>User Name</th>
                        <th>Created At</th>
                        <th>Status</th>
                        <th>Email</th>
                        <th>Number of photos</th>
                        @if (Auth::check() && Auth::user()->role === 'sudo')
                            <th>Actions</th>
                        @endif
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        @foreach ($users as $user)
                            {{-- <td><input type="checkbox" /></td> --}}
                            <td>{{ $user->id }}</td>
                            <td>{{ $user->name }}<br /></td>
                            <td>{{ $user->created_at }}</td>
                            <td>
                            @if ($user->isOnline())
                                <span class="status delivered">● Online</span>
                            @else
                                <span class="status canceled">● Offline</span>
                            @endif
                            </td>
                            <td>{{ $user->email }}</td>
                            <td style="padding-left: 50px">2 photo</td>
                            @if (Auth::check() && Auth::user()->role === 'sudo')
                                <td>
                                    <form action="{{ route('users.destroy', $user->id) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <a href="#"
                                            onclick="event.preventDefault(); this.closest('form').submit();"
                                            class="">
                                            <i class="fa-solid fa-trash" style="padding-left: 20px; color:red;"></i>
                                        </a>
                                    </form>

                                </td>
                            @endif


                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </main>
</x-app-layout>
