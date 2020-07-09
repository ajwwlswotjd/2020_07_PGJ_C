<?php use Gondr\DB; ?>
<div class="popup exp-grade-popup">
	<div class="popup-container exp-grade-container">
		<div class="div-wrapper">
			<h1>시공후기 작성</h1>
			<form action="exp/grade" method="POST">
				<input type="hidden" name="idx" id="expt_idx">
				<div class="exp-input">
					<label for="exp_pay">가격</label>
					<input type="number" id="exp_pay" name="pay" required pattern="[0-9]{}" placeholder="￦" min="0">
				</div>
				<textarea id="exp_txtarea" name="content" placeholder="내용" required></textarea>
				<p class="exp_help">
					<i class="fa fa-star star-yellow">1</i>
					<i class="fa fa-star star-yellow">2</i>
					<i class="fa fa-star star-yellow">3</i>
					<i class="fa fa-star star-yellow">4</i>
					<i class="fa fa-star star-yellow">5</i>
				</p>
				<input type="range" value="3" min="1" max="5" name="grade" id="exp_grade">
				<button type="submit" id="expt_submit">작성 완료</button>
			</form>
		</div>
	</div>
	<div class="popup-close">&times;</div>
</div>
<div class="screen">
	<div class="expt-list">
		<?php foreach ($expList as $expert) : ?>
		<?php
			$sql = "SELECT * FROM `exp_review` WHERE `exp_idx` = ?";
			$gradeList = DB::fetchAll($sql,[$expert->idx]);
			$len = sizeof($gradeList);
			$grade = 0;
			foreach ($gradeList as $grd) $grade+=$grd->grade;
			if($len != 0) $grade = floor($grade/$len);

		?>
		<div class="expt-item">
			<div class="expt-top">
				<img src="resources/<?= $expert->img ?>" alt="">
			</div>
			<div class="expt-bottom">
				<div class="expt-name"><?= $expert->name ?></div>
				<div class="expt-id"><?= $expert->id ?></div>
				<div class="expt-star">
					<?php for($i = 0; $i < $grade; $i++) : ?>
						<i class="fa fa-star star-yellow"></i>
						<?php endfor; ?>
						<?php for($i = 0; $i < 5-$grade; $i++) : ?>
						<i class="fa fa-star star-gray"></i>
						<?php endfor; ?>
						<span><?= $grade ?>.0</span>
				</div>
				<button class="expt-btn" data-idx="<?= $expert->idx ?>">시공 후기작성</button>
			</div>
		</div>
		<?php endforeach; ?>
	</div>
	<div class="er-table-box">
		<table class="er-table" border="0">
			<tbody>
				<tr>
					<th width="5%">번호</th>
					<th width="10%">작성자 이름</th>
					<th width="15%">작성자 아이디</th>
					<th width="10%">전문가 이름</th>
					<th width="15%">전문가 아이디</th>
					<th>내용</th>
					<th width="15%">비용</th>
					<th width="5%">평점</th>
				</tr>
					<?php foreach ($list as $item) :?>
					<?php
						$sql = "SELECT * FROM `user` WHERE `idx` = ?";
						$exp = DB::fetch($sql,[$item->exp_idx]);
						$user = DB::fetch($sql,[$item->writer]);
					?>
					<tr>
						<td><?= $item->idx ?></td>
						<td><?= $user->name ?></td>
						<td><?= $user->id ?></td>
						<td><?= $exp->name ?></td>
						<td><?= $exp->id ?></td>
						<td class="table-content">
							<?= htmlentities($item->content) ?>
						</td>
						<td><?= number_format($item->pay)  ?>원</td>
						<td><?= $item->grade ?></td>
					</tr>

					<?php endforeach; ?>
			</tbody>
		</table>
	</div>
</div>
<script src="/js/expertApp.js"></script>