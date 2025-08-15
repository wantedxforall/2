<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ad extends Model
{
    use HasFactory;
    
    public function statusBadge($status){
        $html = '';
        if($this->status == 1){
            $html = '<span class="badge badge--success">'.trans('Active').'</span>';
        }elseif($this->status == 2){
            $html = '<span class="badge badge--warning">'.trans('Pending').'</span>';
        }else{
            $html = '<span class="badge badge--danger">'.trans('Deactivate').'</span>';
        }

        return $html;
    }
}
