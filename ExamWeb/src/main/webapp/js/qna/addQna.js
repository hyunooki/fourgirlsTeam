/**
 *  addQna.js
 */

document.querySelector('#addBtn').addEventListener('click',function(e){
	e.preventDefault();
    let title = document.querySelector('input[name="title"]').value
    let content= document.querySelector('textarea[name="content"]').value
    let selected = document.querySelector("#categorySelect option:checked").value;
    
    if(title.length==0||content.length==0||selected==0){
    	swal('작성에러','값을 다기입후 입력하세요','error')
    	return;
    }
    document.querySelector('#addForm').submit();
    
})