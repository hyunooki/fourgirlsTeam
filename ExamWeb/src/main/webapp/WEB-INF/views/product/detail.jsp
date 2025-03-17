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
		<div class="review"></div>
		 <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
            	<th>번호</th>
                <th>등록일</th>
                <th>제목</th>
                <th>별점</th>
                <th>내용</th>
                <th>작성자</th>
            </tr>
        </thead>
    </table>


	</div>
</div>
<script>
// 목록메소드.

	fetch('replyList.do?pno=' + ${product.prodNo} )
		.then(result => result.json()) // 화살표 함수.
		.then(list =>{
			list.forEach(reply => {
				let tag = `<p>\${reply.revNo}
							\${reply.revCreate}
							\${reply.revTitle}
							\${reply.starPoint}
							\${reply.revContent}
							\${reply.userId}</p>
							`;
				document.querySelector('.review')
						.insertAdjacentHTML("afterend", tag);
			})
		}) // 정상처리시 실행함수.
		.catch(err => console.log(err)) // 에러시 실행할 함수.

</script>