/**
 * sendemail.js 이메일보내기
 */

console.log('sendemail.js실행중');

document.querySelector('#sendemail').addEventListener('click', function(e) {
	e.preventDefault();
	e.stopPropagation();
	let email = document.querySelector("#email-field").value;
	
	let password = '';
	let name = ''
	let exist = false;
	fetch('members.do')
		.then(result => result.json())
		.then(result => {
			console.log(result);
			let members = result;
			console.log('멤버리스트');
			console.log(members);
			for (let member of members) {
				console.log(member.email);
				if (member.email == email) {
					password = member.password;
					name = member.userName;
					exist = true;					
				}
			}
			if (!exist) {
				swal('재입력','조회된 아이디가 없습니다.')
			} else {
				    emailjs.init("M50sp3lgCFOGkJSGN");
				    console.log( emailjs);
				var templateParams = {
					from_name: "예담",  // 발신자 이름
					to_name: name,    // 수신자 이름
					message: password,  // 메시지 내용
					to_email: email,  // 수신자 이메일
				};
				emailjs.send("service_rpf6v4d", "template_6r3946r", templateParams)
					.then(function(response) {
						swal('전송','해당이메일로 비밀번호를 전송하였습니다.')
						location.href='login.do';
						console.log("메일 전송 성공!", response);					
					}, function(error) {
						console.log("메일 전송 실패", error);
					});
			}
		});
})

