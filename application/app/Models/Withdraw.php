<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Withdraw extends Model
{
    // اسم الجدول صراحة (لأن plural الافتراضي لـ Withdraw هو "withdraws")
    protected $table = 'withdrawals';

    // الحقول المسموح تعبئتها جماعيًا
    protected $fillable = [
        'user_id',
        'credits',   // بدل amount
        'status',
        'phone',
        'method',
        'binance_id',
        'rate',
    ];

    // تحويلات لأنواع الحقول (اختياري)
    protected $casts = [
        'credits'      => 'decimal:8', // بدل amount
        'rate'         => 'decimal:8',
        'detail'       => 'object',
        'approved_at'  => 'datetime',
        'cancelled_at' => 'datetime',
];

    // العلاقة مع المستخدم
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
