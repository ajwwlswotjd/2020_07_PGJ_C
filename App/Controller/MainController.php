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
		if(!__SIGN){
			DB::msgAndGo("로그인해 주세요.","/");
			exit;
		}
		$sql = "SELECT * FROM `warm` ORDER BY `idx` DESC";
		$list = DB::fetchAll($sql,[]);
		$this->render("warm",["list"=>$list]);
	}

	public function put()
	{
		extract($_POST);
		$before = $_FILES['before'];
		$after = $_FILES['after'];
		$today = date('yy-m-d');
		$idx = $_SESSION['user']->idx;
		$sql = "INSERT INTO `warm`(`idx`, `know`, `before_img`, `after_img`, `writer`, `date`) VALUES (null,?,?,?,?,?)";
		$result = DB::query($sql,[$know,$before['name'],$after['name'],$idx,$today]);
		if($result){
			move_uploaded_file($before['tmp_name'], "./upload/".$before['name']);
			move_uploaded_file($after['tmp_name'], "./upload/".$after['name']);
			echo "<script>location.href='/warm';</script>";
			exit;
		}
	}

	public function grade()
	{
		$item_idx = $_POST['idx'];
		$grade = $_POST['value'];
		$user_idx = $_SESSION['user']->idx;
		$sql = "INSERT INTO `warm_grade`(`idx`, `user_idx`, `warm_idx`, `grade`) VALUES (null,?,?,?)";
		$result = DB::query($sql,[$user_idx,$item_idx,$grade]);
	}

	public function expert()
	{
		$sql = 'SELECT * FROM `user` WHERE `level` = 1';
		$expList = DB::fetchAll($sql,[]);
		$sql = "SELECT * FROM `exp_review` ORDER BY `idx` DESC";
		$list = DB::fetchAll($sql,[]);
		$this->render("expert",["expList"=>$expList,"list"=>$list]);
	}

	public function expert_grade()
	{
		extract($_POST);
		$sql = "INSERT INTO `exp_review`(`idx`, `exp_idx`, `writer`, `pay`, `content`, `grade`) VALUES (null,?,?,?,?,?)";
		$user_idx = $_SESSION['user']->idx;
		$result = DB::query($sql,[$idx,$user_idx,$pay,$content,$grade]);
		echo "<script>location.href='/expert';</script>";
		exit;
	}
}