<?php
    namespace App\Http\Helper;
    use Illuminate\Http\Exceptions\HttpResponseException;


class Helper{
    public static function sendError($message, $errors= [], $code){
        $response = ['success' => false, 'message' => $message, 'status' => $code];

        if(!empty($errors)){
            $response['data'] = $errors;
        }

        throw new HttpResponseException(response()->json($response, $code));
    } 
}