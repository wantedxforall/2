<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class LevelBenefit extends Model
{
    // استخدم fillable فقط (ولا تجمع بين fillable و guarded)
    protected $fillable = [
        'level_id',
        'type',
        'value',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    public function level()
    {
        return $this->belongsTo(Level::class, 'level_id');
    }

    /**
     * سكوب المزايا المفعلة: LevelBenefit::active()->...
     */
    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', 1);
    }

    protected static function booted(): void
    {
        static::saved(fn () => Level::flushCaches());
        static::deleted(fn () => Level::flushCaches());
    }
}
