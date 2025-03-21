<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.how-itemcart1>img{
  width:100px !important;
}
</style>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Shoping Cart
			</span>
		</div>
	</div>
<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-3 text-center">사진</th>
									<th class="column-2 text-center" >상품명</th>
									<th class="column-2 text-center">금액</th>
									<th class="column-2 text-center">삭제</th>
								</tr>
				
							<c:forEach var="info" items="${list }">
								<tr class="table_row " data-id=${info.payNo}>
									<td class="column-3">
										<div class="how-itemcart1 text-center">
											<img src="file/${info.image} " alt="IMG">
										</div>
									</td>
									<td class="column-2">${info.prodName}</td>
									<td class="column-2">${info.price}</td>
									<td class="column-2"><button class='btn btn-danger' type="button">삭제</button></td>
								</tr>
							</c:forEach>
							</table>
							<div id="nullCheck">
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Payment Totals
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="mtext-101 cl2">
				                 
								</span>
							</div>

						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									
								</span>
							</div>
						</div>

						<button type="button" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" id="paymentBtn">
							결제
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script src='js/payments/payment.js'></script>
	