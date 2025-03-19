<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">

				<div class="item-slick1" style="background-image: url(images/slide-03.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" id="cheer" data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									정처기준비 2025
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									최신기출 준비
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="rotateIn" data-delay="1600">
								<a href="prodList.do" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									시험지구매
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
	
let userCheerPos=
document.querySelector("#cheer");
	
let userCheerhtml=``;
fetch('myinfo.do')
.then(result => result.json())
.then(result => {
		console.log(result);
	   
		console.log(result.userName); 
		userCheerhtml='<span class="ltext-101 cl2 respon2">'+'화이팅 '+result.userName+'!'+'</span>';
		console.log(userCheerhtml);
		userCheerPos.innerHTML=userCheerhtml;
		
	});	
	
	
	
	
	</script>
	