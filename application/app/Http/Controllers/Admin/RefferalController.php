<?php

namespace App\Http\Controllers\Admin;

use App\Models\Refferal;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RefferalController extends Controller
{

    public function index(){
        $pageTitle = "Refferal";
        $refferal = Refferal::first();
        return view('admin.refferal.index',compact('pageTitle','refferal'));
    }

    public function store(Request $request){

        $request->validate([
            'percent' => 'required|numeric',
       ]);

        $refferal = Refferal::first();
        $refferal->level =  1;
        $refferal->percent =  $request->percent;
        $refferal->save();

        $notify[] = ['success', 'Successfully Generated Refferal'];
        return back()->withNotify($notify);
    }
}
