<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#content {
    height: 400px;
}
.alCenter {
    text-align: center;
}
.table {
    width: 100%; /* ���̺��� ���̸� 100%�� ���� */
}
.section-content {
    width: 100%;  /* section�� ȭ�� ���̸� �� ���� */
    max-width: 1200px; /* section�� �ִ� ���̸� ���� */
}
#margin{
  margin-bottom:200px !important
}
</style>

<div class="container-fluid d-flex justify-content-center align-items-center" style="height: 100vh;" id="margin">
    <section class="bg0 p-t-23 p-b-10 section-content">
        <h3 align="center" class="mt-5">��������</h3>
            <input type="hidden" name="boardNo" value="${qna.qnaNo}">
            <table class="table table-striped mt-5" align="center">
                <tr>
                    <th class="text-right">����:</th>
                    <td colspan="2" class="text-left">${qna.qnaTitle}</td>
                    <th class="text-right">�ۼ���:</th>
                    <td id='writer' class="text-left">${qna.userId}</td>
                    <th class="text-right">��ȸ��:</th>
                    <td class="text-left">${qna.qnaCnt}</td>
                    <th class="text-right">�ۼ�����:</th>
                    <td class="text-left">${qna.qnaCreate}</td>
                </tr>
                <tr id="content">
                    <th class="text-right">����</th>
                    <td colspan="8" class="text-left">${qna.qnaContent}</td>
                </tr>
                <tr>
                    <td colspan="9" align="center">
                        <button class="btn btn-danger" type="button" id="deleteBtn">����</button>
                    </td>
                </tr>
                <c:if test="${msg != null}">
                    <tr>
                        <td colspan="9" align="center"><span style="color: red;">${msg }</span></td>
                    </tr>
                </c:if>
            </table>
  
			<input type="text" id="reply" class="col-sm-9" placeholder="����� �Է��ϼ���">
			<button id="addReply" class="btn btn-primary">��۵��</button>
	
        <table id="example" class="display table" style="width:100%">
       
        <thead>
            <tr>
                <th>��۹�ȣ</th>
                <th>����</th>
                <th>�ۼ���</th>
                <th>�ۼ�����</th>
            </tr>
        </thead>
         <tbody id="replyList">
            
         </tbody>
    </table>
    <nav aria-label="Page navigation example" id="pagingMargin">
		<ul class="pagination justify-content-center">
			
			
		</ul>
	</nav>
    </section>
</div>
<script>
   let qno = '${qna.qnaNo}'
   let logid= '${loginId}'
document.querySelector('#deleteBtn').addEventListener('click',function(){
	
    let writer = '${qna.userId}'
    let qno = '${qna.qnaNo}'
    if(logid!=writer){
    	swal('��������','������ �����ϴ�.','error')
    	return;
    }
    fetch('deleteQna.do?qno='+qno)
     .then(result => result.json())
     .then(result => {
    	 console.log(result)
    	    if(result.retCode=='OK'){
    	     location.href="qnaList.do"
    	    }else{
    	      swal('����','������ �� �� �����ϴ�.','error')
    	    }
      	});
  })
</script>
<script src="js/qna/qnaReply.js"></script>