<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#tableMargin{
  margin-top:40px !important;
}
h3{
  text-align: center;
  margin-top:100px !important;
  margin-left:100px !important;
}
.text-center{
     margin-bottom:200px !important;
}

</style>

<div class="d-flex flex-column align-items-center"  style="width:2000px!important;">
  <h3>다운 목록</h3>
  <table id="example" class="display table w-100" style="width:1200px!important;">
        <thead>
            <tr>
              <th><input type="checkbox" name="checkall" id="checkall"></th>
                <th>이름</th>
                <th>구매일</th>
                <th>파일명</th>
                <th>다운로드 횟수</th>
                <th>결제번호</th>
            </tr>
        </thead>
        
    </table>
  <div class="text-center">
    <button class="btn btn-primary" id='downloadBtn'>전송</button>
  </div>
  
</div>
<link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css">
<script src ="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src= "https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
<script src='js/payments/download.js'></script>