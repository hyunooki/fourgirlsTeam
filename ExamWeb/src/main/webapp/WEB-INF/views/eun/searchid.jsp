<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="container">
	<!-- 후보2 -->
	<form action="searchidhandle.do" method="post"
		class="php-email-form aos-init aos-animate" data-aos="fade-up"
		data-aos-delay="200">
		<div class="row">
		<!-- 	<h3>이름</h3> -->
			<div class="col-6">
				<label for="name-field" class="pb-2">이름</label> 
			</div>
			<div class="col-6">
			<input
					type="text" name="name" id="name-field" class="form-control"
					required="">
			</div>
		</div>
		<div class="row">
			<!-- <h3>이메일</h3> -->
			<div class="col-6">
				<label for="email-field" class="pb-2">이메일</label>
			</div>
			<div class="col-6">
			 <input
					type="email" class="form-control" name="email" id="email-field"
					required="">
			</div>
		</div>
		<div class="row">
			<!-- <h3>날짜</h3> -->
			<div class="col-6 ">
				<label for="subject-field" class="pb-2">생년월일</label>
			</div>
			<div class="col-6"> <input
					type="date" class="form-control" name="birth" id="subject-field"
					required="">
			</div>
		</div>
		<div class="row">
		   
			<button type="button" class="col btn btn-success" id="sendemail">아이디비번찾기</button>
			<!-- 
			<button type="submit" class="col-6 btn btn-success">아이디비번찾기</button> -->
		</div>
	</form>
</div>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js">
	
</script>
<script src="js/sendemail/sendemail.js"></script>


