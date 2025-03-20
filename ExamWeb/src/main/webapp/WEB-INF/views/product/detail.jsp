<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
#img{
	border: 1px solid lightgray;
	height:500px !important;
	width:auto !important;
	text-align: right !important;
}
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
       .rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd}
.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } 
</style>
</head>
<div class="container">
	<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
		<button class="how-pos3 hov3 trans-04 js-hide-modal1">
			<img src="images/icons/icon-close.png" alt="CLOSE">
		</button>
		<br>

		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-50 p-lr-0-lg">
					<div class="wrap-slick3" style="padding-left:250px;">

						<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

						<div class="slick3 gallery-lb">
							<div class="item-slick3" 
								data-thumb="images/product-detail-01.jpg">
								<div class="wrap-pic-w pos-relative">
									<img id="img" src="file/${product.image}" alt="IMG-PRODUCT">

								</div>
							</div>


						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg" style="padding-top:50px; padding-right:200px;">
					<h4 class="mtext-105 cl2 js-name-detail p-b-14">
						${product.prodName}</h4>

					<span class="mtext-106 cl2"> ${product.price} </span>

					<p class="stext-102 cl3 p-t-23">
						등록자 ${product.userId} <br> 등록일 ${product.createDate} <br>
						조회수 ${product.count} <br>
						<div class="float-start" style="color:red">
						<c:forEach var='i' begin="1" end="${product.starPoint}" step="1">★</c:forEach>
						</div>
						형태 PDF<br> 파일 다운로드
						${product.pdf}
					</p>
					<p class="stext-102 cl3 p-t-23">${product.content}</p>

					<!--  -->



					<div style="display: inline-block">
						<button type="button" id="cartButton"
						 class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 "
							style="margin: 10px">장바구니 담기</button>
						<button type="button" id="payButton"
							class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 "
							style="margin: 10px">결제하기</button>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		<h5 class="mb-3">리뷰작성</h5>
		<div class="d-flex justify-content-center">
		<input type="text" id="revTitle" class="form-control mb-3 w-50" name="revTitle" placeholder="제목"></label>
		</div>
		<div class="d-flex justify-content-center">
	
		
        					<fieldset class="rate" id="star" name="starPoint">
                                <input type="radio" id="rating10" name="rating" value="5"><label for="rating10" title="5점"></label>
                                <input type="radio" id="rating8" name="rating" value="4"><label for="rating8" title="4점"></label>
                                <input type="radio" id="rating6" name="rating" value="3"><label for="rating6" title="3점"></label>
                                <input type="radio" id="rating4" name="rating" value="2"><label for="rating4" title="2점"></label>
                                <input type="radio" id="rating2" name="rating" value="1"><label for="rating2" title="1점"></label>
                                

                            </fieldset>
		</div>
		<div class="d-flex justify-content-center">
		<textarea class="form-control mb-3 w-50" id="content" name="revContent" placeholder="내용"></textarea>
		</div>
		<button type="button" id="addReply" class="btn btn-primary mb-3">리뷰등록</button>
		
		
		
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
let loginId = '${loginId}'
</script>
<script src="js/prod/replyPage.js"></script>