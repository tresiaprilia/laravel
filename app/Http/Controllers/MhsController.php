<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mhs;

class MhsController extends Controller
{
    public function index(){
        $newmhs= Mhs::where("nim","12345")->first();
        dd($newmhs);
        


        return view("latihanview");
    }

    public function kuliah(){
      $newmhs= new Mhs();
      $newmhs->nama = "Malau";
            $newmhs->nim = "P31.2021.02413";
              $newmhs->alamat = "Semarang";
              $newmhs->hobi = "Maramarabanget!!!!!!!";
              $newmhs->email = "malaulesson@gmail.com";
              $newmhs->no_hp = "085225001327";
              $newmhs->save();

        return view("latihanview");
    }



}
