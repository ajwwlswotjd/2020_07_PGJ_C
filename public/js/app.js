window.addEventListener("load",(e)=>{
	let canvas = document.querySelector("#join-canvas");
	let ctx = canvas.getContext("2d");
	let arr = [
		"DrX12","GenG1","Hle22","2Dwg4","Af12f","Sk66t","T1akd","D22yn",
		"s65B1","Cl5id","Fak2r","Eff5t","Cu0zz","7Cana","Wo7lf","B2ang",
		"B2ngi","DeFt1","K2ria","Ki2in","D5ran","0Show","Mak2r","Nu8gu"
	];

	$(document).on("click",".popup-close",(e)=>{
		$(e.target).parent().fadeOut();
	});

	$("#join_input").on("input",(e)=>{
		let file = e.target.files[0];
		let type = file.type.split("/")[0];
		if(type !== "image"){
			alert("이미지 파일만 넣어주세요.");
			return;
		}
		document.querySelector(".join-input").innerHTML = file.name;
	});


	$("#join").on("click",(e)=>{
		$(".join-popup input").val("");
		ctx.fillStyle = "#333030";
		ctx.fillRect(0,0,canvas.width,canvas.height);
		ctx.textAlign = 'center';
		ctx.textBaseline = "middle";
		let ran = arr[Math.floor(Math.random()*arr.length)];
		document.querySelector("#cap_answer").value = ran;
		ctx.font = "25px Arial";
		ctx.fillStyle = "#f4f5f9";
		ctx.fillText(ran,canvas.width/2,canvas.height/2);
		$(".join-popup").fadeIn();
	});	
	$("#login").on("click",(e)=>{
		$(".login-popup input").val("");
		$(".login-popup").fadeIn();
	});

	$("#logout").on("click",(e)=>{
		location.href = "/user/logout";
	});
});