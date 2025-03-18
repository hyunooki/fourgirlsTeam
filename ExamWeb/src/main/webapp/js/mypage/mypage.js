/**
 * mypage.js
 */

let hinext = document.querySelector(".hinext");
let paymentsbox = document.querySelector("#payments");
let cartsbox=document.querySelector("#cartstable");
let paymentbox=document.querySelector("#paymenttable");

let signout=document.querySelector("body > div.bg-light.p-5.rounded > div > button");


let qnahtml = ``;
let cartshtml=``;
let payhtml=``; 
//qna테이블 위치 
let qnatable = document.querySelector("#qnatable");
fetch('myinfo.do')
	.then(result => result.json())
	.then(result => {
		console.log(result);
		console.log(result.userId);
		console.log(result.userName);
		let userhtml = `안녕하세요 ${result.userName} 님`;
		console.log(userhtml);
		hinext.innerHTML = userhtml;
		//hinext.appendChild(userhtml);
	});

	//qna
fetch('mypageqna.do')
	.then(result => result.json())
	.then(result => {
		console.log(result);
		for (let i = 0; result.length; i++) {
			qnahtml = `
			<tr>
			     <th scope="row">${result[i].qnaNo}</th>
			     <td>${result[i].qnaTitle}</td>
			     <td>${result[i].qnaCreate}</td>
			     <td>${result[i].categoryName}</td>
			</tr>`;
			   qnatable.insertAdjacentHTML('beforeend',qnahtml);
			   console.log(qnahtml);
			   
		}//for문 반복 
	})
	
	//carts
	
fetch('mypagecarts.do')
      .then(result => result.json())
	  .then(result =>{	 
		console.log(result); 
		for(let i=0; result.length; i++){
			cartshtml=`
			            <tr class=cart_${result[i].prodNo}>
						     <th scope="row" >${result[i].prodNo}</th>
						    <td> <a href="detail.do?pno=${result[i].prodNo}">${result[i].prodName}</a></td>
						     <td>${result[i].price}</td>
						     <td>${result[i].image}</td>
						</tr>
			`;
		cartsbox.insertAdjacentHTML('beforeend',cartshtml);	
		console.log('3월18일테스트중...');	
		}
		
		
	  })	
 //payment
	  fetch('mypagepayment.do')
	        .then(result => result.json())
	  	  .then(result =>{	 
			console.log('payment');
	  		console.log(result); 
			for(let i=0; result.length; i++){
				payhtml=`
				         <tr>
							<th scope="row">${result[i].prodNo}</th>
						    <td>${result[i].prodName}</td>
						    <td>${result[i].price}</td>
							<td>${result[i].payDate}</td>
							<td>${result[i].pdf}</td>
							<td>${result[i].categoryName}</td>
						  </tr>			
				`;
				
					paymentbox.insertAdjacentHTML('beforeend',payhtml);		
					}	
	  	  })	
 
signout.addEventListener('click',function(e){
	swal('경고','정말탈퇴 하시겠습니까?');	
    fetch('signout.do')	   
	      .then(result => result.json())
	      .then(result => {
			console.log(result);
			if(result.signOut=='OK'){
				console.log('탈퇴완료');
				//메인페이지로 이동
				location.href="logout.do"; 
				location.href = "main.do";
			}					   
	       })			
})
//질문게시판 버튼 
let qnaboard=document.querySelector("#qna > div > button");  
qnaboard.addEventListener('click',function(e){
	//질문게시판으로이동
	location.href='qnaList.do';
})


//상품제목을 눌렀을때 상세페이지 이동 
/*document.querySelectorAll('#cartstable tr').addEventListener('click',function(){
	
	
		
}); 
*/

//원래 만들어져있는것만 찾아옴 
console.log(document.querySelectorAll('tr'));








