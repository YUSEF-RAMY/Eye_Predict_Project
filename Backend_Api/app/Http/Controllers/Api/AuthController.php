<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
     public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'state' => 'offline',
        ]);

        $token = $user->createToken('mobile')->plainTextToken;
        $user->update(['state' => 'online']);

        return (new UserResource($user))->additional([
            'token' => $token,
            'message' => 'Welcome, Your Registration is Successful',
        ]);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $user = User::where('email', $request->email)->first();

        if (! $user || ! Hash::check($request->password, $user->password)) {
            return response()->json(['error' => 'بيانات الدخول غير صحيحة'], 401);
        }

        $token = $user->createToken('mobile')->plainTextToken;

        $user->update(['state' => 'online']);

        return (new UserResource($user))->additional([
            'token' => $token,
            'message' => 'تم تسجيل الدخول بنجاح',
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        $request->user()->update(['state' => 'offline']);
        return response()->json(['message' => 'تم تسجيل الخروج بنجاح']);
    }
}
