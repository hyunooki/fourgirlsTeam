/**
 * qnaReply.js
 */
let page=1
function makeRow() {
	console.log(qno)
    let tbody = document.querySelector('#replyList');
    fetch('qnaReplyList.do?page='+page+'&qno='+qno)
        .then(result => result.json())
        .then(result => {
            tbody.innerHTML = ''; // 새로고침 전에 tbody 내용 초기화
            for (let item of result) {
                console.log(item);
                tbody.innerHTML += `
                    <tr class="text-left">
                        <td>${item.qnaRevno}</td>
                        <td>${item.qnaContent}</td>
                        <td>${item.userId}</td>
                        <td>${item.qnaRevdate}</td>
                    </tr>
                `;
            }
        });
     paging(); 
}
makeRow();

function paging() {
    fetch('qnaReplyPage.do?qno='+qno)
        .then(result => result.json())
        .then(result => {
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
                html = `<li class="page-item"><a class="page-link ${p == page ? 'active' : ''}" href="#" data-page="${p}">${p}</a></li>`;
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
            addLink();
        });
}
function addLink() {
    let pagingLinks = document.querySelectorAll('.pagination .page-link');
    pagingLinks.forEach(function (item) {
        item.addEventListener('click', function (e) {
            e.preventDefault();
            page = e.target.getAttribute('data-page');
            makeRow(page); 
        });
    });
}
document.querySelector('#addReply').addEventListener('click',function(e){
	let content = document.querySelector('#content>td').innerText;
	fetch('qnaReplyAdd.do?qnaNo='+qno+'&writer='+logid+"&content="+content)
   .then(result => result.json())
   .then(result =>{
	   if(result.retCode=='OK'){
		 swal("등록 성공","success")
		 page=1
		 makeRow(page)
	   }else{
		swal("등록 실패","error")
	   }
   })
})

