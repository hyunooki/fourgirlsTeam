/**
 * mypage.js
 */



let hinext = document.querySelector(".hinext");
let paymentsbox = document.querySelector("#payments");
let cartsbox=document.querySelector("#cartstable");

let qnahtml = ``;
let cartshtml=``;
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
	
fetch('mypagecarts.do')
      .then(result => result.json())
	  .then(result =>{	 
		console.log(result); 
		for(let i=0; result.length; i++){
			cartshtml=`
			<tr>
						     <th scope="row">${result[i].prodNo}</th>
						     <td>${result[i].prodName}</td>
						     <td>${result[i].price}</td>
						     <td>${result[i].image}</td>
						</tr>
			`;
		cartsbox.insertAdjacentHTML('beforeend',cartshtml);		
		}		
	  })	

  	

