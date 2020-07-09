<?php

use Gondr\Route;

use Gondr\DB;
if(__SIGN){
	
}

Route::get("/","MainController@index");
Route::get("warm","MainController@warm");
Route::get("user/logout","MainController@logout");


Route::get("test","MainController@test");
Route::post("test/post","MainController@testPost");
Route::post("user/join","MainController@join");
Route::post("user/login","MainController@login");