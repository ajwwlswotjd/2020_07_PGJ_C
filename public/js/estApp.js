const log = console.log;
$("#est-request-btn").on("click",(e)=>{
	$(".request-popup").fadeIn();
});

$(".est-btn-view").on("click",(e)=>{
	let idx = e.target.dataset.idx;
	let data = {
		"idx": idx
	};

	$.ajax({
		data:data,
		url:"est/view",
		method:"POST",
		success : (result)=>{
			let json = JSON.parse(result);
			json.list.forEach(x=>{	
				log(x);
			});
			$(".res-view-popup").fadeIn();
		}
	});
});

function temp(item){
	let tr = document.createElement("tr");
	tr.innerHTML = `
		<td>${item.name}</td>
		<td>${item.id}</td>
		<td>${item.pay}원</td>
		<td class="res-view-btn">
		<button>선택</button>
		</td>
	`;
	tr.querySelector(".res-view-btn > button").addEventListener("", callback: EventListener, capture?: boolean)
	return tr;
}