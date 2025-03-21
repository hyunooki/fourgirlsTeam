/**
 * testapi 
 * 
 */
/**
 * register.js 로그인활때 중복확인 하기
 */
//중복
//사용가능할때 쓰는 html
let infohtml = `
<div id="overlap" class="d-inline-block alert alert-primary d-flex align-items-center" role="alert"
    style="width: 240px; height: 38px; display: flex; align-items: center; justify-content: center;
           padding: 0 10px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
           font-size: 14px; border-radius: 5px;">
 <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Info:"><use xlink:href="#info-fill"></use></svg>
 <div>
   사용가능한 아이디입니다
 </div>
</div>
`;
let nohtml = `
<div id="overlap" class="alert alert-danger d-flex align-items-center" role="alert"
    style="width: 240px; height: 38px; display: flex; align-items: center; justify-content: center;
           padding: 0 10px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
           font-size: 14px; border-radius: 5px;">
 <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Info:"><use xlink:href="#info-fill"></use></svg>
 <div>
   이미 존재하는 아이디입니다
 </div>
</div>
`;


//아이디 중복확인 덩어리 
let checkoverlapId=document.querySelector("body > form > div > div:nth-child(2)");
let regbutton=document.querySelector("#regbutton");  
let id=document.querySelector("#id");
let checkOverlap=document.querySelector('body > form > div > div:nth-child(2) > button');
checkOverlap.addEventListener('click',function(){
	let show=document.querySelector("#overlap");
	if(show!=null){
	console.log(show);
	show.remove();
}
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
					swal('등록불가','이미존재하는아이디입니다');
					checkoverlapId.insertAdjacentHTML('beforeend',nohtml); 
					break; //여기서탈출
				}
				check=check+1;
			  console.log('check->'+check); 
			}	
			if(result.length==check){
				console.log('사용가능아이디임');				
				//checkOverlap 옆에 html 요소를 만들어야함 
				//checkoverlapId.appendChild(infohtml); 				
				checkoverlapId.insertAdjacentHTML('beforeend',infohtml); 
			}			
		 });
});

function passwordcheck() {
	let password = document.querySelector("#password").value;
	let passwordcheck = document.querySelector("#passwordcheck").value;

	let message = document.getElementById("message");

	if (password === "") {
		message.textContent = "";
		return;
	}

	if (passwordcheck === "") {
		message.textContent = "";
	} else if (password !== passwordcheck) {
		message.textContent = "비밀번호가 일치하지 않습니다";
		message.style.color = "red";
	}
	else {
		message.textContent = "비밀번호가 일치합니다";
		message.style.color = "green";
	}
}

document.querySelector("#password").oninput = passwordcheck;
document.querySelector("#passwordcheck").oninput = passwordcheck;






















