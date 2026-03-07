<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
  public function index()
    {
        return User::select(
                'id',
                'name',
                'email',
                'role',
                'status',
                'created_at'
            )
            ->orderBy('created_at', 'desc')
            ->get();
    }
    public function toggleStatus($id)
{
    $user = User::findOrFail($id);

    if ($user->role === 'admin') {
        return response()->json([
            'message' => 'Admin status cannot be changed'
        ], 403);
    }

    $user->status = !$user->status;
    $user->save();

    // ✅ THIS IS IMPORTANT
    return response()->json([
        'status' => $user->status
    ]);
}

}
