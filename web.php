<?php

use Gondr\Route;

use Gondr\DB;
if(__SIGN){

}

Route::get("warm","MainController@warm");

Route::get("expert","MainController@expert");

Route::get("user/logout","MainController@logout");

Route::get("/","MainController@index");


Route::get("test","MainController@test");

// 

Route::post("warm/put","MainController@put");
Route::post("warm/grade","MainController@grade");

Route::post("exp/grade","MainController@expert_grade");

Route::post("user/join","MainController@join");
Route::post("user/login","MainController@login");