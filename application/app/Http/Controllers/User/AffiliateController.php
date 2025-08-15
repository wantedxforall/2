<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CommissionLog;
use App\Http\Controllers\Controller;

class AffiliateController extends Controller
{
    public function reffered(){
        $pageTitle = 'Reffered';
        $user      = auth()->user();
        $maxLevel  = CommissionLog::max('level');
        return view($this->activeTemplate.'user.affiliate.reffered',compact('pageTitle','user','maxLevel'));
    }

    public function refferedCommission(){
        $pageTitle = "Commission Logs";
        $user      = auth()->user();
        $commissions =  CommissionLog::with('reffer')->where('user_id', $user->id)->latest()->paginate(getPaginate());
        return view($this->activeTemplate.'user.affiliate.index',compact('pageTitle','commissions'));
    }

    public function refferlinkSend(Request $request) {
        $request->validate([
            'reffer_link' => 'required',
            'email' => 'required|email',
        ]);

        if(auth()->user()->email == $request->email){
            $notify[] = ['error', 'You can not reffer yourself'];
            return back()->withNotify($notify)->withInput();
        }

        $receiverName = explode('@', $request->email)[0];

        $user = [
            'username'=>auth()->user()->username,
            'email'=>$request->email,
            'fullname'=>$receiverName,
        ];

        $user = json_decode(json_encode($user),false);



        notify($user,'REFFERAL_LINK',[
            'username' => $user->username,
            'link' => $request->reffer_link
        ],['email']);


        $notify[] = ['success', 'successfully send email to ' . $user->email];
        return back()->withNotify($notify)->withInput();

    }

}
