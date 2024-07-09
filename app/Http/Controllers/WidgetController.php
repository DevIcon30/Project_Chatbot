<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WidgetController extends Controller
{
    public function index()
    {
        $title  = 'test widget';
        return view('samples.widget',compact('title'));
    }

    public function post(Request $request)
    {
        return redirect()->back()->with('success','test berhasil');
    }
}
