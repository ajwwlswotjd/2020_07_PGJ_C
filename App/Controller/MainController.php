<?php

namespace Gondr\Controller;

use Gondr\DB;

class MainController extends MasterController {

	public function index()
	{
		$this->render("main");
	}

	public function join()
	{
		extract($_POST);
		if($cap_answer != $captcha){
			DB::msgAndBack("자동입력방지 문자를 잘못 입력하였습니다.");
			exit;
		}
		$file = $_FILES['img'];
		$src = $file['name'];
		$sql = "INSERT INTO `user`(`idx`, `id`, `password`, `img`, `name`) VALUES (null,?,PASSWORD(?),?,?)";
		$result = DB::query($sql,[$id,$pwd,$src,$name]);
		if($result){
			DB::msgAndGo("회원가입에 완료되었습니다.","/");
			move_uploaded_file($file['tmp_name'],"./upload/".$src);
			exit;
		} else {
			DB::wmsgAndBack("중복되는 아이디입니다. 다른 아이디를 사용해주세요.");
			exit;
		}
	}

	public function login()
	{
		extract($_POST);
		$sql = "SELECT * FROM `user` WHERE `id` = ? AND `password` = PASSWORD(?)";
		$result = DB::fetch($sql,[$id,$pwd]);
		if($result){
			DB::msgAndGo("로그인에 성공하였습니다.","/");
			$_SESSION['user'] = $result;
			exit;
		} else {
			DB::msgAndBack("아이디 또는 비밀번호가 일치하지 않습니다.");
			exit;
		}
	}

	public function logout()
	{
		unset($_SESSION['user']);
		echo "<script>history.back();</script>";
		exit;
	}

	public function warm()
	{
		$sql = "SELECT * FROM `warm` ORDER BY `date`";
		$list = DB::fetch($sql,[]);
		$this->render("warm");
	}


}