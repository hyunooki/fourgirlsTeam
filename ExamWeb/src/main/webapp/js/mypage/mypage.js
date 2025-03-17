/**
 * mypage.js
 */



let hinext=document.querySelector(".hinext"); 
let paymentsbox=document.querySelector("#payments"); 

fetch('myinfo.do')
	  .then(result => result.json())
	  .then(result =>{
		console.log(result);
		console.log(result.userId);
		console.log(result.userName);
		let userhtml=`안녕하세요 ${result.userName} 님`;
		console.log(userhtml);
		hinext.innerHTML=userhtml;
		//hinext.appendChild(userhtml);
	  });
	  
fetch('mypageqna.do')
       .then(result => result.json())
	   .then(result => {
		console.log(result);
		let qna
		
	   })
	  
	  