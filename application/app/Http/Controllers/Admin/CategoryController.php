<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\ApifyActor;
use App\Rules\FileTypeValidate;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{
    public function index(){
        $pageTitle = 'Categories';
        $categories = Category::with('actor')->latest()->paginate(getPaginate());
        $actors = ApifyActor::all();
        return view('admin.category.index',compact('pageTitle','categories','actors'));
    }

    public function store(Request $request){

        $request->validate([
            'name'=>'required',
            'image' => ['required','image',new FileTypeValidate(['jpg','jpeg','png'])],
            'min_points' => 'required|integer|min:0',
            'apify_actor_id' => 'nullable|exists:apify_actors,id',
        ]);

        $category = new Category();
        $category->name =  $request->name;
        $category->status = 1;
        $category->min_points = $request->min_points;
        $category->apify_actor_id = $request->apify_actor_id;

        if ($request->hasFile('image')) {
            try {
                $category->image = fileUploader($request->image, getFilePath('category'), getFileSize('category'));
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }

        $category->save();

        $notify[] = ['success', 'Category has been created successfully'];
        return back()->withNotify($notify);

    }

    public function update(Request $request){

        $request->validate([
            'name'=>'required',
            'image' => ['nullable','image',new FileTypeValidate(['jpg','jpeg','png'])],
            'min_points' => 'required|integer|min:0',
            'apify_actor_id' => 'nullable|exists:apify_actors,id',
        ]);

        $category = Category::findOrFail($request->id);
        $category->name =  $request->name;
        $category->status = $request->status == 1 ? 1 :0;
        $category->min_points = $request->min_points;
         $category->apify_actor_id = $request->apify_actor_id;

        if ($request->hasFile('image')) {
            try {

                $old = $category->image;
                $category->image = fileUploader($request->image, getFilePath('category'), getFileSize('category'), $old);
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }

        $category->save();

        $notify[] = ['success', 'Category has been created successfully'];
        return back()->withNotify($notify);

    }
}
