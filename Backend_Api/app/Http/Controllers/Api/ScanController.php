<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ScanController extends Controller
{
     public function upload(Request $request)
    {
        $request->validate([
            'scan' => 'required|image|mimes:jpg,png,jpeg|max:5120',
        ]);

        $path = $request->file('scan')->store('scans', 'public');

        // $resultai = Http::post('http://ai-server/analyze', ['image' => ...]);

        $aiResult = 'very good'; 

        return response()->json([
            'path' => asset('storage/'. $path),
            'result' => $aiResult,
        ]);
    }
}
