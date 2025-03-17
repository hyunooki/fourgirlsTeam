/**
 * mypage.js
 */

console.log('mypage.js 작동확인');


fetch('myinfo.do')
	  .then(result => result.json())
	  .then(result =>{
		console.log(result);
		console.log(result.userId);
	  });