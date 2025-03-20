/**
 *login.js 탈퇴한 회원 찾기
 */
console.log('login.js작동중');
 
 let id=document.querySelector("#id").value;
 let pw=document.querySelector("#login_password").value;
 
 document.querySelector("#form > div.form-group.mb-0 > button").addEventListener('click',function(e){
	alert('클리고');
	fetch('outmembers.do')
	       .then(result=> result.json())
		   .then(result =>{
			e.preventDefault();
			let outmems=result;
			console.log(outmems);
			
			let userExists = false;
			
			for(let out of outmems){
				console.log(out.userName);
				if(out.userId ==id && out.password==pw){
					console.log('탈퇴한 회원을 찾음');
					swal('탈퇴','이미탈퇴한회원입니다');
					userExists = true; 
					break;
				}
			}
			if (!userExists) {
			  document.querySelector("#form").submit(); 
			            }
			
		   })
 })
 
 