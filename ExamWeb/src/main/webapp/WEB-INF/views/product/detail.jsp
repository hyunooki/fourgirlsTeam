<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
		<button class="how-pos3 hov3 trans-04 js-hide-modal1">
			<img src="images/icons/icon-close.png" alt="CLOSE">
		</button>
		<br>

		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-50 p-lr-0-lg">
					<div class="wrap-slick3 flex-sb flex-w">

						<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

						<div class="slick3 gallery-lb">
							<div class="item-slick3"
								data-thumb="images/product-detail-01.jpg">
								<div class="wrap-pic-w pos-relative">
									<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT">

								</div>
							</div>


						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg">
					<h4 class="mtext-105 cl2 js-name-detail p-b-14">
						${product.prodName}</h4>

					<span class="mtext-106 cl2"> ${product.price} </span>

					<p class="stext-102 cl3 p-t-23">
						등록자 ${product.userId} <br> 등록일 ${product.createDate} <br>
						조회수 ${product.count} <br> 형태 PDF<br> 파일 다운로드
						${product.pdf}
					</p>
					<p class="stext-102 cl3 p-t-23">${product.content}</p>

					<!--  -->



					<div style="display: inline-block">
						<button
							class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
							style="margin: 10px">장바구니 담기</button>
						<button
							class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
							style="margin: 10px">결제하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<form>
		<label>제목
		<input type="text" id="revTitle" placeholder="제목" style="border:1px"></label>
		<label>별점
		<input type="text" id="star" placeholder="별점"></label>
		<label>내용
		<input type="text" id="content" placeholder="내용"></label>
		<button id="addReply" class="btn btn-primary">리뷰등록</button>
		</form>	
		
		<table class="display table" style="width:95%; margin:auto;">
				<tr>
					<th class="text-center" style="width:10%">번호</th>
					<th class="text-center" style="width:20%">등록일</th>
					<th class="text-center" style="width:15%">제목</th>
					<th class="text-center" style="width:10%">별점</th>
					<th class="text-center" style="width:20%">내용</th>
					<th class="text-center" style="width:15%">작성자</th>
				</tr>				
		</table>
		<div id="review">
		
		</div>
		<nav aria-label="Page navigation example" id="pagingMargin">
		<ul class="pagination justify-content-center">
			
			
		</ul>
	</nav>


	</div>
</div>
<script>
let prodNo =${product.prodNo}
</script>
<script src="js/prod/replyPage.js"></script>