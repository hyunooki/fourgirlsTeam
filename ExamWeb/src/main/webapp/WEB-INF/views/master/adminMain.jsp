<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src='js/admin/index.global.js'></script>
<script src='js/admin/mainCalander.js'></script>
  <style>
        body {
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }
        
        .row {
            display: flex;
            justify-content: space-between;
        }
        .col-3 {
            margin-top: 20px;
            width: 23%;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
            padding: 20px;
            border: 1px solid #ccc; 
        }
        .col-6 {
            margin-top: 20px;
            margin-bottom: 10px;
            width: 780px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
            padding: 20px;
        }
        
        .chart-container {
            text-align: center;
        }
        
        .bi {
            font-size: 35px;
            line-height: 22px;
        }
        #calendar {
          margin-top:30px !important;
   		  max-width: 1100px;
          margin: 0 auto;
      }


  /* 일요일 날짜: 빨간색 */
	.fc-day-sun a {
    	color: red !important;  /* 일요일 텍스트 색상 빨간색 */
	}

	/* 토요일 날짜: 파란색 */
	.fc-day-sat a {
   	 color: blue !important;  
	}

	/* 월~금 날짜: 검정색 */
		.fc-day-mon a,
		.fc-day-tue a,
		.fc-day-wed a,
		.fc-day-thu a,
		.fc-day-fri a {
 	  	 color: black !important; 
	}

	/* 날짜의 밑줄 제거 */
	.fc-daygrid-day-number {
 		 text-decoration: none !important;  
	}
/* ㄱㄱㄱ */
.fc-col-header-cell a {
  	  text-decoration: none !important;
}
  </style>
</head>
<div class="row">
		<div class="col-3 border-primary"> 
            <i class="bi bi-box float-end text-primary"></i>
            <b><p class="text-primary fs-6" id="jumun">금일 등록건수</p></b>
              <b><p>${todayMake}개</p></b>
        </div>
        <div class="col-3 border-success"> 
            <i class="bi bi-truck float-end text-success"></i>
            <b><p class="text-success fs-6">금일 매출금액</p></b>
            <b><p>${todayRelease}원</p></b>
        </div>
        <div class="col-3 border-secondary"> 
            <i class="bi bi-person-circle float-end text-secondary"></i> 
           <b><p class="text-secondary fs-6">총 회원수</p></b>
           <b><p>${totalMember}명</p></b>
        </div>
        <div class="col-3 border-info"> 
            <i class="bi bi-people-fill float-end text-info"></i>
            <b><p class="text-info fs-6">총 제품수</p></b>
             <b><p>${todayStore}개</p></b>
        </div>
        <div class="col-12 border-danger"> 
		<div id='calendar' class="w-75"></div>
		</div>
</div>