<?php

use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserScannerController;
use App\Http\Middleware\Sudo;
use Illuminate\Support\Facades\Route;




Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/users' , [UserController::class, 'index'])->name('home');
Route::group(['middleware' => ['auth' , Sudo::class]], function () {
Route::delete('/user/{user}' , [UserController::class, 'destroy'])->name('users.destroy');
});

Route::group(['middleware' => 'auth'], function () {
//    Route::get('scanner', [UserScannerController::class, 'index'])->name('scanner.index');
});




require __DIR__.'/auth.php';
// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });
