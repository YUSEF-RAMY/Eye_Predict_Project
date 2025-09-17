<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Scan;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class ScanController extends Controller
{
    //Get All user data
    public function index()
    {
        $user = Auth::user();
        $images = Scan::where('user_id' , $user->id)->get();
        return $images;
    }

    public function upload(Request $request)
    {
        $request->validate([
            'left_eye' => 'required|image|mimes:jpg,png,jpeg|max:5120',
            'right_eye' => 'required|image|mimes:jpg,png,jpeg|max:5120',
        ]);

        $user = $request->user();

        $leftPath = $request->file('left_eye')->store('scans', 'public');
        $rightPath = $request->file('right_eye')->store('scans', 'public');

        $leftUrl = asset('storage/' . $leftPath);
        $rightUrl = asset('storage/' . $rightPath);

        $scan = Scan::create([
            'user_id' => $user->id,
            'left_path' => $leftUrl,
            'right_path' => $rightUrl,
            'status' => 'processing',
        ]);

        return ['Message 4U' => 'The Developer Is Waiting For The AI Team ​To Be Finished.'];
    }
}
