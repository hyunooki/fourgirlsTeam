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
    width: 100%; /* 테이블의 넓이를 100%로 설정 */
}
.section-content {
    width: 100%;  /* section이 화면 넓이를 꽉 차게 */
    max-width: 1200px; /* section의 최대 넓이를 제한 */
}
#margin{
  margin-bottom:200px !important
}
</style>

<div class="container-fluid d-flex justify-content-center align-items-center" style="height: 100vh;" id="margin">
    <section class="bg0 p-t-23 p-b-10 section-content">
        <h3 align="center" class="mt-5">상세페이지</h3>
            <input type="hidden" name="boardNo" value="${qna.qnaNo}">
            <table class="table table-striped mt-5" align="center">
                <tr>
                    <th class="text-right">제목:</th>
                    <td colspan="2" class="text-left">${qna.qnaTitle}</td>
                    <th class="text-right">작성자:</th>
                    <td id='writer' class="text-left">${qna.userId}</td>
                    <th class="text-right">조회수:</th>
                    <td class="text-left">${qna.qnaCnt}</td>
                    <th class="text-right">작성일자:</th>
                    <td class="text-left">${qna.qnaCreate}</td>
                </tr>
                <tr id="content">
                    <th class="text-right">내용</th>
                    <td colspan="8" class="text-left">${qna.qnaContent}</td>
                </tr>
                <tr>
                    <td colspan="9" align="center">
                        <button class="btn btn-danger" type="button" id="deleteBtn">삭제</button>
                    </td>
                </tr>
                <c:if test="${msg != null}">
                    <tr>
                        <td colspan="9" align="center"><span style="color: red;">${msg }</span></td>
                    </tr>
                </c:if>
            </table>
  
			<input type="text" id="reply" class="col-sm-9" placeholder="댓글을 입력하세요">
			<button id="addReply" class="btn btn-primary">댓글등록</button>
	
        <table id="example" class="display table" style="width:100%">
       
        <thead>
            <tr>
                <th>댓글번호</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일지</th>
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
    	swal('삭제에러','권한이 없습니다.','error')
    	return;
    }
    fetch('deleteQna.do?qno='+qno)
     .then(result => result.json())
     .then(result => {
    	 console.log(result)
    	    if(result.retCode=='OK'){
    	     location.href="qnaList.do"
    	    }else{
    	      swal('에러','삭제를 할 수 없습니다.','error')
    	    }
      	});
  })
</script>
<script src="js/qna/qnaReply.js"></script>