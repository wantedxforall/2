<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Proof;
use App\Models\Report;
use App\Models\Service;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ServiceController extends Controller
{
    public function index(){
        $pageTitle = 'Posts';
        $services = Service::with('category','user')->latest()->paginate(getPaginate());
        return view('admin.services.index',compact('pageTitle','services'));
    }

    public function create(){
        $pageTitle = 'Add Post';
        $categories = Category::with('actor')->where('status',1)->get();
        return view('admin.services.create',compact('pageTitle','categories'));
    }

    public function store(Request $request){
        $request->validate([
            'name' => 'required',
            'link' => 'required|url',
            'category' => 'required|',
            'allocated_credits' => 'required|integer|min:1',
        ]);

        $purifier = new \HTMLPurifier();

        $service = new Service();
        $service->category_id = $request->category;
        $service->name = $request->name;
        $service->link = $request->link;
        $service->link_description = $purifier->purify($request->link_description);
        $service->allocated_credits = $request->allocated_credits;
        $service->status = 1;


        $service->save();

        $notify[] = ['success', 'Service has been created successfully'];
        return back()->withNotify($notify);
    }

    public function edit($id){
        $pageTitle = 'Update Post';
        $categories = Category::with('actor')->where('status',1)->get();
        $service = Service::findOrFail($id);
        return view('admin.services.edit',compact('pageTitle','categories','service'));
    }

    public function update(Request $request,$id){

        $request->validate([
            'name' => 'required',
            'link' => 'required|url',
            'category' => 'required|',
            'allocated_credits' => 'required|integer|min:1',
        ]);

        $purifier = new \HTMLPurifier();

        $service = Service::findOrFail($id);
        $service->category_id = $request->category;
        $service->name = $request->name;
        $service->link = $request->link;
        $service->link_description = $purifier->purify($request->link_description);
        $service->allocated_credits = $request->allocated_credits;
        $service->status = $request->status == 1 ? 1 :0;

        $service->save();

        $notify[] = ['success', 'Service has been updated successfully'];
        return back()->withNotify($notify);
    }

    public function active(){
        $pageTitle = 'Active Posts';
        $services = Service::with('category','user')->where('status',1)->latest()->paginate(getPaginate());
        return view('admin.services.index',compact('pageTitle','services'));
    }

    public function pending(){
        $pageTitle = 'Pending Post';
        $services = Service::with('category','user')->where('status',0)->latest()->paginate(getPaginate());
        return view('admin.services.index',compact('pageTitle','services'));
    }

    public function ban(){
        $pageTitle = 'Ban Post';
        $services = Service::with('category','user')->where('status',3)->latest()->paginate(getPaginate());
        return view('admin.services.index',compact('pageTitle','services'));
    }

    public function changeStatus(Request $request){
        $service = Service::findOrFail($request->id);
        $service->status = $request->status;
        $service->save();

        $notify[] = ['success', 'Service has been change status successfully'];
        return back()->withNotify($notify);
    }

    public function report(){
        $pageTitle ='Reports';
        $reports = Report::with(['service','user'])->latest()->paginate(getPaginate());
        return view('admin.services.reports',compact('pageTitle','reports'));
    }

    public function reportBan(Request $request){

        $service =  Service::findOrFail($request->id);
        $service->status = 3;
        $service->save();

        if(@$service->user){
            notify($service->user, 'SERVICE BAN', [
                'service_name'=>$service->name,
            ]);
        }

        $notify[] = ['success', 'Service has been ban successfully'];
        return back()->withNotify($notify);



    }


}
