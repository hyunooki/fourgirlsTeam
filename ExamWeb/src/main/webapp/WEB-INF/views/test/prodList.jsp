<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.block2-pic>img{
		height:270px; 
		width:200px; 
		!important;
	}
</style>
<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52 mt-5">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						 Filter
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input id="inputValue" class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search"
						onkeypress="search(event)">
					</div>	
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								정렬
							</div>

							<ul>
								<li class="p-b-6">
									<a href="http://localhost/ExamWeb/prodList.do?asc=1" class="filter-link stext-106 trans-04">
										오름차순
									</a>
								</li>

								<li class="p-b-6">
									<a href="http://localhost/ExamWeb/prodList.do?asc=0" class="filter-link stext-106 trans-04">
										내림차순
									</a>
								</li>

							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								가격
							</div>

							<ul>
								<li class="p-b-6">
									<a href="http://localhost/ExamWeb/prodList.do?priceAsc=1" class="filter-link stext-106 trans-04 filter-link-active">
										오름차순
									</a>
								</li>

								<li class="p-b-6">
									<a href="http://localhost/ExamWeb/prodList.do?priceAsc=0" class="filter-link stext-106 trans-04">
										내림차순
									</a>
								</li>
												
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							

			
						</div>

						<div class="filter-col4 p-b-27">
							

							
						</div>
					</div>
				</div>
			</div>

			<div class="row isotope-grid">
			  <c:forEach var="prodList" items="${prodList}"> 
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="file/${prodList.image}" alt="IMG-PRODUCT">

							<a href="detail.do?pno=${prodList.prodNo}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 ">
								Quick View
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${prodList.prodName}
								</a>

								<span class="stext-105 cl3">
									${prodList.price}
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a class="btn-addwish-b2 dis-block pos-relative "><i class="zmdi zmdi-eye"></i>   ${prodList.count}
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

	
			</div>

			<!-- paging 시작. -->
<nav aria-label="...">
	<ul class="pagination">
		<!-- 이전 페이지 여부. -->
		<c:choose>
			<c:when test="${paging.prev }">
				<li class="page-item"><a class="page-link"
					href="boardList.do?page=${paging.startPage - 1 }">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><span class="page-link">Previous</span>
				</li>
			</c:otherwise>
		</c:choose>

		<!-- 페이지 start ~ end 반복 -->
		<c:forEach var="p" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:choose>
				<c:when test="${p == paging.currentPage }">
					<li class="page-item active" aria-current="page"><span
						class="page-link"><c:out value="${p }" /></span></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="prodList.do?page=${p }&name=${name}&asc=${asc}&priceAsc=${priceAsc}">${p }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 이후페이지 여부. -->
		<c:choose>
			<c:when test="${paging.next }">
				<li class="page-item"><a class="page-link"
					href="boardList.do?page=${paging.endPage + 1 }">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><span class="page-link">Next</span>
				</li>
			</c:otherwise>
		</c:choose>

	</ul>
</nav>
<!-- paging 끝. -->
			
			
			
		</div>
	</div>
	

	<script>
	    function search(e){
	    	let inputValue = document.getElementById('inputValue').value;
	    	let code = e.code;
	    	if(e.keyCode === 13){
		location.href = "http://localhost/ExamWeb/prodList.do?name=" + inputValue;
	    }
	   }
	</script>