<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<style>
	/* 상품 등록 폼 스타일 */
.form-container {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 500px;
    margin: 0 auto;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

label {
    display: block;
    margin-top: 15px;
    font-weight: bold;
    color: #555;
}

input, textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

textarea {
    height: 100px;
    resize: none;
}

input[type="file"] {
    border: none;
    padding: 5px;
}

.button-group {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

button {
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.submit-btn {
    background-color: #007bff;
    color: white;
}

.submit-btn:hover {
    background-color: #0056b3;
}

.cancel-btn {
    background-color: #dc3545;
    color: white;
}

.cancel-btn:hover {
    background-color: #a71d2a;
}
	
</style>

<body>
<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="form-container">
			    <h2>상품 등록</h2><!-- enctype="multipart/form-data" -->
			    <form action="prodInsert.do" method="POST" enctype="multipart/form-data">
			        <label for="productName">상품명</label>
			        <input type="text" id="productName" name="prodName" placeholder="상품명을 입력하세요" required>
			
			        <label for="productDesc">상품 설명</label>
			        <textarea id="productDesc" name="content" placeholder="상품 설명을 입력하세요" required></textarea>
			
			        <label for="seller">등록자</label>
			        <input type="text" id="seller" name="userId" placeholder="등록자명을 입력하세요" required value="${loginId}" readonly>
			
			        <label for="price">가격</label>
			        <input type="number" id="price" name="price" placeholder="가격을 입력하세요" required>
			
			        <label for="pages">페이지 수</label>
			        <input type="number" id="page" name="page" placeholder="페이지 수를 입력하세요" required>
			
			        <label for="image">이미지</label>
			        <input type="file" id="image" name="image">
			
			        <label for="fileUpload">파일 업로드</label>
			        <input type="file" id="fileUpload" name="pdf">
			        
			        <p>${msg}</p>
			
			        <div class="button-group">
			            <button type="submit" class="submit-btn">등록</button>
			            <button type="reset" class="cancel-btn">취소</button>
			        </div>
			    </form>
			</div>
		</div>
</div>

