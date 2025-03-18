<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='js/admin/index.global.js'></script>
<script src='js/admin/full.js'></script>
<!-- SweetAlert2 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
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
<body>

  <div id='calendar'></div>

</body>
</html>