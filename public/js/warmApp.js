document.querySelector("#bef_img").addEventListener("input",function(e){
	let file = this.files[0];
	let type = file.type.split("/")[0];
	if(type !== "image"){
		alert("이미지 파일만 넣을 수 있습니다.");
		this.value = "";
		return;
	}
	document.querySelector("label[for='bef_img']").innerHTML = file.name;
});

document.querySelector("#aft_img").addEventListener("input",function(e){
	let file = this.files[0];
	let type = file.type.split("/")[0];
	if(type !== "image"){
		alert("이미지 파일만 넣을 수 있습니다.");
		this.value = "";
		return;
	}
	document.querySelector("label[for='aft_img']").innerHTML = file.name;
});

$(".wm-item.more").on("click",(e)=>{
	$(".warm-form-popup").fadeIn();
});

$(document).on("click",".wm-item-btn",(e)=>{
	let idx = e.target.dataset.idx;
	$(".warm-grade-popup").fadeIn();
	document.querySelector(".warm-btn-box").dataset.idx = idx*1;
});

document.querySelectorAll(".warm-btn-box > button").forEach((x)=>{
	x.addEventListener("click",(e)=>{
		let idx = document.querySelector(".warm-btn-box").dataset.idx*1;
		let value = x.querySelector("span").innerHTML*1;
		let data = {
			"value" : value,
			"idx" : idx
		};
		$.ajax({
			url:"warm/grade",
			data:data,
			method:"POST",
			success:(e)=>{
				location.href="/warm";
			}
		});
	
	});
});

