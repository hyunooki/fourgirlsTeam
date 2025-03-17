/**
 * register.js 로그인활때 중복확인 하기
 */
//중복
//사용가능할때 쓰는 html
let infohtml=`
<div class="h-25 d-inline-block alert alert-primary d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Info:"><use xlink:href="#info-fill"></use></svg>
  <div>
  사용가능한 아이디입니다
  </div>
</div>`;

let nohtml=`
<div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"></use></svg>
  <div>
   이미존재하는 아이디입니다
  </div>
</div>
`;

//아이디 중복확인 덩어리 
let checkoverlapId=document.querySelector("body > form > div > div:nth-child(2)");
 
let id=document.querySelector("#id");
let checkOverlap=document.querySelector('body > form > div > div:nth-child(2) > button');
checkOverlap.addEventListener('click',function(){
let check=0;
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
					swal('재시도','이미존재하는아이디입니다');
					checkoverlapId.insertAdjacentHTML('beforeend',nohtml); 
					break; //여기서탈출
				}
				check=check+1;
			  console.log('check->'+check); 
			}	
			if(result.length==check){
				console.log('사용가능아이디임');
				swal('사용가능','사용가능한아이디입니다');
				//checkOverlap 옆에 html 요소를 만들어야함 
				//checkoverlapId.appendChild(infohtml); 				
				checkoverlapId.insertAdjacentHTML('beforeend',infohtml); 
			}
		 });
});
