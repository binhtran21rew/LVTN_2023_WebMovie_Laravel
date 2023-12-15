<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookingResource;
use App\Models\Booking;
use App\Models\Payment;
use App\Models\Ticket;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Exception;
class BookingController extends Controller
{
    private $booking;
    private $ticket;
    private $payment;

    public function __construct(Booking $booking, Ticket $ticket, Payment $payment){
        $this->booking = $booking;
        $this->ticket = $ticket;
        $this->payment = $payment;
    }


    public function bookingTicket(Request $request){

        
        if(!auth('sanctum')->check()){
            return response()->json([
                'status' => 401,
                'message' => 'You must be logged in to book this ticket',
            ]);
        }
        $checkPayment = $this->payment->find($request->paymentId);
        if($checkPayment){
            return response()->json([
                'status' => 401,
                'message' => 'Your payment transaction is error',
            ]);
        }
        try{
            DB::beginTransaction();
            $dataBooking = [
                'user_id' => auth('sanctum')->user()->id,
                'count' => $request->count,
                'date' => $request->date,
                'total_price' => $request->total_price,
                'status' => $request->status
            ];
            $loadBooking = $this->booking->create($dataBooking);
            

            $dataPayment = [
                'id' => $request->paymentId,
                'booking_id' => $loadBooking->id,
                'date' => $request->date,
                'time' => $request->time,
                'price' => $request->total_price,
                'type' => $request->type,
            ];
            $this->payment->create($dataPayment);
            
            $dataTicket = [
                'booking_id' => $loadBooking->id,
                'status' => 1
            ];
            $this->ticket->whereIn('id',  $request->ticket)->update($dataTicket);
            
            // $checkTicket->update($dataTicket);
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Booking successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return $e;
            
        }
       

    }


    public function getAllBookingAdmin(){
        $bookings = $this->booking->with(['user', 'ticket.seat.room','ticket.schedule.movie' , 'payment', 'combofood'])->get();

        if($bookings !== null){
            foreach($bookings as $booking){
                $data[] = new BookingResource($booking);
            }
            return $data;
        }
        return $bookings;
    }
}
