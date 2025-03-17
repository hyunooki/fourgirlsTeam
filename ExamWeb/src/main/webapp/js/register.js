/**
 * register.js 로그인활때 중복확인 하기
 */

let id=document.querySelector("#id");

let checkOverlap=document.querySelector('body > form > div > div:nth-child(2) > button');
checkOverlap.addEventListener('click',function(){
	console.log('중복확인클릭');
	console.log(id.value);
	//여기서 중복되는 아이디가 있는지 없는지 체크함 
	fetch('checkOverlap.do')
		 .then(result => result.json())			 	
	     .then(result =>{
			//리스트 형태로 나오면서 
			for(let i=0; i<result.length; i++){
				console.log(result[i]);		
				if(id.value===result[i]){
					alert('이미존재하는아이디입니다'); 
				}
			 		
			}
			console.log(result); 
		 
			
		 });
});