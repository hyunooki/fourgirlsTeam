<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<head>
	 <style>
	     .p-t-23{
	       margin-top:100px !important;
	     }
	     table{
	      background-color:white
	     }
	 </style>
	</head>
    
    <section class="bg0 p-t-23 p-b-10">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5">
					Qna 목록
				</h3>
			</div>
			<div class="flex-w flex-sb-m p-b-30">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*" data-cate=''>
						All Products
					</button>
					<c:forEach var="info" items="${cateList}">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-cate="${info.categoryNo}">
						${info.categoryName}
					</button>
					</c:forEach>
					
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
						<select class="me-5" id="select">
						  <option value=''>항목을 선택하세요</option>
						  <option value='title'>제목</option>
						  <option value='content'>내용</option>
						  <option value='writer'>작성자</option>
						</select>
						<input class="mtext-107 cl2 size-114 plh2 p-r-15 ps-4" type="text" name="search-product" placeholder="Search">
					</div>	
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27" id="orderby">
							<div class="mtext-102 cl2 p-b-15">
								Sort By
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04" data-id="search">
										조회순
									</a>
								</li>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04" data-id="fast">
										최신순
									</a>
								</li>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04" data-id="last">
										오래된순
									</a>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="container text-center">
    <table class="table w-75 mx-auto">
        <thead>
            <tr class="text-start">
                <th>#</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>작성일</th>
                <th>카테고리</th>
            </tr>
        </thead>
        <tbody>
          
        </tbody>
    </table>
</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			
			
		</ul>
	</nav>
	<button class='btn btn-primary mt-1' type="button" id="addBtn" >등록</button>
	</section>
	<script>
	let logId = '${loginId}'
	</script>
	<script src="js/qna/qna.js"></script>