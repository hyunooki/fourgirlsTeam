/**
 * 
 */
let page = 1
makeRow()
function makeRow() {
	let tag = ''
	fetch('replyList.do?pno=' + prodNo + '&page=' + page)
		.then(result => result.json()) // 화살표 함수.
		.then(list => {
			list.forEach(reply => {
				console.log(reply.starPoint)
				document.querySelector('#review')
					.insertAdjacentHTML("afterend", '');
				tag += `<table style="width:95%; margin:auto;"><tr>
					<td class="text-center" style="width:10%">${reply.revNo}</td>
					<td class="text-center" style="width:20%">${reply.revCreate}</td>
					<td class="text-center" style="width:15%">${reply.revTitle}</td>
					<td class="text-center" style="width:10%; color:red">`
					for(let i=0; i<reply.starPoint; i++){
						tag +=`★`					
					}					
					tag += '</td>'
					tag +=`<td class="text-center" style="width:20%">${reply.revContent}</td>
					<td class="text-center" style="width:15%">${reply.userId}</td>
					</tr></table>`;
				document.querySelector('#review')
					.innerHTML = tag;
				paging();
			})
		}) // 정상처리시 실행함수.
		.catch(err => console.log(err)) // 에러시 실행할 함수.
}

function paging() {
	fetch('replypaging.do?pno=' + prodNo)
		.then(result => result.json())
		.then(result => {
			console.log(result)
			const totalCnt = result.totalCnt;
			let currentPage = page;
			let endPage = Math.ceil(currentPage / 5) * 5;
			let startPage = endPage - 4;
			let realEnd = Math.ceil(totalCnt / 5);
			endPage = endPage > realEnd ? realEnd : endPage;
			let prev = startPage != 1 ? true : false;
			let next = endPage != realEnd ? true : false;
			let target = document.querySelector('.pagination');
			target.innerHTML = '';

			// 이전 페이지 버튼
			let html = '';
			if (prev) {
				html = `<li class="page-item">
                        <a class="page-link" href="#" data-page="${startPage - 1}">Prev</a>
                        </li>`;
			} else {
				html = `<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>`;
			}
			target.insertAdjacentHTML('beforeend', html);

			// 페이지 번호 링크 생성
			for (let p = startPage; p <= endPage; p++) {
				html = `<li class="page-item  ${p == page ? 'active' : ''}"><a class="page-link" href="#" data-page="${p}">${p}</a></li>`;
				target.insertAdjacentHTML('beforeend', html);
			}

			// 다음 페이지 버튼
			if (next) {
				html = `<li class="page-item">
                        <a class="page-link" href="#" data-page="${endPage + 1}">Next</a>
                        </li>`;
			} else {
				html = `<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a></li>`;
			}
			target.insertAdjacentHTML('beforeend', html);

			// 페이징 링크 클릭 이벤트 추가
			addLink()
		});
}
function addLink() {
	let pagingLinks = document.querySelectorAll('.pagination .page-link');
	pagingLinks.forEach(function(item) {
		item.addEventListener('click', function(e) {
			e.preventDefault();
			page = e.target.getAttribute('data-page');
			makeRow(page);
		});
	});
}
document.querySelector('#addReply').addEventListener('click', function(e) {
	if(loginId.length == 0){
		swal("로그인 후 사용 가능합니다.", "error", "error")
		return;		
	}

	let title = document.querySelector('#revTitle').value;
	let content = document.querySelector('#content').value;
	let star = starInfo

	
	if(title.length == 0 || content.length==0 || star.length<1){
		swal("모두 입력하세요.","error","error")
		return;
	}
		

	fetch('replyAdd.do?pno=' + prodNo + '&revTitle=' + title + '&starPoint=' + star + '&revContent=' + content)
		.then(result => result.json())
		.then(result => {
			if (result.retCode == 'OK') {
				swal("등록 성공", "success", "success")
				page = 1
				makeRow(page)
			} else {
				swal("결제 후 이용 가능합니다.", "error", "error")
			}
		})
})

document.querySelector('#cartButton').addEventListener('click', function(e) {
	if(loginId.length == 0){
			swal("로그인 후 사용 가능합니다.", "error", "error")
			return;		
		}
		
	fetch('addCart.do?pno=' + prodNo)
		.then(result => result.json())
		.then(result => {
			if (result.retCode == 'OK') {
				swal("등록 성공", "success", "success")
			} else {
				swal("등록 실패", "error", "error")
			}
		})
})
let starInfo=0;
let starPoint=document.querySelectorAll('input[name="rating"]')
starPoint.forEach(function(item){
	item.addEventListener('click',function(e){
		starInfo=item.value;
		
	})
})

document.querySelector('#payButton').addEventListener('click', function(e) {
	if(loginId.length == 0){
			swal("로그인 후 사용 가능합니다.", "error", "error")
			return;		
		}
	
	fetch('directPay.do?pno=' + prodNo)
		.then(result => result.json())
		.then(result => {
			if (result.retCode == 'OK') {
				swal("등록 성공", "success", "success")
				location.href="paymentForm.do"
			} else {
				swal("등록 실패", "error", "error")
			}
		})

})