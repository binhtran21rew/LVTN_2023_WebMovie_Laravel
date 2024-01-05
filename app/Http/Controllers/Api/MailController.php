<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Mail\TicketMail;
use Illuminate\Http\Request;
use App\Mail\WebMail ;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
class MailController extends Controller
{
    public function sendMail(){
        try{
            DB::beginTransaction();
            $mailData = [
                'title' => 'Mail from webmovie',
                'body' => "test gui mail"
            ];
            // Mail::to('binh0932658710@gmail.com')->send(new WebMail($mailData));
            Mail::to('binh0932658710@gmail.com')->send(new TicketMail($mailData));

    

            DB::commit();
            return  response()->json([
                'status' => 200,
                'message' => 'gui thanh cong'
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return  response()->json([
                'status' => 401,
                'message' => $e->getMessage()
            ]);
        }

    }
}
