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
        $images = Scan::where('user_id', $user->id)
            ->select(['id', 'user_id', 'image as photo' , 'ai_response'])->get()
            ->map(function($scan){
        if (is_array($scan->ai_response)) {
            $ai = $scan->ai_response;
        } else {
            $ai = json_decode($scan->ai_response, true);
        }
                return [
                    'id'      => $scan->id,
                    'user_id' => $scan->user_id,
                    'photo'   => $scan->photo,
                    'predicted_class' => $ai['predicted_class'] ?? null,
                    'confidence'      => isset($ai['confidence']) 
                                    ? round($ai['confidence'] * 100, 2) . '%' 
                                    : null,
                ];
            });

            return $images;
    }

    public function upload(Request $request)
    {
        $request->validate([
            'image.*' => 'required|image|mimes:jpg,png,jpeg|max:5120',
        ]);

        $user = $request->user();

        $path = $request->file('image')->store('scans', 'public');
        $url = asset('storage/' . $path);

        $response = Http::attach('image', file_get_contents(storage_path('app/public/' . $path)), basename($path))->post('https://6a5bf8bee02a.ngrok-free.app/predict/');

        $prediction = $response->json();
        Scan::create([
            'user_id' => $user->id,
            'image' => $url,
            'ai_response' => $prediction,
        ]);
        $confidence = isset($prediction['confidence']) ? round($prediction['confidence'] * 100, 2) . '%' : null;
        return [
            'Result' => $prediction['predicted_class'],
            'Accuracy' => $confidence,
            'image'=> $url,
            'message' => 'thank you',
        ];
    }
}
