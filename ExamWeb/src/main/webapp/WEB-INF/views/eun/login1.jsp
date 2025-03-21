<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="keywords" content="SignUp, Login, Register">
<meta name="keywords" content="Sign up, Sign in">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<!--Bootstrap Css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--Font-aweome-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<!--Custom Css-->
<link type="text/css" rel="stylesheet" href="css/login.css" />
</head>

<body>
	<section class="login_section">
		<div class="container outer_container accounts_container">
			<div class="row h-100">
				<div
					class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
					<div class="accounts_image w-100 h-100">
						<img
							src="https://img.freepik.com/free-photo/social-media-instagram-digital-marketing-concept-3d-rendering_106244-1717.jpg?t=st=1647414398~exp=1647414998~hmac=2c478ef6affd973ccd71ea4d394d9283db4a0c6c4c686ba0b9f6091c8a56e5a1&w=1480"
							alt="accounts_image" class="img-fluid w-100 h-100" />
					</div>
					<!--accounts_image-->
				</div>
				<!--account_col-->
				<div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">
					<div class="accounts_forms signup_form w-100 h-100" id="signup">
						<div class="title mt-4 p-4 w-100">
							<h1>Sign Up</h1>
							<p class="mt-3">Lorem ipsum dolor sit amet consectetur
								adipisicing elit.</p>
						</div>
						<!--title-->


						<div class="already_member_box">
							<p class="text-center" id="to_login">I am already member</p>
						</div>
					</div>
					<!--accounts_forms-->
					<div class="accounts_forms  w-100 h-100" id="login">
						<div class="title  mt-4 p-4 w-100">
							<h1>Sign In</h1>
							<p class="mt-3">Lorem ipsum dolor sit amet consectetur
								adipisicing elit.</p>
						</div>
						<!--title-->
						<form method="post" action="loginhandle.do" name="form" id="form"
							class="form  w-100 p-4" id="form">
							<div class="form-group">
								<label for="id">id</label> <input type="text" name="uname"
									class="form-control" id="id" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="login_password">Password</label> <i
									class="fa fa-eye-slash" id="eye_icon_login"></i> <input
									type="password" name="psw" class="form-control"
									id="login_password" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<!-- 로그인이 잘못되었을경우 -->
							<c:choose>
								<c:when test="${result=='No' }">
									<c:choose>
										<c:when test="${outmems=='no'}">
											<div class="alert alert-danger d-flex align-items-center"
												role="alert">
												<svg class="bi flex-shrink-0 me-2" width="24" height="24"
													role="img" aria-label="Danger:">
								<use xlink:href="#exclamation-triangle-fill" /></svg>
												<p>로그인 다시 확인해주세요</p>
											</div>
										</c:when>
										
										<c:when test="${outmems=='ok'}">
											<div class="alert alert-danger d-flex align-items-center"
												role="alert">
												<svg class="bi flex-shrink-0 me-2" width="24" height="24"
													role="img" aria-label="Danger:">
								<use xlink:href="#exclamation-triangle-fill" /></svg>
												<p>탈퇴한회원입니다</p>
											</div>
										</c:when>
										
										<c:otherwise>
										</c:otherwise>
										
										
									</c:choose>
								</c:when>
								
								<c:otherwise>
								</c:otherwise>
							</c:choose>


							<div class="form-group mb-0">
								<button type="submit" class="btn btn-primary register_btn w-100">Sign
									In</button>
							</div>
						</form>

						<div
							class="already_member_box d-flex justify-content-between px-4">
							<span class="text-center" id="to_signup"><a
								href="register.do">Create an account?</a></span> <span
								class="text-center"><a href="searchid.do">Forgot
									password</a></span>
						</div>
					</div>
					<!--accounts_forms-->
				</div>
				<!--account_col-->
			</div>
			<!--row-->
		</div>
		<!--accounts_container-->
	</section>
	<!--login_section-->

	<!-- jQuery library -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<!-- Popper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<!--Custom Js-->
	<script type="text/javascript" src="js/app.js"></script>
	<!-- <script type="text/javascript" src="js/login/login.js"></script> -->
</body>

</html>