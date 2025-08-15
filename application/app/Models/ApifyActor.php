<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApifyActor extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'actor_id', 'metric', 'value_field'];

    
    public function categories()
    {
        return $this->hasMany(Category::class);
    }
}