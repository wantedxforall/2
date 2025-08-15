<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\LevelBenefit;
use Illuminate\Http\Request;

class LevelBenefitController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'level_id'  => ['required','exists:levels,id'],
            'type'      => ['required','string','in:bonus_points_percent,buy_points_discount_percent,services_discount_percent,withdraw_fee_discount_percent,withdraw_min_reduction_fixed'],
            'value'     => ['required','numeric','min:0'],
            'is_active' => ['nullable','boolean'],
        ]);

        $validated['is_active'] = $request->boolean('is_active');

        LevelBenefit::create($validated);

        $notify[] = ['success', 'Level benefit created successfully'];
        return back()->withNotify($notify);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'level_id'  => ['required','exists:levels,id'],
            'type'      => ['required','string','in:bonus_points_percent,buy_points_discount_percent,services_discount_percent,withdraw_fee_discount_percent,withdraw_min_reduction_fixed'],
            'value'     => ['required','numeric','min:0'],
            'is_active' => ['nullable','boolean'],
        ]);

        $validated['is_active'] = $request->boolean('is_active');

        $benefit = LevelBenefit::findOrFail($id);
        $benefit->update($validated);

        $notify[] = ['success', 'Level benefit updated successfully'];
        return back()->withNotify($notify);
    }

    public function destroy(Request $request, $id = null)
{
    $id = $id ?? $request->input('id');
    $request->merge(['id' => $id]);

    $request->validate([
        'id' => 'required|exists:level_benefits,id',
    ]);

    LevelBenefit::findOrFail($id)->delete();

    $notify[] = ['success', 'Level benefit deleted successfully'];
    return back()->withNotify($notify);
}

}
