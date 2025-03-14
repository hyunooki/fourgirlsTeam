/**
 *  payment.js
 */


let removeBtn = document.querySelectorAll('.btn-danger')
  console.log(removeBtn);	  
removeBtn.forEach(function(item){
		  item.addEventListener('click',function(){
			  
			 let tr = item.parentNode.parentNode;
			 let payNo =tr.getAttribute('data-id');
			 //삭제 ajax 실행
			 payRemove(payNo);
			 tr.remove();
			 //삭제후 결제금액 함수 다시실행
			 payInfo()
		  })
	  })
//결제 삭제 함수
function payRemove(payNo){
	fetch('deletePay.do?payNo='+payNo)
	.then(result=> result.json())
	.then(result=>{
		if(result.retCode=='OK'){
			 swal('삭제', "삭제가 완료되었습니다!", "success");
			 return true;
		}else{
			swal('삭제', "삭제가 실패하였습니다!", "error");
			return false;
		}
	})
}
//총 결제 금액 함수
function payInfo(){
	
	//tr 상품 갯수 가져오기
	let tr = document.querySelectorAll('tr')
	tr=tr.length-2
	//상품명에 넣을곳
	let prodName = document.querySelector('.mtext-101:nth-of-type(1)')
	//실질적 상품정보
	let nameInfo = document.querySelector('tr:nth-of-type(2)>td:nth-of-type(2)').innerHTML;
	if(tr<0){
		prodName.innerHTML=nameInfo+'상품이 없습니다.'
	}
	else if(tr==0){
		prodName.innerHTML=nameInfo		
	}else{
		prodName.innerHTML=nameInfo+'외  '+tr+'개'
	}
	
	let totalPay=0;
	
	let pay = document.querySelectorAll('tr>td:nth-of-type(3)')
	pay.forEach(function(item){
		 let value = item.innerText.replaceAll(',', '').replaceAll('원', '');
		 totalPay += Number(value);
	})
	
	let payInfo = document.querySelector('.mtext-110:nth-of-type(1)')
	totalPay=numberRender(totalPay)
	payInfo.innerHTML = totalPay+'원'
}
//숫자 ,찍게하는 함수
function numberRender(pay){
	return pay.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}
//숫자 다시 렌더링
let numberRander = document.querySelectorAll('.table_row>td:nth-of-type(3)')
console.log(numberRander)
numberRander.forEach(function(item){
	item.innerHTML=numberRender(item.innerHTML)+'원'
})
//결제토탈 함수 실행
payInfo()
//결제 진행 버튼
let payBtn = document.querySelector('#paymentBtn')
console.log(payBtn)
payBtn.addEventListener('click',function(e){
	let itemName =document.querySelector('.mtext-101:nth-of-type(1)').innerHTML;
	let totalPay = document.querySelector('.mtext-110:nth-of-type(1)');
	totalPay = totalPay.innerText.replaceAll(',', '').replaceAll('원', '');
	console.log(itemName)
	console.log(totalPay)
	var IMP = window.IMP;
	IMP.init("imp77256221"); // 아임포트 가맹점 식별코드 입력

	IMP.request_pay({
		pg: 'tosspay', // PG사 코드
		pay_method: 'card', // 결제 방식
		merchant_uid: "pay_" + new Date().getTime(), // 주문번호 (고유해야 함)
		name : itemName, // 제품명
        amount : totalPay, // 가격
        buyer_email : 'gusdnr654321@naver.com',
        buyer_name : '신현욱',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456'
	}, function (rsp) {
		console.log(rsp);
		if (rsp.success) {
			payUpdate();
			console.log("결제 성공:", rsp);
			
			// 결제 성공 후 로직 추가
		} else {
			 alert('결제실패')
	    }
	});
});
function payUpdate(){
	let tr = document.querySelectorAll('.table_row')
	let check =true
	tr.forEach(function(item){
		let payNo = item.getAttribute('data-id');
		fetch('paymentClear.do?payNo='+payNo)
		.then(result=> result.json())
		.then(result=>{
		if(result.retCode=='OK'){
			
		}else{
			check=false
		 }
	  })
	})
	console.log(check)
	if(!check){
		swal('결제', "결제가 실패하였습니다!", "error");
	}else{
		swal('결제', "결제가 완료되었습니다!", "success");
		location.href='downloadPage.do'
	}
}

