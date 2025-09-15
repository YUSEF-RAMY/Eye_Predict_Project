<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
  public function register(Request $request)
{
    // Validation
    $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:6',
    ]);

    // إنشاء المستخدم
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
    ]);

    try {
        // إنشاء التوكن
        $token = JWTAuth::fromUser($user);

        return response()->json([
            'message' => 'تم التسجيل بنجاح ✅',
            'token' => $token,
            'user' => $user
        ], 200);

    } catch (\Exception $e) {
        // لو في مشكلة مع JWT
        return response()->json([
            'error' => 'فشل إنشاء التوكن',
            'details' => $e->getMessage()
        ], 500);
    }
}



    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['error' => 'Invalid credentials'], 401);
        }

        return response()->json(['token' => $token]);
    }
}
