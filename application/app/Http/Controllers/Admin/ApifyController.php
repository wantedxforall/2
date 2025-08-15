<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ApifyActor;
use App\Models\GeneralSetting;
use Illuminate\Http\Request;

class ApifyController extends Controller
{
    public function index()
    {
        $pageTitle = 'Apify Settings';
        $general = GeneralSetting::first();
        $actors = ApifyActor::latest()->paginate(getPaginate());
        return view('admin.apify.index', compact('pageTitle', 'general', 'actors'));
    }

    public function updateToken(Request $request)
    {
        $request->validate([
            'apify_token' => 'nullable|string',
        ]);
        $general = GeneralSetting::first();
        $general->apify_token = $request->apify_token;
        $general->save();

        $notify[] = ['success', 'Token updated successfully'];
        return back()->withNotify($notify);
    }

    public function storeActor(Request $request)
    {
        $request->validate([
            'name'        => 'required|string',
            'actor_id'    => 'required|string',
            'metric'      => 'required|string',
            'value_field' => 'nullable|string',
        ]);

        ApifyActor::create([
            'name'        => $request->name,
            'actor_id'    => $request->actor_id,
            'metric'      => $request->metric,
            'value_field' => $request->value_field,
        ]);

        $notify[] = ['success', 'Actor added successfully'];
        return back()->withNotify($notify);
    }

    public function updateActor(Request $request, $id)
    {
        $request->validate([
            'name'        => 'required|string',
            'actor_id'    => 'required|string',
            'metric'      => 'required|string',
            'value_field' => 'nullable|string',
        ]);

        $actor = ApifyActor::findOrFail($id);
        $actor->update([
            'name'        => $request->name,
            'actor_id'    => $request->actor_id,
            'metric'      => $request->metric,
            'value_field' => $request->value_field,
        ]);

        $notify[] = ['success', 'Actor updated successfully'];
        return back()->withNotify($notify);
    }

    public function deleteActor(Request $request)
    {
        $request->validate([
            'id' => 'required|integer|exists:apify_actors,id',
        ]);

        $actor = ApifyActor::findOrFail($request->id);
        $actor->delete();

        $notify[] = ['success', 'Actor deleted successfully'];
        return back()->withNotify($notify);
    }
}