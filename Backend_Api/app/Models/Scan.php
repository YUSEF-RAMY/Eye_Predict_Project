<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Scan extends Model
{
    protected $fillable = [
        'user_id',
        'ai_response',
        'image',
    ];

    protected $casts = [
        'ai_response' => 'array',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
