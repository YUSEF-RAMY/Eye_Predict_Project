<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Scan extends Model
{
    protected $fillable = [
        'user_id',
        'left_path',
        'right_path',
        'result',
        'ai_response',
        'status',
    ];

    protected $casts = [
        'ai_response' => 'array',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
