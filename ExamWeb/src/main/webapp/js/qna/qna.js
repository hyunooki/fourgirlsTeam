/**
 * qna.js
 */
let category= '';
function makeRow(page = 1, category = "", search = "", keyword = "", orderby = "") {
    let tbody = document.querySelector('tbody');
    fetch('qnaListAjax.do?page=' + page + '&category=' + category + '&search=' + search + '&keyword=' + keyword + '&orderBy=' + orderby)
        .then(result => result.json())
        .then(result => {
            tbody.innerHTML = ''; // 새로고침 전에 tbody 내용 초기화
            for (let item of result) {
                console.log(item);
                tbody.innerHTML += `
                    <tr class="text-left">
                        <td>${item.qnaNo}</td>
                        <td>${item.qnaTitle}</td>
                        <td>${item.userId}</td>
                        <td>${item.qnaCnt}</td>
                        <td>${item.qnaCreate}</td>
						<td>${item.categoryName}</td>
                    </tr>
                `;
            }
        });
    paging(page,category,search,keyword,orderby); 
}
//카테고리 설정
let search='';
let keyword='';
let orderby ='';

function paging(page = 1, category = "", search = "", keyword = "",orderBy="") {
    fetch('qnaPaging.do?page=' + page + '&category=' + category + '&search=' + search + '&keyword=' + keyword+'&orderBy='+orderBy)
        .then(result => result.json())
        .then(result => {
            const totalCnt = result.totalCnt;
            let currentPage = page;
            let endPage = Math.ceil(currentPage / 10) * 10;
            let startPage = endPage - 9;
            let realEnd = Math.ceil(totalCnt / 10);
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

// 페이징목록의 링크 클릭 이벤트 추가
function addLink() {
    let pagingLinks = document.querySelectorAll('.pagination .page-link');
    pagingLinks.forEach(function (item) {
        item.addEventListener('click', function (e) {
            e.preventDefault();
            let page = e.target.getAttribute('data-page');
            makeRow(page,category,search,keyword,orderby); 
        });
    });
}

makeRow(); 

//정렬 조건
document.querySelector('#orderby').addEventListener('click', function(e) {
    console.log('d');
    let target = e.target;
    if (target && target.hasAttribute('data-id')) {
        search = document.querySelector('#select').value; 
        keyword = document.querySelector('input[name="search-product"]').value; // input의 값을 가져옴
        orderby = target.getAttribute('data-id'); 
        console.log(orderby)
        makeRow(1,category,search,keyword,orderby)
       
    }
});


//카테고리
document.querySelector('.filter-tope-group').addEventListener('click',function(e){
	let target = e.target;
	
	if (target && target.hasAttribute('data-cate')) {
		category = target.getAttribute('data-cate')
		console.log(category)
		makeRow(1,category,'','','');
	}
})

//검색
document.querySelector('input[name="search-product"]').addEventListener('keyup', (e)=>{
	
    if (e.keyCode === 13) {
		keyword= document.querySelector('input[name="search-product"]').value; // input의 값을 가져옴
		search = document.querySelector("#select option:checked").value;
		if(search.length==0){
			alert('옵션값을 입력하세요')
			return;
		}
		makeRow(1,category,search,keyword)
		
  }  
});

