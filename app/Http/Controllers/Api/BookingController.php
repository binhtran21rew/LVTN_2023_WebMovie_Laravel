<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookingResource;
use App\Models\Booking;
use App\Models\ComboFood;
use App\Models\Payment;
use App\Models\Schedule;
use App\Models\Ticket;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use App\Mail\WebMail ;
use Carbon\Carbon;
use Exception;
class BookingController extends Controller
{
    private $booking;
    private $ticket;
    private $payment;
    private $combo;
    private $schedule;

    public function __construct(Booking $booking, Ticket $ticket, Payment $payment, ComboFood $combo, Schedule $schedule){
        $this->booking = $booking;
        $this->ticket = $ticket;
        $this->payment = $payment;
        $this->combo = $combo;
        $this->schedule = $schedule;
    }


    public function bookingTicket(Request $request){
        if(!auth('sanctum')->check()){
            return response()->json([
                'status' => 401,
                'message' => 'You must be logged in to book this ticket',
            ]);
        }
        $checkPayment = $this->payment->find($request->paymentId);
        $checkTicket = $this->ticket->whereIn('id',  $request->ticket)->where('status', 1)->where('booking_id', '<>',null)->get()->count();
        if($checkPayment){
            return response()->json([
                'status' => 401,
                'message' => 'Your payment transaction is error',
            ]);
        }
        if($checkTicket > 0){
            return response()->json([
                'status' => 401,
                'message' => 'This ticket is sold out',
            ]);
        }
        try{
            DB::beginTransaction();

            foreach($request->ticket as $ticket){
                $infoTicket[] = $this->ticket->with(['schedule.movie', 'seat.room'])->find($ticket);
            }
            foreach($infoTicket as $value){
                $seat[] = $value->seat->number;
            }
            $price = 0;
            $food = [];
            $today = Carbon::now()->toDateString();
            if(isset($request->listFood)){
                foreach($request->listFood as $key=>$item){
                    $price += $item['price'];
                    $food[] = $item['name'];
                }
            }

            $dataBooking = [
                'user_id' => auth('sanctum')->user()->id,
                'count' => $request->count,
                'date' => $today,
                'total_price' => $request->total_price,
                'status' => $request->status
            ];
            $loadBooking = $this->booking->create($dataBooking);
            if($loadBooking){
                $mailData = [
                    'id_booking' => $loadBooking->id,
                    'movie' => $infoTicket[0]->schedule->movie->title,
                    'image' => $infoTicket[0]->schedule->movie->post_path,
                    'date' => $infoTicket[0]->schedule->date,
                    'time_start' => $infoTicket[0]->schedule->time_start,
                    'time_end' => $infoTicket[0]->schedule->time_end,
                    'time_show' => $infoTicket[0]->schedule->movie->time,
                    'room' =>  $infoTicket[0]->seat->room->name,
                    'food' => $food,
                    'seats' => $seat,
                    'price_ticket' => count($request->ticket) * $infoTicket[0]->schedule->price,
                    'price_food' => $price,
                    'payment' => $request->type,
                    'location' => 'Quan 4, Tphcm',
                ];
                Mail::to(auth('sanctum')->user()->email)->send(new WebMail($mailData));

            }
            if(isset($request->listFood)){
                foreach($request->listFood as $key=>$item){
                    for($i = 0; $i < $item['value']; $i++){
                        $loadBooking->combofood()->attach($key);
                    }
                    $findFood = $this->combo->find($key);
                    $findFood->decrement('count', $item['value']);
                }
            }

            if($request->type !== 'TT'){
                $dataPayment = [
                    'id' => $request->paymentId,
                    'booking_id' => $loadBooking->id,
                    'date' => $request->date,
                    'time' => $request->time,
                    'price' => $request->total_price,
                    'type' => $request->type,
                ];
                $this->payment->create($dataPayment);
            }
            
            $dataTicket = [
                'booking_id' => $loadBooking->id,
                'status' => 1
            ];
            $this->ticket->whereIn('id',  $request->ticket)->where('status', 0)->update($dataTicket);
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Booking successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => 'Booking failed',
            ]);
            
        }
       

    }
    public function adminBookingTicket(Request $request){
        $checkTicket = $this->ticket->whereIn('id',  $request->ticket)->where('status', 1)->where('booking_id', '<>',null)->get()->count();
        if($checkTicket > 0){
            return response()->json([
                'status' => 401,
                'message' => 'This ticket is sold out',
            ]);
        }
        try{
            DB::beginTransaction();
            $today = Carbon::now()->toDateString();

            $dataBooking = [
                'user_id' => auth('sanctum')->user()->id,
                'count' => $request->count,
                'date' => $today,
                'total_price' => $request->total_price,
                'status' => $request->status
            ];
            $loadBooking = $this->booking->create($dataBooking);
    
            if(isset($request->listFood)){
                foreach($request->listFood as $key=>$item){
                    for($i = 0; $i < $item['value']; $i++){
                        $loadBooking->combofood()->attach($key);
                    }
                    $findFood = $this->combo->find($key);
                    $findFood->decrement('count', $item['value']);
                }
            }
            $id_payment = auth('sanctum')->user()->id.'_tt_'.rand(1, 999999);
            $dataPayment = [
                'id' => $id_payment,
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
            $this->ticket->whereIn('id',  $request->ticket)->where('status', 0)->update($dataTicket);
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Booking successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => $e->getMessage(),
            ]);
            
        }
    }

    public function ChangeBookingTicket(Request $request){
        $checkBooking = $this->booking->find($request->id_booking);
        if($checkBooking->status === 'đã thanh toán'){
            return response()->json([
                'status' => 401,
                'message' => 'Id Booking is paid',
            ]); 
        }

        if($checkBooking){
            try{
                DB::beginTransaction();
                $dataBooking = [
                    'status' => 'đã thanh toán'
                ];
                $id_payment = auth('sanctum')->user()->id.'_tt_'.rand(1, 999999);
                $dataPayment = [
                    'id' => $id_payment,
                    'booking_id' => $checkBooking->id,
                    'date' => $request->date,
                    'time' => $request->time,
                    'price' => $request->price,
                    'type' => $request->payment,
                ];
    
                $this->payment->create($dataPayment);
                $checkBooking->update($dataBooking);

                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                return response()->json([
                    'status' => 401,
                    'message' => 'Can not change payment',
                ]); 
            }

        }else{
            return response()->json([
                'status' => 401,
                'message' => 'Id booking not found',
            ]); 
        }
    }

    public function getAllBookingAdmin(){
        $bookings = $this->booking->with(['user', 'ticket.seat.room','ticket.schedule.movie' , 'payment', 'combofood'])->get();

        if($bookings->count() > 0){
            foreach($bookings as $booking){
                $data[] = new BookingResource($booking);
            }
            return $data;
        }
        return $bookings;
    }

    public function getChartData(Request $request){

        if($request->time !== 'input'){
            $today = Carbon::now()->toDateString();
            $month = Carbon::now()->format('m');
            $year = Carbon::now()->format('Y');
            if($request->filter === 'total_price'){
                if($request->time === 'all'){
                    $data = $this->booking->with('ticket')->get();
    
                }else if($request->time === 'day'){
                    $data = $this->booking->with('ticket')->where('date', $today)->get();
                    
                }else if($request->time === 'month'){
                    $data = $this->booking->with('ticket')->whereMonth('date', $month)->whereYear('date', $year)->get();
    
                }else{
                    $data = $this->booking->with('ticket')->whereYear('date', $year)->get();
    
                }
            }else if($request->filter === 'movie'){
                if($request->time === 'all'){
                    $data = $this->booking->with('ticket.schedule.movie')->get();
    
                }else if($request->time === 'day'){
                    $data = $this->booking->with('ticket.schedule.movie')->where('date', $today)->get();
                    
                }else if($request->time === 'month'){
                    $data = $this->booking->with('ticket.schedule.movie')->whereMonth('date', $month)->whereYear('date', $year)->get();
    
                }else{
                    $data = $this->booking->with('ticket.schedule.movie')->whereYear('date', $year)->get();
    
                }
            }else if($request->filter === 'room'){
                if($request->time === 'all'){
                    $data = $this->booking->with('ticket.schedule.room')->get();
    
                }else if($request->time === 'day'){
                    $data = $this->booking->with('ticket.schedule.room')->where('date', $today)->get();
                    
                }else if($request->time === 'month'){
                    $data = $this->booking->with('ticket.schedule.room')->whereMonth('date', $month)->whereYear('date', $year)->get();
    
                }else{
                    $data = $this->booking->with('ticket.schedule.room')->whereYear('date', $year)->get();
    
                }
            }
        }else{
            $type = explode('/', $request->option)[0];
            $time = explode('/', $request->option)[1];

            if($request->filter === 'total_price'){
                if($type === 'date'){
                    $data = $this->booking->with('ticket')->where('date', $time)->get();
                }else if($type === 'month'){
                    $year =  explode('-', $time)[0];
                    $month =  explode('-', $time)[1];
                    $data = $this->booking->with('ticket')->whereMonth('date', $month)->whereYear('date', $year)->get();
                }else{
                    $data = $this->booking->with('ticket')->whereYear('date', $time)->get();
                }
            }else if($request->filter === 'movie'){
                if($type === 'date'){
                    $data = $this->booking->with('ticket.schedule.movie')->where('date', $time)->get();
                }else if($type === 'month'){
                    $year =  explode('-', $time)[0];
                    $month =  explode('-', $time)[1];
                    $data = $this->booking->with('ticket.schedule.movie')->whereMonth('date', $month)->whereYear('date', $year)->get();
                }else{
                    $data = $this->booking->with('ticket.schedule.movie')->whereYear('date', $time)->get();
                }
            }else if($request->filter === 'room'){
                if($type === 'date'){
                    $data = $this->booking->with('ticket.schedule.room')->where('date', $time)->get();
                }else if($type === 'month'){
                    $year =  explode('-', $time)[0];
                    $month =  explode('-', $time)[1];
                    $data = $this->booking->with('ticket.schedule.room')->whereMonth('date', $month)->whereYear('date', $year)->get();
                }else{
                    $data = $this->booking->with('ticket.schedule.room')->whereYear('date', $time)->get();
                }
            }
        }

        return $data;
    }


    public function searchBooking(Request $request){
        if($request->filter === 'payment'){
            $bookings = $this->booking->with(['user', 'ticket.seat.room','ticket.schedule.movie' , 'payment', 'combofood'])->where('status', 'đã thanh toán')->find($request->keyword);
        }else if($request->filter === 'tt'){
            $bookings = $this->booking->with(['user', 'ticket.seat.room','ticket.schedule.movie' , 'payment', 'combofood'])->where('status', 'chưa thanh toán')->find($request->keyword);
        }
        $data = [];
        if($bookings){
            $data = new BookingResource($bookings);
            return $data;
        }

        return $data;

    }
}
