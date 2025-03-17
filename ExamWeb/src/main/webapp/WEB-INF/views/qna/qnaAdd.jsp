<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="bg0 p-t-23 p-b-10">
    <div class="container d-flex justify-content-center align-items-center">
        <div class="w-75">
            <h3 class="mb-5 mt-5 text-center">Qna 글 작성</h3>
            <form action="qnaAddControl.do" method="get" id="addForm">
                <table class="table table-dark table-striped w-100">
                    <tr>
                        <th>제목</th>
                        <td><input class="form-control w-100" type="text" name="title"></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea class="form-control w-100" rows="3" cols="45" name="content"></textarea></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><input class="form-control w-100" type="text" name="writer" value="${loginId}" readonly></td>
                    </tr>
                    <tr>
                        <td>카테고리</td>
                        <td>
                            <select class="form-control w-100" id="categorySelect" name="category">
    						<option value="">카테고리를 선택하세요</option>
    						 <c:forEach var="info" items="${list}">
    						 	<option value="${info.categoryNo}">${info.categoryName}</option>
    						</c:forEach>
						</select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <input class="btn btn-primary" type="button" value="등록" id="addBtn">
                            <input class="btn btn-danger" type="reset" value="취소">
                        </td>
                    </tr>
                </table>
         	 </form>
        </div>
    </div>
</section>
<script src="js/qna/addQna.js"></script>