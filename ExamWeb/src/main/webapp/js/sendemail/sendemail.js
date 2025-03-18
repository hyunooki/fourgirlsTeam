/**
 * sendemail.js 이메일보내기
 */

console.log('sendemail.js실행중');

document.querySelector('#sendemail').addEventListener('click', function(e) {
	e.preventDefault();
	e.stopPropagation();
	let email = document.querySelector('#emailId').value
	
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
					alert('동일한이메일발견!'); //이거까지함 
				}
			}
			if (!exist) {
				alert('조회된 아이디가 없습니다.')
			} else {
				    emailjs.init("M50sp3lgCFOGkJSGN");
				    console.log( emailjs);
				var templateParams = {
					from_name: "예담",  // 발신자 이름
					to_name: name,    // 수신자 이름
					message: password,  // 메시지 내용
					to_email: email,  // 수신자 이메일
				};
				emailjs.send("service_p24nijl", "template_g5tj2jk", templateParams)
					.then(function(response) {
						alert('해당이메일로 비밀번호를 전송하였습니다.')
						console.log("메일 전송 성공!", response);					
					}, function(error) {
						console.log("메일 전송 실패", error);
					});
			}
		});
})

