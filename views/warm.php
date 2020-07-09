<?php use Gondr\DB; ?>
<div class="popup warm-grade-popup">
	<div class="popup-container warm-grade-container">
		<div class="div-wrapper">
			<h1>평점 주기</h1>
			<div class="warm-btn-box">
				<button>
					<i class="fa fa-star"></i>
					<span>1</span>
				</button>
				<button>
					<i class="fa fa-star"></i>
					<span>2</span>
				</button>
				<button>
					<i class="fa fa-star"></i>
					<span>3</span>
				</button>
				<button>
					<i class="fa fa-star"></i>
					<span>4</span>
				</button>
				<button>
					<i class="fa fa-star"></i>
					<span>5</span>
				</button>
			</div>
		</div>
	</div>
</div>
<div class="popup warm-form-popup">
	<div class="popup-container warm-form-container">
		<div class="div-wrapper">
			<h1>온라인 집들이</h1>
			<form action="warm/put" method="POST" enctype="multipart/form-data">
				<textarea name="know" id="know_input" placeholder="노하우를 작성해주세요." required></textarea>
				<label for="bef_img">BEFORE 이미지</label>
				<label for="aft_img">AFTER 이미지</label>
				<input type="file" id="bef_img" name="before" accept="image/*" required>
				<input type="file" id="aft_img" name="after" accept="image/*" required>
				<button type="submit" id="form_btn">작성 완료</button>
			</form>
		</div>
	</div>
	<div class="popup-close">&times;</div>
</div>
<div class="screen">
	<div class="wm-list">
		<div class="div-wrapper">
			<?php foreach ($list as $item) : ?>
			<?php
				$sql = "SELECT * FROM `user` WHERE `idx` = ?";
				$user = DB::fetch($sql,[$item->writer]);
				$sql = "SELECT * FROM `warm_grade` WHERE `warm_idx` = ?";
				$gradeList = DB::fetchAll($sql,[$item->idx]);
				$sql = "SELECT * FROM `warm_grade` WHERE `user_idx` = ? AND `warm_idx` = ?";
				$exist = DB::fetch($sql,[$_SESSION['user']->idx,$item->idx]);
				if($item->writer == $_SESSION['user']->idx) $exist = true;
				$grade = 0;
				$len = sizeof($gradeList);
				foreach ($gradeList as $grd) $grade += $grd->grade;
				if($len != 0) $grade = floor($grade/$len);
			?>
			<div class="wm-item">
				<div class="wm-item-top">
					<img src="/upload/<?= $item->before_img ?>" alt="Before img" title="BEFORE 이미지">
					<img src="/upload/<?= $item->after_img ?>" alt="After img" title="AFTER 이미지">
				</div>
				<div class="wm-bottom">
					<img src="/upload/<?= $user->img ?>" alt="user img" title="유저 이미지" class="warm-user">
					<div class="wm-item-user-info">
						<?= htmlentities($user->name) ?><span><?= htmlentities($user->id) ?></span>
					</div>
					<div class="wm-item-date">
						<?= htmlentities($item->date) ?>
					</div>
					<div class="wm-item-know">
						<?= htmlentities($item->know) ?>
					</div>
					<div class="wm-item-star">
						<?php for($i = 0; $i < $grade; $i++) : ?>
						<i class="fa fa-star star-yellow"></i>
						<?php endfor; ?>
						<?php for($i = 0; $i < 5-$grade; $i++) : ?>
						<i class="fa fa-star star-gray"></i>
						<?php endfor; ?>
						<span><?= $grade ?>.0</span>
					</div>
					<?php if(!$exist) : ?>
					<button class="wm-item-btn" data-idx="<?= $item->idx ?>">평점주기</button>
					<?php endif; ?>
				</div>
			</div>
			<?php endforeach; ?>
			<div class="wm-item more">글쓰기</div>
		</div>		
	</div>
</div>
<script src="/js/warmApp.js"></script>