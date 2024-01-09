<?php

namespace App\Console\Commands;

use App\Models\Booking;
use App\Models\Ticket;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ChangeStatusTicketBooking extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:change-status-ticket-booking';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $today = Carbon::now()->toDateString();
        $time = Carbon::now()->addMinutes(15)->tz('Asia/Ho_Chi_Minh')->format('H:i:s');
        $findData = DB::table('ticket')
        ->join('bookings', 'ticket.booking_id', '=', 'bookings.id')
        ->join('schedules', 'ticket.schedule_id', '=', 'schedules.id')
        ->select('ticket.id as ticket_id', 'bookings.id as booking_id', 'bookings.user_id','bookings.status', 'schedules.date', 'schedules.time_start')
        ->where('bookings.status', 'chưa thanh toán')
        ->whereDate('schedules.date',$today)
        ->whereTime('schedules.time_start', '<=',$time)
        ->get();
        if(count($findData) > 0){
            $dataBooking = Booking::find($findData->map(function ($item){
                return $item->booking_id;
            }));
            $dataFood = $dataBooking->map(function ($item){
                return $item->combofood->map(function ($item){
                    return $item->id;
                });
            });

            foreach($dataFood as $food){
                $countFood = count($food);
                if($countFood > 0){
                    foreach($food as $item){
                        $idFood[] =  $item;
                    }
                }
            }
            foreach($dataBooking as $item){
                $item->combofood()->detach($idFood);
            }
            Ticket::whereIn('id', $findData->map(function ($item){
                    return $item->ticket_id;
                }))->update(['booking_id' => null, 'status' => 0]);
            Booking::whereIn('id', $findData->map(function ($item){
                return $item->booking_id;
            }))->delete();
        }
    }
}
