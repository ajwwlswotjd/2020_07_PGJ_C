document.querySelectorAll(".expt-btn").forEach(x=>{
	x.addEventListener("click",(e)=>{
		let idx = x.dataset.idx;
		document.querySelector("#expt_idx").value = idx;
		$(".exp-grade-popup").fadeIn();
	});
});