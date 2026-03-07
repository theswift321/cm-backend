<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Hash;
use Google\Client as GoogleClient;
use App\Http\Controllers\Controller;

class AuthController extends Controller
{
    public function register(Request $request){
        
    $request->validate([
        'name' => 'required',
        'email' => 'required|email|unique:users',
        'password' => 'required|min:6',
        'interests' => 'nullable|array'
    ]);

    $user=user::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'role' => 'student'
    ]);

       if ($request->filled('interests')) {
        foreach ($request->interests as $categoryId) {
            DB::table('student_interests')->insert([
                'user_id' => $user->id,
                'category_id' => $categoryId
            ]);
        }
    }
    $token=$user->createToken('auth_token')->plainTextToken;

    return response()->json(['token'=>$token],201);

    }

   public function login(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'password' => 'required'
    ]);

    $user = User::where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
        return response()->json([
            'message' => 'Invalid credentials'
        ], 401);
    }

    if ($user->status === 0) {
        return response()->json([
            'message' => 'Your account is inactive. Please contact admin.'
        ], 403);
    }

    // Generate token
    $token = $user->createToken('auth_token')->plainTextToken;

    
    // ✅ Include user info in response
    return response()->json([
        // 'id' =>$user->id,
        'token' => $token,
        'role' => $user->role,
        'name' => $user->name,    // <-- added
        'email' => $user->email, // optional
        'photo' =>$user->photo 
        ? asset('storage/' . $user->photo)
                    : null,
    ]);
    }

    // Google Sign-In 
    public function googleLogin(Request $request)
    {
        $request->validate([
            'token' => 'required'
        ]);

        $client = new GoogleClient();
        $client->setClientId(env('GOOGLE_CLIENT_ID'));

        $payload = $client->verifyIdToken($request->token);

        if (!$payload) {
            return response()->json([
                'message' => 'Invalid Google token'
            ], 401);
        }

        $user = User::where('google_id', $payload['sub'])->first();

        if (!$user) {
            $user = User::where('email', $payload['email'])->first();

            if ($user) {
                $user->update([
                    'google_id' => $payload['sub'],
                    'photo'     => $payload['picture'] ?? $user->photo,
                    'name'      => $payload['name'],
                ]);
            } else {
                $user = User::create([
                    'email'     => $payload['email'],
                    'name'      => $payload['name'],
                    'google_id' => $payload['sub'],
                    'role'      => 'student',
                    'password'  => Hash::make(uniqid()),
                    'photo'     => $payload['picture'] ?? null,
                ]);
            }
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'token' => $token,
            'name'  => $user->name,
            'role'  => $user->role,
            'email' => $user->email,
            'photo' => $user->photo
        ]);
    }


    public function forgotPassword(Request $request)
    {
    $request->validate([
        'email' => 'required|email'
    ]);

    $status = Password::sendResetLink(
        $request->only('email')
    );

    return $status === Password::RESET_LINK_SENT
        ? response()->json(['message' => 'Reset link sent'])
        : response()->json(['message' => 'Unable to send reset link'], 400);
    }

    // 🔹 Reset password
   public function resetPassword(Request $request)
{
    $request->validate([
        'token' => 'required',
        'email' => 'required|email',
        'password' => 'required|min:6|confirmed'
    ]);

    $status = Password::reset(
        $request->only('email', 'password', 'password_confirmation', 'token'),
        function ($user, $password) {
            $user->password = Hash::make($password);
            $user->setRememberToken(Str::random(60));
            $user->save();
        }
    );

    if ($status === Password::PASSWORD_RESET) {
        return response()->json([
            'message' => 'Password reset successful'
        ]);
    }

    return $status === Password::PASSWORD_RESET
    ? response()->json(['message' => 'Password reset successful'])
    : response()->json(['message' => __($status)], 400);
    }


}






