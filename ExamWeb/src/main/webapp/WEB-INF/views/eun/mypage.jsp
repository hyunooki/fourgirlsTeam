<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.hinext {
	margin-bottom: 20px;
	text-align: left;
	background-color: #ffcc00;
	color: black;
	padding: 10px;
	border-radius: 5px;
}

.bg-light.p-5.rounded {
	margin-top: 70px;
}

.btn btn-danger rounded-pill px-3 {
	text-align: right;
}

.container {
    display: flex;
    justify-content: flex-end;
}

.payment{

 display: flex;
    justify-content: flex-end;
}

#payments {
    width: 50%; 
    margin: auto;
}

</style>



<div class="bg-light p-5 rounded">
	<h2 class="hinext"></h2>
	<div class="container">
		<button class="btn btn-danger rounded-pill px-3" type="button">회원탈퇴</button>
	</div>
	<p class="lead"></p>

</div>

<div class="h-100 p-5 bg-light border rounded-3" id="qna">
	<h2></h2>
	<h3 style="text-align:left",">나의질문내역</h3>
	<!-- qna테이블 -->
	<table class="table caption-top">
  <caption>List of users</caption>
  <thead>
    <tr>
      <th scope="col">질문번호</th>
      <th scope="col">제목</th>
      <th scope="col">날짜</th>
      <th scope="col">카테고리</th>
    </tr>
  </thead>
  <tbody id="qnatable">
  <!-- 질문내역들어가는곳 -->  
  </tbody>
</table>
	<div class="payment">
	<button class="btn btn-primary d-inline-flex align-items-center" type="button">
	
    질문게시판-> </a>
    <svg class="bi ms-1" width="20" height="20"><use xlink:href="#arrow-right-short"></use></svg>
  </button>
  </div>
</div>

<div class="h-100 p-5 bg-light border rounded-3" id="">
	<h2></h2>
	<h3 style="text-align:left",">나의카트내역</h3>
	<!-- 카트테이블 -->
	<table class="table caption-top">
  <caption>List of users</caption>
  <thead>
    <tr>
      <th scope="col">상품번호</th>
      <th scope="col">상품이름</th>
      <th scope="col">가격</th>
      <th scope="col">사진</th>
    </tr>
  </thead>
  <tbody id="cartstable">
  <!-- 카트내역들어가는곳 -->  
  </tbody>
</table>
	<div class="payment">
	
  </div>
</div>

<div class="h-100 p-5 bg-light border rounded-3" id="">
	<h2></h2>
	<h3 style="text-align:left",">나의결제내역</h3>
	<!-- 결제테이블 -->
	<table class="table caption-top">
  <caption>List of users</caption>
  <thead>
    <tr>
      <th scope="col">상품번호</th>
      <th scope="col">상품이름</th>
      <th scope="col">결제날짜</th>
      <th scope="col">pdf</th>
      <th scope="col">카테고리네임</th>
    </tr> 
  </thead>
  <tbody id="paymenttable">
  <!-- payment 내역들어가는곳 -->  
  </tbody>
</table>
	<div class="payment">
	<button class="btn btn-primary d-inline-flex align-items-center" type="button">
           결제->
    <svg class="bi ms-1" width="20" height="20"><use xlink:href="#arrow-right-short"></use></svg>
  </button>
  </div>
</div>





<script src="js/mypage/mypage.js"></script>