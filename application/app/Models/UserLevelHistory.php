<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserLevelHistory extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'from_level_id',
        'to_level_id',
        'level_id',
        'points_spent',
        'achieved_at',
    ];
	
	protected $casts = [
        'achieved_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function fromLevel()
    {
        return $this->belongsTo(Level::class, 'from_level_id');
    }

    public function toLevel()
    {
        return $this->belongsTo(Level::class, 'to_level_id');
    }
}