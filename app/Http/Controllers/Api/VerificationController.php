<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Verified;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;

class VerificationController extends Controller
{

    private $user;
    public function __construct(User $user){
        $this->user = $user;
    }
    public function sendEmailVerification(Request $request){
        if($request->user()->hasVerifiedEmail()){
            return response()->json([
                'status' => 200,
                'message' => 'Already verified'
            ]);
        }

        $request->user()->sendEmailVerificationNotification();
        return response()->json([
            'message' => 'varification link sent'
        ]);
    }


    public function verify(EmailVerificationRequest $request){
        if ($request->user()->hasVerifiedEmail()) {
            return [
                'message' => 'Email already verified'
            ];
        }

        if ($request->user()->markEmailAsVerified()) {
            event(new Verified($request->user()));
        }

        return [
            'message'=>'Email has been verified'
        ];
    }
}
