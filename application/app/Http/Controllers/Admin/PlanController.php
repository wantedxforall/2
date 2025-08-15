<?php

namespace App\Http\Controllers\Admin;

use App\Models\Plan;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PlanController extends Controller
{

    public function  index(){
        $pageTitle = 'Plans';
        $plans = Plan::latest()->paginate(getPaginate());
        return  view('admin.plans.index',compact('pageTitle','plans'));
    }

    public function  create(){
        $pageTitle = 'Add Plan';
        return  view('admin.plans.create',compact('pageTitle'));
    }

    public function store(Request $request){
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric|gt:0',
            'credits' => 'required|integer|min:0'
        ]);


        $content =  json_encode($request->contents);

        $plan = new Plan();
        $plan->name =  $request->name;
        $plan->price =  $request->price;
        $plan->credits =  $request->credits;
        $plan->content = $content;
        $plan->status = 1;
        $plan->save();

        $notify[] = ['success', 'Plan has been created successfully'];
        return to_route('admin.plan.index')->withNotify($notify);
    }

    public function edit($id){
        $pageTitle = 'Update';
        $plan = Plan::findOrFail($id);
        return view('admin.plans.edit',compact('pageTitle','plan'));
    }

    public function update(Request $request,$id){

        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric|gt:0',
            'credits' => 'required|integer|min:0'
        ]);


        $content =  json_encode($request->contents);

        $plan = Plan::findOrFail($id);
        $plan->name =  $request->name;
        $plan->price =  $request->price;
        $plan->credits =  $request->credits;
        $plan->content = $content;
        $plan->status = $request->status == 1 ? 1 :0;
        $plan->save();

        $notify[] = ['success', 'Plan has been updated successfully'];
        return to_route('admin.plan.index')->withNotify($notify);
    }

}
