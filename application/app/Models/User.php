<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Crypt;
use App\Models\Level;

class User extends Authenticatable
{
    use HasFactory;
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'ver_code_send_at' => 'datetime'
    ];


    public function loginLogs()
    {
        return $this->hasMany(UserLogin::class);
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class)->orderBy('id','desc');
    }

    public function deposits()
    {
        return $this->hasMany(Deposit::class)->where('status','!=',0);
    }

    public function services()
    {
        return $this->hasMany(Service::class);
    }

    public function socialChecks()
    {
        return $this->hasMany(SocialCheck::class);
    }
	
	public function level()
    {
        return $this->belongsTo(Level::class);
    }
    
    public function fullname(): Attribute {
        return new Attribute(
            get: fn() => $this->firstname || $this->lastname ? $this->firstname . ' ' . $this->lastname : '@'.$this->username,
        );
    }

    protected function address(): Attribute
    {
        return Attribute::make(
            get: fn($value) => $value ? json_decode(Crypt::decryptString($value)) : null,
            set: fn($value) => $value ? Crypt::encryptString(json_encode($value)) : null,
        );
    }

    protected function kycData(): Attribute
    {
        return Attribute::make(
            get: fn($value) => $value ? json_decode(Crypt::decryptString($value)) : null,
            set: fn($value) => $value ? Crypt::encryptString(json_encode($value)) : null,
        );
    }

    // SCOPES
    public function scopeActive()
    {
        return $this->where('status', 1);
    }

    public function scopeBanned()
    {
        return $this->where('status', 0);
    }

    public function scopeEmailUnverified()
    {
        return $this->where('ev', 0);
    }

    public function scopeMobileUnverified()
    {
        return $this->where('sv', 0);
    }

    public function scopeEmailVerified()
    {
        return $this->where('ev', 1);
    }

    public function scopeMobileVerified()
    {
        return $this->where('sv', 1);
    }

    public function scopeWithBalance()
    {
        return $this->where('balance','>', 0);
    }

}
