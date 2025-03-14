<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#tableMargin{
  margin-top:40px !important;
}
h3{
  text-align: center;
  margin-top:100px !important;
  margin-left:100px !important;
}
.text-center{
     margin-bottom:200px !important;
}
</style>

<div class="d-flex flex-column align-items-center">
  <h3>다운 목록</h3>
  <table class="table w-75" id="tableMargin">
   <thead>
    <tr>
      <th class="col-1"><input type="checkbox"></th>
      <th class="col-1">#</th>
      <th class="col-2">이름</th>
      <th class="col-2">카테고리</th>
      <th class="col-3">구매일</th>
      <th class="col-2">파일명</th>
      <th class="col-1">다운로드횟수</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="info" items="${list }" varStatus="status">
      <tr>
        <td><input type="checkbox"></td>
        <td>${status.count}</td>
        <td>${info.prodName}</td>
        <td>${info.categoryName}</td>
        <td>${info.payDate}</td>
        <td>${info.pdf}</td>
        <td>${info.downCnt}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <div class="text-center">
    <button class="btn btn-primary">전송</button>
  </div>
</div>