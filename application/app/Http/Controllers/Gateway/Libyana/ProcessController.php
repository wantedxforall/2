<?php

namespace App\Http\Controllers\Gateway\Libyana;

use App\Http\Controllers\Controller;

class ProcessController extends Controller
{
    public static function process($deposit)
    {
        return json_encode([
            'view' => 'user.payment.libyana'
        ]);
    }
}