var lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 명)", 
    "infoEmpty" : "0명",  
    "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",  
    "infoPostFix" : "",  
    "thousands" : ",",    
    "lengthMenu" : "_MENU_ 개씩 보기",  
    "loadingRecords" : "로딩중...",  
    "processing" : "처리중...",
    "search" : "검색 : ", 
    "zeroRecords" : "검색된 데이터가 없습니다.",        
    "paginate" : {
        "first" : "첫 페이지",     
        "last" : "마지막 페이지",
        "next" : "다음", 
        "previous" : "이전"
    },      
    "aria" : {
        "sortAscending" : " :  오름차순 정렬", 
        "sortDescending" : " :  내림차순 정렬"
    }
};


let table = new DataTable('#example', {
    ajax: {
        url: 'downloadAjax.do',
        dataSrc: function(json) {
            console.log('서버 응답:', json); 
            return json; 
        }
    },
    columns: [
        {
            data: null,
            defaultContent: '<input type="checkbox">',
            orderable: false
        },
        { data: 'prodName' },
        { data: 'categoryName' },
        { data: 'payDate' },
        { data: 'pdf' },
        { data: 'downCnt' },
        { data: 'payNo' }
    ],
    lengthMenu: [
        [5, 10, 25, 50, -1],
        [5, 10, 25, 50, 'All']
    ],
    language: lang_kor,
    order: [[3, 'desc']],
    columnDefs: [
        {"className": "dt-center", "targets": "_all"},
        { width: 50, targets: 0 },
        { width: 100, targets: 1 },
        { width: 100, targets: 2 },
        { width: 100, targets: 3 },
        { width: 100, targets: 4 },
        { width: 100, targets: 5 }
    ]
  });

//숨기기
table.column(6).visible(false);

// 헤더 체크박스 클릭 시 모든 행 체크박스 선택/해제
document.getElementById('checkall').addEventListener('change', function() {
    // 모든 행의 체크박스 찾기
    const checkboxes = document.querySelectorAll('#example tbody input[type="checkbox"]');
    
    // 헤더 체크박스 상태에 따라 모든 체크박스 선택/해제
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = document.getElementById('checkall').checked;
    });
});

// 각 행이 그려질 때 체크박스에 이벤트 추가
table.on('draw', function() {
    // 모든 행의 체크박스에 클릭 이벤트 추가
    let rowCheckboxes = document.querySelectorAll('#example tbody input[type="checkbox"]');
    
    rowCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            // 모든 체크박스가 선택되었는지 확인
            const allChecked = Array.from(rowCheckboxes).every(function(cb) {
                return cb.checked;
            });
            
            // 헤더 체크박스 상태 업데이트
            document.getElementById('checkall').checked = allChecked;
        });
    });
});

document.querySelector('#downloadBtn').addEventListener('click', function(e) {
    // 선택된 체크박스들 가져오기
    let checkedBoxes = document.querySelectorAll('#example tbody input[type="checkbox"]:checked');
    
    // 선택된 파일명들을 저장할 배열
    let fileList = [];
    let payNoList = [];
    
    // 각 체크박스에 대해 처리
    checkedBoxes.forEach(function(checkbox) {
        // 체크박스가 있는 행(tr)을 찾음
        let row = checkbox.closest('tr');
        
        // DataTables API를 사용하여 행 데이터 가져오기
        let rowData = table.row(row).data();
        
        // 파일명 추출 
        if (rowData) {
        	fileList.push(rowData.pdf);
        	payNoList.push(rowData.payNo);
        }
    });
    //다운로드 실행 아작스
    downloadAjax(fileList,payNoList);
    
 
});
//다운로드 실행
function downloadAjax(fileAry=[],payNoAry=[]){
	console.log(payNoAry)
	fetch('downloadControl.do?file='+fileAry+'&payNo='+payNoAry)
	.then(result=> result.json())
	.then(result=>{
		
	   if(result.retCode=='OK'){
		   document.querySelectorAll("input[type='checkbox']:checked").forEach(checkbox => {
               checkbox.checked = false;
           });
			 swal('파일', "ZIP 파일이 성공적으로 생성되었습니다!", "success");
			 table.ajax.reload();
		}else if(result.retCode=='NG'){
			swal('error', "ZIP 파일 생성 실패 (파일이 없거나 오류 발생)", "error");
		}else if(result.retCode=='LIMIT'){
			swal('error', "다운로드 횟수를 초과하였습니다.", "error");
		}
	   
	})
}