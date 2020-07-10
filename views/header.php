<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="resources/style.css">
	<link rel="stylesheet" href="/css/main.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/js/app.js"></script>
	<title>A_Module</title>
</head>
<body>
	<div class="popup login-popup">
		<div class="popup-container login-container">
			<div class="div-wrapper">
				<h1>로그인</h1>
				<form action="/user/login" method="POST">
					<div class="jl-input">
						<label for="login-id">아이디</label>
						<input type="text" id="login-id" name="id" placeholder="ID" required>
					</div>
					<div class="jl-input">
						<label for="login-pwd">비밀번호</label>
						<input type="password" id="login-pwd" name="pwd" placeholder="PASSWORD" required>
					</div>
					<button type="submit" id="login_submit">로그인</button>
				</form>
			</div>
		</div>
		<div class="popup-close login-close">&times;</div>
	</div>
	<div class="popup join-popup">
		<div class="popup-container join-container">
			<div class="div-wrapper">
				<h1>회원가입</h1>
				<form action="/user/join" method="POST" enctype="multipart/form-data">
					<div class="jl-input">
						<label for="join-id">아이디</label>
						<input type="text" id="join-id" name="id" placeholder="ID" required>
					</div>
					<div class="jl-input">
						<label for="join-pwd">비밀번호</label>
						<input type="password" id="join-pwd" name="pwd" placeholder="PASSWORD" required>
					</div>
					<div class="jl-input">
						<label for="join-name">이름</label>
						<input type="text" id="join-name" name="name" placeholder="NAME" required>
					</div>
					<canvas id="join-canvas" width="240" height="80"></canvas>
					<input type="hidden" name="cap_answer" id="cap_answer">
					<input type="text" name="captcha" id="captcha" placeholder="CAPTCHA" required>
					<label for="join_input" class="join-input">프로필 사진</label>
					<input type="file" name="img" id="join_input" style="display: none;" accept="image/*" required>
					<button type="submit" id="join_submit">가입 완료</button>
				</form>
			</div>
		</div>
		<div class="popup-close">&times;</div>
	</div>
	<header>
		<div class="header-container">
			<img src="resources/logo.png" alt="logo img" id="logo" title="로고 이미지">
			<nav>
				<li><a href="/">홈</a></li>
				<li><a href="/warm">온라인 집들이</a></li>
				<li><a href="#">스토어</a></li>
				<li><a href="/expert">전문가</a></li>
				<li><a href="/review">시공 후기</a></li>
			</nav>

			<div class="sign-box">
				<?php if(__SIGN) : ?>
					<button id="signed">
						<i class="fa fa-user"></i>
						<?= htmlentities($_SESSION['user']->name)  ?>
						(<?= htmlentities($_SESSION['user']->id) ?>)
					</button>
					<button id="logout">
						<i class="fa fa-unlock"></i>
						로그아웃
					</button>
					<?php else : ?>
						<button id="join">
							<i class="fa fa-user"></i>
							회원가입
						</button>
						<button id="login">
							<i class="fa fa-lock"></i>
							로그인
						</button>
					<?php endif; ?>
				</div>
				<div class="mobile-nav-btn">
					<i class="fa fa-bars"></i>
				</div>
				<div class="mobile-nav">
					<li class="mobile-active"><a href="#">홈</a></li>
					<li><a href="#">온라인 집들이</a></li>
					<li><a href="#">스토어</a></li>
					<li><a href="#">전문가</a></li>
					<li><a href="#">시공 견적</a></li>
				</div>
			</div>

		</header>