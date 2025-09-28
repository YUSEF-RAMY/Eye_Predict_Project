<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        $users = User::withCount('scans')->get();
        return view('dashboard' , compact('users'));
    }

    public function destroy(User $user)
    {
        if ($user->id == Auth::id()) {
        return response()->json(['error' => 'You cannot delete yourself!'], 400);
    }
        $user->delete();
        return redirect()->route('home');
    }
}
