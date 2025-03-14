/**
 *  payment.js
 */
console.log('gg')
let removeBtn = document.querySelectorAll('.btn-danger')
  console.log(removeBtn);	  
removeBtn.forEach(function(item){
		  item.addEventListener('click',function(){
			 let tr = item.parentNode.parentNode;
			 tr.remove();
		  })
	  })

