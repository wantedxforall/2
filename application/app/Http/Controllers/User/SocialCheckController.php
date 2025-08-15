<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Service;
use App\Models\SocialCheck;
use App\Services\ApifyService;
use Illuminate\Http\Request;

class SocialCheckController extends Controller
{
    public function start(Request $request)
    {
        
        \Log::info('✅ دخلنا start()', $request->all());
        $request->validate([
    'service_id' => 'required|integer|exists:services,id',
]);

$service = Service::findOrFail($request->service_id);
\Log::info('✅ service loaded', ['service' => $service]);

$user = auth()->user();
\Log::info('✅ user', ['user' => $user]);

$username = $service->link;
\Log::info('✅ username parsed', ['username' => $username]);

$actorName = $service->category?->actor?->name;
\Log::info('✅ actor name', ['actor' => $actorName]);

$count = $actorName ? (new ApifyService())->getFollowers($actorName, $username) ?? 0 : 0;
\Log::info('✅ count fetched', ['followers' => $count]);

$check = SocialCheck::create([
    'service_id' => $service->id,
    'user_id' => $user->id,
    'followers_before' => $count,
    'status' => 'pending',
]);

return response()->json(['followers' => $count, 'check_id' => $check->id]);


        return response()->json(['followers' => $count, 'check_id' => $check->id]);
    }

}