<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ScanController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Illuminate\Validation\ValidationException;


Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
Route::post('logout', [AuthController::class, 'logout']);

// scan imaga
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/get/scan' , [ScanController::class, 'index']);
    Route::post('/scan', [ScanController::class, 'upload']);
    Route::post('/logout', [AuthController::class, 'logout']);
});

//Get Token Using Sanctum
Route::post('/get/token', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
        'device_name' => 'required',
    ]);
 
    $user = User::where('email', $request->email)->first();
 
    if (! $user || ! Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['This Email Has Not Auth To See My Api'],
        ]);
    }
 
    return $user->createToken($request->device_name)->plainTextToken;
});