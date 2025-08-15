<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Level;
use Illuminate\Http\Request;

class LevelController extends Controller
{
    public function index()
    {
        $pageTitle = 'Levels';
        $levels = Level::latest()->paginate(getPaginate());
        return view('admin.levels.index', compact('pageTitle', 'levels'));
    }

    public function create()
    {
        $pageTitle = 'Create Level';
        return view('admin.levels.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'              => ['required','string','max:100'],
            'min_points_spent'  => ['required','integer','min:0'],
            'priority'          => ['required','integer','min:1'],
            'badge'             => ['nullable','string','max:255'],
            'is_active'         => ['nullable'], // checkbox

            'benefits'                  => ['array'],
            'benefits.*.type'           => ['required','string','in:bonus_points_percent,buy_points_discount_percent,services_discount_percent,withdraw_fee_discount_percent,withdraw_min_reduction_fixed'],
            'benefits.*.value'          => ['required','numeric','min:0'],
            'benefits.*.is_active'      => ['nullable'], // checkbox
        ]);

        $level = new Level();
        $level->name = $request->name;
        $level->min_points_spent = $request->min_points_spent;
        $level->priority = $request->priority;
        $level->badge = $request->badge;
        $level->is_active = $request->boolean('is_active');
        $level->save();

        $notify[] = ['success', 'Level created successfully'];
        return to_route('admin.levels.index')->withNotify($notify);
    }

    public function edit($id)
    {
        $pageTitle = 'Edit Level';
        $level = Level::findOrFail($id);
        return view('admin.levels.edit', compact('pageTitle', 'level'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name'              => ['required','string','max:100'],
            'min_points_spent'  => ['required','integer','min:0'],
            'priority'          => ['required','integer','min:1'],
            'badge'             => ['nullable','string','max:255'],
            'is_active'         => ['nullable'], // checkbox

            'benefits'                  => ['array'],
            'benefits.*.type'           => ['required','string','in:bonus_points_percent,buy_points_discount_percent,services_discount_percent,withdraw_fee_discount_percent,withdraw_min_reduction_fixed'],
            'benefits.*.value'          => ['required','numeric','min:0'],
            'benefits.*.is_active'      => ['nullable'], // checkbox
        ]);

        $level = Level::findOrFail($id);
        $level->name = $request->name;
        $level->min_points_spent = $request->min_points_spent;
        $level->priority = $request->priority;
        $level->badge = $request->badge;
        $level->is_active = $request->boolean('is_active');
        $level->save();

        $notify[] = ['success', 'Level updated successfully'];
        return to_route('admin.levels.index')->withNotify($notify);
    }

    public function destroy(Request $request, $id = null)
{
    // خذ id من المسار أو من البودي
    $id = $id ?? $request->input('id');

    $request->merge(['id' => $id]); // لتنجح الـ validate حتى لو جاء من المسار

    $request->validate([
        'id' => 'required|exists:levels,id',
    ]);

    Level::findOrFail($id)->delete();

    $notify[] = ['success', 'Level deleted successfully'];
    return back()->withNotify($notify);
}

}
