<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GeneralSetting extends Model
{
    protected $guarded = [];
	
	protected $casts = ['withdraw_min_phone' => 'decimal:8','withdraw_min_usdt'  => 'decimal:8','mail_config' => 'object','sms_config' => 'object','global_shortcodes' => 'object','daily_login_credits' => 'integer','withdraw_rate' => 'float','withdraw_rate_phone' => 'float','withdraw_rate_usdt' => 'float','withdraw_notify_email' => 'string'];
	
    public function scopeSiteName($query, $pageTitle)
    {
        $pageTitle = empty($pageTitle) ? '' : ' - ' . $pageTitle;
        return $this->site_name . $pageTitle;
    }

    protected static function boot()
    {
        parent::boot();
        static::saved(function(){
            \Cache::forget('GeneralSetting');
        });
    }
}
