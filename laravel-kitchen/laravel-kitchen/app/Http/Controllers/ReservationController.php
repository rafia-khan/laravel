<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    public function reserve(Request $request)
    {
    	$this->validate($request,[
    		'name' => 'required',
    		'phone' => 'required',
    		'email' => 'required',
    		'dateandtime' => 'required'
    	]);

    	$reservation = new Reservation();
    	$reservation->name = $request->name;
    	$reservation->phone = $request->phone;
    	$reservation->email = $request->email;
    	$reservation->date_and_time = $request->dateandtime;
    	$reservation->message = $request->message;
    	$reservation->status = false;
    	$reservation->save();

    	Toastr::success('Reservation request sent successfully. We will confirm you to soon', 'Success', ["PositionClass" => "toast-top-right"]);
    	return redirect()->back();
    }

    public function index()
    {
        $reservations = Reservation::all();
        return view('admin.reservation.index', compact('reservations'));
    }

    public function status($id)
    {
        $reservation = Reservation::find($id);
        $reservation->status = true;
        $reservation->save();

        Toastr::success('Reservation Successfully Confirmed', 'Success', ["PositionClass" => "toast-top-right"]);
        return redirect()->back();
    }

    public function destroy($id)
    {
        Reservation::find($id)->delete();
        Toastr::success('Reservation Successfully Deleted', 'Success', ["PositionClass" => "toast-top-right"]);
        return redirect()->back();
    }
}
