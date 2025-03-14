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

        .logo b {
            font-weight: 700; /* TEST 부분 굵게 */
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
						<a href="register.do" class="flex-c-m trans-04 p-lr-25"> 회원가입 </a>
					</c:when>
					<c:otherwise>
					
					<a href="#" class="flex-c-m trans-04 p-lr-25"> 자주하는질문</a>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${empty loginId }">
						<a href="login.do" class="flex-c-m trans-04 p-lr-25"> 로그인 </a>
					</c:when>
					<c:otherwise>
						<a href="logout.do" class="flex-c-m trans-04 p-lr-25"> 로그아웃 </a>
						<a href="#" class="flex-c-m trans-04 p-lr-25"> 마이페이지 </a>
					</c:otherwise>
				</c:choose>



			</div>
		</div>
	</div>

	<div class="wrap-menu-desktop">
		<nav class="limiter-menu-desktop container">

			<!-- Logo desktop -->
			<a href="#" class="logo"> <img src="images/icons/logo-01.png"
				alt="IMG-LOGO">
			</a>

			 <div class="logo-container">
        <span class="logo"><b>TEST</b> STORE</span>
    </div>


			<!-- Menu desktop -->
			<div class="menu-desktop">
				<ul class="main-menu">
					<li class="active-menu"><a href="index.html">시험지구매</a>
						<ul class="sub-menu">
							<li><a href="index.html">Homepage 1</a></li>
							<li><a href="home-02.html">Homepage 2</a></li>
							<li><a href="home-03.html">Homepage 3</a></li>
						</ul></li>

					<li><a href="product.html">QNA</a></li>

					<li class="label1"><a href="shoping-cart.html">장바구니</a></li>


					<li class="testpaper"><a href="blog.html">시험지등록</a></li>



				</ul>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m">
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
					data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#"
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
					data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>
		</nav>
	</div>
</div>

<script>
	console.log('테스트중...');
</script>