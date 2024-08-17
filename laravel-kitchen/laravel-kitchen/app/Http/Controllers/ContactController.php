<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function sendMessage(Request $request)
    {
    	$this->validate($request,[
    		'name' => 'required',
    		'email' => 'required',
    		'subject' => 'required',
    		'message' => 'required',
    	]);

    	$contact = new Contact();
    	$contact->name = $request->name;
    	$contact->email = $request->email;
    	$contact->subject = $request->subject;
    	$contact->message = $request->message;
    	$contact->save();

    	Toastr::success('Your message successfully send', 'Success', ["PositionClass" => "toast-top-right"]);
    	return redirect()->back();
    }

    public function index()
    {
    	$contacts = Contact::all();
    	return view('admin.contact.index', compact('contacts'));
    }

    public function show($id)
    {
    	$contact = Contact::find($id);
    	return view('admin.contact.show', compact('contact'));
    }

    public function destroy($id)
    {
    	Contact::find($id)->delete();
    	Toastr::success('Contact Message Successfully Deleted', 'Success', ["PositionClass" => "toast-top-right"]);
    	return redirect()->back();
    }
}
