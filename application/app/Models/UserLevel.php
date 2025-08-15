<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserLevel extends Model
{
    use HasFactory;
	public $timestamps = false;

    protected $fillable = [
        'user_id',
        'level_id',
        'points_spent',
        'achieved_at',
    ];

    protected $casts = [
        'status' => 'boolean',
		'achieved_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function level()
    {
        return $this->belongsTo(Level::class);
    }
}