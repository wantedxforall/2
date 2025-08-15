<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommissionLog extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function userTo(){
    	return $this->belongsTo(User::class,'to_id');
    }

    public function reffer() {
        return $this->belongsTo(User::class,'who');
    }

    public function userFrom(){
    	return $this->belongsTo(User::class,'from_id');
    }
}
