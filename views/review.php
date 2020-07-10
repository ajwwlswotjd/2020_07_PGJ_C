<?php use Gondr\DB; ?>
<div class="popup res-view-popup">
	<div class="popup-container res-view-container">
		<div class="div-wrapper">
			<h1>견적 보기</h1>
			<div class="res-view-table-box">
				<table class="res-view-table">
					<thead>
						<tr>
							<th width="30%">전문가 이름</th>
							<th width="30%">전문가 아이디</th>
							<th width="25%">비용</th>
							<th width="15%">선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>엄준식</td>
							<td>ajwwlswotjd</td>
							<td>150,000,000원</td>
							<td class="res-view-btn">
								<button>선택</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="popup-close">&times;</div>
</div>
<div class="popup request-popup">
	<div class="request-container popup-container">
		<div class="div-wrapper">
			<h1>시공 견적 요청</h1>
			<form action="est/request" method="POST">
				<div class="jl-input">
					<label for="est-date">비용</label>
					<input type="date" id="est-date" name="date" placeholder="￦" required pattern="[0-9]{}" min="0">
				</div>
				<textarea required name="content" id="est-content" placeholder="내용"></textarea>
				<button type="submit" id="est-submit">작성 완료</button>
			</form>
		</div>
	</div>
	<div class="popup-close">&times;</div>
</div>
<div class="screen">
	<div class="est-request-list est-list">
		<h1>시공 견적 요청 리스트</h1>
		<div class="est-table">			
			<table cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<th width="10%">작성자 이름</th>
						<th width="20%">작성자 아이디</th>
						<th width="10%">시공일</th>
						<th width="20%">내용</th>
						<th width="10%">상태</th>
						<th width="10%">견적 개수</th>
						<th width="20%">기능</th>
					</tr>
					<?php foreach ($estList as $item) : ?>
					<?php
						$sql = "SELECT * FROM `user` WHERE `idx` = ?";
						$user = DB::fetch($sql,[$item->writer]);

						$sql = "SELECT * FROM `est_res` WHERE `est_idx` = ?";
						$resList = DB::fetchAll($sql,[$item->idx]);
						$resLen = sizeof($resList);

						$status = false;
						$sql = "SELECT * FROM `est_res` WHERE `est_idx` = ? AND `status` = 1";
						$result = DB::fetch($sql,[$item->idx]);
						if($result) $status = true;

						$btn1 = false; // 견적 보내기
						$btn2 = false; // 견적 보기

						if($_SESSION['user']->level == 1){
							$sql = "SELECT * FROM `est_res` WHERE `est_idx`= ? AND `exp_idx` = ?";
							$result = DB::fetch($sql,[$item->idx,$_SESSION['user']->idx]);
							$btn1 = !$result && !$status;
						}

						if($_SESSION['user']->idx == $item->writer){
							$btn2 = true;
						}
					?>
					<tr>
						<td>
							<?= htmlentities($user->name) ?>
						</td>
						<td>
							<?= htmlentities($user->id) ?>
						</td>
						<td>
							<?= htmlentities($item->date) ?>
						</td>
						<td>
							<?= htmlentities($item->content) ?>
						</td>
						<td>
							<?= $status ? "완료" : "진행중" ?>
						</td>
						<td>
							<?= $resLen ?>개
						</td>
						<td class="est-table-btn">
							<?php if($btn1) : ?>
								<button class="est-btn-send">견적 보내기</button>
							<?php endif; ?>
							<?php if($btn2) : ?>
								<button class="est-btn-view" data-idx="<?= $item->idx ?>">견적 보기</button>
							<?php endif; ?>
						</td>
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
		</div>
	</div>
	<div class="est-request-btn">
		<button id="est-request-btn">견적 요청</button>
	</div>
</div>

<!-- 
	시공 견적 요청 리스트
		작성자 이름, 작성자 아이디
		시공일, 내용
		상태 => 진행 중, 완료
		견적 개수
		견적 보내기/보기 버튼
		=> 견적 보내기 버튼 : 상태가 진행중, 견적을 아직 안보낸 전문가
		=> 견적 보기   버튼 : 작성자만 보임

		견적 보내기 버튼
				팝업 => 비용 입력 및, 완료버튼
		견적 보기  버튼
				팝업 => 받은 견적 리스트
						=> 전문가 이름, 전문가 아이디, 비용, 선택버튼 (진행중일때)


	견적 요청 버튼
		팝업 등장 
			시공일 내용 작성완료버튼 

	보낸 견적 리스트
		전문가만 보여야함
		본인이 보낸 견적만 보여야함
			회원 아이디, 이름
			시공일, 내용, 입력한 비용, 선택여부 (선택, 미선택, 진행중)
			=>   선택 : 견적요청에 선택되었을때
			=> 미선택 : 견적요청이 다른 전문가의 견적을 선택했을떄
			=> 진행중 : 견적요청이 아직 선택을 하지 않았을떄


 -->
 <script src="/js/estApp.js"></script>	