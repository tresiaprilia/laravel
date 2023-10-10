<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MhsController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/hello', function () {
    return view('welcome');
});



Route::get('/greeting', function () {
    return 'Tresi Aprilia';
});

Route::get('/tresi', function () {
    return view("latihanview");
});

Route::get('/mhs', [MhsController::class,"index"]); //merujuk ke controller kelas public class transpor untuk menggunakan data ke view
