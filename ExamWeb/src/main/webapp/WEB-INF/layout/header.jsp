<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #f5f3ef; /* 연한 배경색 */
	text-align: center;
}

.header {
	background-color: #222; /* 상단 검은 배경 */
	color: white;
	padding: 10px 0;
	font-size: 14px;
}

.logo-container {
	padding: 40px 0;
}

.logo {
	font-size: 32px;
	font-weight: 400; /* 일반 글자 */
	color: #333; /* 기본 색상 */
}

}
.logo b {
	font-weight: 700;
}
</style>
<div class="container-menu-desktop">
	<!-- Topbar -->
	<div class="top-bar">
		<div class="content-topbar flex-sb-m h-full container">
			<div class="left-top-bar">Free shipping for standard order over
				$100</div>

			<div class="right-top-bar flex-w h-full">
				<c:choose>
					<c:when test="${empty loginId }">
						<a href="searchid.do" class="flex-c-m trans-04 p-lr-25">id,pw찾기</a>
						<a href="register.do" class="flex-c-m trans-04 p-lr-25"> 회원가입
						</a>
					</c:when>
					<c:otherwise>

						<a href="qnaList.do" class="flex-c-m trans-04 p-lr-25"> 자주하는질문</a>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${empty loginId }">
						<a href="login.do" class="flex-c-m trans-04 p-lr-25"> 로그인 </a>
					</c:when>
					<c:otherwise>
						<a href="logout.do" class="flex-c-m trans-04 p-lr-25"> 로그아웃 </a>
						<a href="mypage.do" class="flex-c-m trans-04 p-lr-25"> 마이페이지 </a>
					</c:otherwise>
				</c:choose>



			</div>
		</div>
	</div>

	<div class="wrap-menu-desktop">
		<nav class="limiter-menu-desktop container">

			<!-- Logo desktop -->

			<!--  <img src="images/icons/logo-01.png"
				alt="IMG-LOGO"> -->

			<div class="logo-container">
				<span class="logo"> <a href="main.do" class="logo"><b>TEST</b>
						STORE</a>
				</span>
			</div>


			<!-- Menu desktop -->
			<div class="menu-desktop">
				<ul class="main-menu">
					<li class="menu"><a href="prodList.do">시험지구매</a> <!--  <ul class="sub-menu">
							<li><a href="index.html">Homepage 1</a></li>
							<li><a href="home-02.html">Homepage 2</a></li>
							<li><a href="home-03.html">Homepage 3</a></li>
						</ul>--></li>

					<li><a href="qnaList.do">QNA</a></li>
					<c:choose>
						<c:when test="${userType=='user' }">
						
							<li class="label1"><a href="mypage.do">마이페이지</a></li>

							<li class="label1"><a href="paymentForm.do">결제하기</a></li>

							<li class="testpaper"><a href="downloadPage.do">결제품목</a></li>

						</c:when>
					</c:choose>


					<c:choose>
						<c:when test="${userType=='admin' }">

							<li class="testpaper"><a href="adminMain.do">관리자페이지</a></li>
							<li class="testpaper"><a href="prodInsertForm.do">시험지등록</a></li>
							<li class="testpaper"><a href="downloadPage.do">결제품목</a></li>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<!-- <li class="testpaper"><a href="qnaList.do">QNA</a></li> -->
				</ul>
			</div>
			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m">
				<!--  <div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>-->


				<div></div>

				<c:if test="${!empty loginId }">

					<!-- <div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"

						data-notify="">
						<i class="zmdi zmdi-shopping-cart"></i> 
					</div>-->
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
				</c:if>

					>
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
				</c:if>

				<a href="#"
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
					data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
				</a>


			</div>
		</nav>
	</div>
</div>

<script>
	console.log('테스트중...nnnffffffffffffnn');
</script>