<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ticket;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
class PaymentController extends Controller
{
    private $ticket;
    public function __construct(Ticket $ticket){
        $this->ticket = $ticket;
    }
    public function execPostRequest($url, $data)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data))
        );
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        //execute post
        $result = curl_exec($ch);
        //close connection
        curl_close($ch);
        return $result;
    }
    public function momoPayment(Request $request){
        $checkTicket = $this->ticket->whereIn('id',  $request->ticket)->where('status', 1)->where('booking_id', '<>',null)->get()->count();
        if($checkTicket > 0){
            return response()->json([
                'status' => 401,
                'message' => 'This ticket is sold out',
            ]);
        }
        $dataRequest = [
            'total_price' => $request->total_price,
            'count' => $request->count,
            'status' => $request->status,
            'ticket' => $request->ticket,
            'type' => $request->type,
            'listFood' => $request->listFood
        ] ;
        $dataPayment = base64_encode(json_encode($dataRequest));

        $random = Str::random(12);
        $endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
        $partnerCode = 'MOMOBKUN20180529';
        $accessKey = 'klm05TvNBzhg7h7j';
        $secretKey = 'at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa';
        $orderInfo = "Thanh toán qua MoMo";
        $amount = $request->total_price;
        $orderId = time() .'-'.$random;
        // $redirectUrl = "http://localhost:3000/order/success";
        // $ipnUrl = "http://localhost:3000/";
        $redirectUrl = "https://bkshop.site/order/success";
        $ipnUrl = "https://bkshop.site/";
        // $extraData =  $request->total_price. ' ' . $request->date. ' '.$request->count. ' '.`{$request->ticket}`;
        $extraData= $dataPayment;



        $requestId = time() . "";
        $requestType = "payWithATM";
        //before sign HMAC SHA256 signature
        $rawHash = "accessKey=" . $accessKey . "&amount=" . $amount . "&extraData=" . $extraData . "&ipnUrl=" . $ipnUrl . "&orderId=" . $orderId . "&orderInfo=" . $orderInfo . "&partnerCode=" . $partnerCode . "&redirectUrl=" . $redirectUrl . "&requestId=" . $requestId . "&requestType=" . $requestType;
        $signature = hash_hmac("sha256", $rawHash, $secretKey);
        $data = array(
            'partnerCode' => $partnerCode,
            'partnerName' => "Test",
            "storeId" => "MomoTestStore",
            'requestId' => $requestId,
            'amount' => $amount,
            'orderId' => $orderId,
            'orderInfo' => $orderInfo,
            'redirectUrl' => $redirectUrl,
            'ipnUrl' => $ipnUrl,
            'lang' => 'vi',
            'extraData' => $extraData,
            'requestType' => $requestType,
            'signature' => $signature);
        $result = $this->execPostRequest($endpoint, json_encode($data));
        $jsonResult = json_decode($result, true);  // decode json

        //Just a example, please check more in there
        return $jsonResult['payUrl'];

        
    }

    public function vnpayMethod(Request $request){
        $checkTicket = $this->ticket->whereIn('id',  $request->ticket)->where('status', 1)->where('booking_id', '<>',null)->get()->count();
        if($checkTicket > 0){
            return response()->json([
                'status' => 401,
                'message' => 'This ticket is sold out',
            ]);
        }
        $dataRequest = [
            'total_price' => $request->total_price,
            'count' => $request->count,
            'status' => $request->status,
            'ticket' => $request->ticket,
            'type' => $request->type,
            'listFood' => $request->listFood
        ] ;
        $code_cart = rand(0,9999);
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        // $vnp_Returnurl = "http://localhost:3000/order/success";
        $vnp_Returnurl = "https://bkshop.site/order/success";

        $vnp_TmnCode = "L58E60MY";//Mã website tại VNPAY 
        $vnp_HashSecret = "IFSXLZSUZSPASOWUYFHEJWQZNEUAKPJP"; //Chuỗi bí mật

        $vnp_TxnRef = $code_cart; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo =  'Successful.';
        $vnp_OrderType = 'payment';
        $vnp_Amount = $request->total_price * 100;
        $vnp_Locale = 'vn';
        $vnp_BankCode = "NCB";
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
        //Add Params of 2.0.1 Version





        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }

        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//  
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }
        $returnData = array('code' => '00'
            , 'message' => 'success'
            , 'data' => $vnp_Url);
            return json_encode($returnData);
            // if (isset($request->redirect)) {
            //     // header('Location: ' . $vnp_Url);

            // } else {
            //     return json_encode($returnData);
            //     // echo json_encode($returnData);
            // }
            // vui lòng tham khảo thêm tại code demo
    }

}
