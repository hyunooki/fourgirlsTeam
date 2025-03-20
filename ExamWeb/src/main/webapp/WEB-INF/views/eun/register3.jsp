<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
--docsearch-primary-color: #5468ff ;
    --docsearch-text-color: #1c1e21 ;
    --docsearch-spacing: 12px ;
    --docsearch-icon-stroke-width: 1.4 ;
    --docsearch-highlight-color: var(--docsearch-primary-color) ;
    --docsearch-muted-color: #969faf ;
    --docsearch-container-background: rgba(101, 108, 133, .8) ;
    --docsearch-logo-color: #5468ff ;
    --docsearch-modal-width: 560px ;
    --docsearch-modal-height: 600px ;
    --docsearch-modal-background: #f5f6f7 ;
    --docsearch-modal-shadow: inset 1px 1px 0 0 hsla(0, 0 %, 100 %, .5),
	0 3px 8px 0 #555a64 ;
    --docsearch-searchbox-height: 56px ;
    --docsearch-searchbox-background: #ebedf0 ;
    --docsearch-searchbox-focus-background: #fff ;
    --docsearch-searchbox-shadow: inset 0 0 0 2px var(--docsearch-primary-color)
	;
    --docsearch-hit-height: 56px ;
    --docsearch-hit-color: #444950 ;
    --docsearch-hit-active-color: #fff ;
    --docsearch-hit-background: #fff ;
    --docsearch-hit-shadow: 0 1px 3px 0 #d4d9e1 ;
    --docsearch-key-gradient: linear-gradient(-225deg, #d5dbe4, #f8f8f8)
	;
    --docsearch-key-shadow: inset 0 -2px 0 0 #cdcde6, inset 0 0 1px 1px #fff,
	0 1px 2px 1px rgba(30, 35, 90, .4) ;
    --docsearch-key-pressed-shadow: inset 0 -2px 0 0 #cdcde6, inset 0 0 1px 1px #fff,
	0 1px 1px 0 rgba(30, 35, 90, .4) ;
    --docsearch-footer-height: 44px ;
    --docsearch-footer-background: #fff ;
    --docsearch-footer-shadow: 0 -1px 0 0 #e0e3e8, 0 -3px 6px 0 rgba(69,
	98, 155, .12) ;
    --bs-blue: #0d6efd ;
    --bs-indigo: #6610f2 ;
    --bs-purple: #6f42c1 ;
    --bs-pink: #d63384 ;
    --bs-red: #dc3545 ;
    --bs-orange: #fd7e14 ;
    --bs-yellow: #ffc107 ;
    --bs-green: #198754 ;
    --bs-teal: #20c997 ;
    --bs-cyan: #0dcaf0 ;
    --bs-black: #000 ;
    --bs-white: #fff ;
    --bs-gray: #6c757d ;
    --bs-gray-dark: #343a40 ;
    --bs-gray-100: #f8f9fa ;
    --bs-gray-200: #e9ecef ;
    --bs-gray-300: #dee2e6 ;
    --bs-gray-400: #ced4da ;
    --bs-gray-500: #adb5bd ;
    --bs-gray-600: #6c757d ;
    --bs-gray-700: #495057 ;
    --bs-gray-800: #343a40 ;
    --bs-gray-900: #212529 ;
    --bs-primary: #0d6efd ;
    --bs-secondary: #6c757d ;
    --bs-success: #198754 ;
    --bs-info: #0dcaf0 ;
    --bs-warning: #ffc107 ;
    --bs-danger: #dc3545 ;
    --bs-light: #f8f9fa ;
    --bs-dark: #212529 ;
    --bs-primary-rgb: 13, 110, 253 ;
    --bs-secondary-rgb: 108, 117, 125 ;
    --bs-success-rgb: 25, 135, 84 ;
    --bs-info-rgb: 13, 202, 240 ;
    --bs-warning-rgb: 255, 193, 7 ;
    --bs-danger-rgb: 220, 53, 69 ;
    --bs-light-rgb: 248, 249, 250 ;
    --bs-dark-rgb: 33, 37, 41 ;
    --bs-primary-text-emphasis: #052c65 ;
    --bs-secondary-text-emphasis: #2b2f32 ;
    --bs-success-text-emphasis: #0a3622 ;
    --bs-info-text-emphasis: #055160 ;
    --bs-warning-text-emphasis: #664d03 ;
    --bs-danger-text-emphasis: #58151c ;
    --bs-light-text-emphasis: #495057 ;
    --bs-dark-text-emphasis: #495057 ;
    --bs-primary-bg-subtle: #cfe2ff ;
    --bs-secondary-bg-subtle: #e2e3e5 ;
    --bs-success-bg-subtle: #d1e7dd ;
    --bs-info-bg-subtle: #cff4fc ;
    --bs-warning-bg-subtle: #fff3cd ;
    --bs-danger-bg-subtle: #f8d7da ;
    --bs-light-bg-subtle: #fcfcfd ;
    --bs-dark-bg-subtle: #ced4da ;
    --bs-primary-border-subtle: #9ec5fe ;
    --bs-secondary-border-subtle: #c4c8cb ;
    --bs-success-border-subtle: #a3cfbb ;
    --bs-info-border-subtle: #9eeaf9 ;
    --bs-warning-border-subtle: #ffe69c ;
    --bs-danger-border-subtle: #f1aeb5 ;
    --bs-light-border-subtle: #e9ecef ;
    --bs-dark-border-subtle: #adb5bd ;
    --bs-white-rgb: 255, 255, 255 ;
    --bs-black-rgb: 0, 0, 0 ;
    --bs-font-sans-serif: system-ui, -apple-system, "Segoe UI ", Roboto,
	"Helvetica Neue ", "Noto Sans ", "Liberation Sans ", Arial, sans-serif,
	"Apple Color Emoji ", "Segoe UI Emoji ", "Segoe UI Symbol ", "Noto Color Emoji
	";
    --bs-font-monospace: SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono
	", "Courier New ", monospace ;
    --bs-gradient: linear-gradient(180deg, rgba(255, 255, 255, 0.15),
	rgba(255, 255, 255, 0)) ;
    --bs-body-font-family: var(--bs-font-sans-serif) ;
    --bs-body-font-size: 1rem ;
    --bs-body-font-weight: 400 ;
    --bs-body-line-height: 1.5 ;
    --bs-body-color: #212529 ;
    --bs-body-color-rgb: 33, 37, 41 ;
    --bs-body-bg: #fff ;
    --bs-body-bg-rgb: 255, 255, 255 ;
    --bs-emphasis-color: #000 ;
    --bs-emphasis-color-rgb: 0, 0, 0 ;
    --bs-secondary-color: rgba(33, 37, 41, 0.75) ;
    --bs-secondary-color-rgb: 33, 37, 41 ;
    --bs-secondary-bg: #e9ecef ;
    --bs-secondary-bg-rgb: 233, 236, 239 ;
    --bs-tertiary-color: rgba(33, 37, 41, 0.5) ;
    --bs-tertiary-color-rgb: 33, 37, 41 ;
    --bs-tertiary-bg: #f8f9fa ;
    --bs-tertiary-bg-rgb: 248, 249, 250 ;
    --bs-heading-color: inherit ;
    --bs-link-color: #0d6efd ;
    --bs-link-color-rgb: 13, 110, 253 ;
    --bs-link-decoration: underline ;
    --bs-link-hover-color: #0a58ca ;
    --bs-link-hover-color-rgb: 10, 88, 202 ;
    --bs-code-color: #d63384 ;
    --bs-highlight-color: #212529 ;
    --bs-highlight-bg: #fff3cd ;
    --bs-border-width: 1px ;
    --bs-border-style: solid ;
    --bs-border-color: #dee2e6 ;
    --bs-border-color-translucent: rgba(0, 0, 0, 0.175) ;
    --bs-border-radius: 0.375rem ;
    --bs-border-radius-sm: 0.25rem ;
    --bs-border-radius-lg: 0.5rem ;
    --bs-border-radius-xl: 1rem ;
    --bs-border-radius-xxl: 2rem ;
    --bs-border-radius-2xl: var(--bs-border-radius-xxl) ;
    --bs-border-radius-pill: 50rem ;
    --bs-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) ;
    --bs-box-shadow-sm: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) ;
    --bs-box-shadow-lg: 0 1rem 3rem rgba(0, 0, 0, 0.175) ;
    --bs-box-shadow-inset: inset 0 1px 2px rgba(0, 0, 0, 0.075) ;
    --bs-focus-ring-width: 0.25rem ;
    --bs-focus-ring-opacity: 0.25 ;
    --bs-focus-ring-color: rgba(13, 110, 253, 0.25) ;
    --bs-form-valid-color: #198754 ;
    --bs-form-valid-border-color: #198754 ;
    --bs-form-invalid-color: #dc3545 ;
    --bs-form-invalid-border-color: #dc3545 ;
    --bs-breakpoint-xs: 0 ;
    --bs-breakpoint-sm: 576px ;
    --bs-breakpoint-md: 768px ;
    --bs-breakpoint-lg: 992px ;
    --bs-breakpoint-xl: 1200px ;
    --bs-breakpoint-xxl: 1400px ;
    font-family: var(--bs-body-font-family) ;
    font-size: var(--bs-body-font-size) ;
    font-weight: var(--bs-body-font-weight) ;
    line-height: var(--bs-body-line-height) ;
    color: var(--bs-body-color) ;
    text-align: var(--bs-body-text-align) ;
    -webkit-text-size-adjust: 100 %;
    -webkit-tap-highlight-color: transparent ;
    --bs-bg-opacity: 1 ;
    box-sizing: border-box ;
    display: flex ;
    flex-wrap: wrap ;
    margin-top: calc(-1 * var(--bs-gutter-y)) ;
    margin-right: calc(-.5 * var(--bs-gutter-x)) ;
    margin-left: calc(-.5 * var(--bs-gutter-x)) ;
    --bs-gutter-x: 1rem ;
    --bs-gutter-y: 1rem ;
 


.form-container {
    margin-top: 100px !important;
    max-width: 900px;
    width: 100%;
    position: relative;
    z-index: 10;
}

header input {
    max-width: 200px;
    height: 35px;
}

.row {
    margin-left: auto;
    margin-right: auto;
}

.form-control {
    width: 300px; 
}

.test {
    display: flex;
    align-items: center;
    justify-content: center; 
    margin-bottom: 10px; 
}

#test-label {
    width: 120px; 
    text-align: right;
    margin-right: 10px;
}

.form-group input {
    width: 250px; 
}
.form-container {
    display: flex;
    flex-direction: column;
    align-items: center; 
    justify-content: center;
}

.form-container {
    margin: 80px auto 0 auto;
    width: 50%; 
    text-align: center;
}


.form-group {
    display: flex;
    align-items: center; /* 라벨과 input을 수직 정렬 */
    justify-content: center; /* input을 가운데 정렬 */
    margin-bottom: 10px; /* 입력칸 간격 */
    width: 100%;
}

.form-group label {
    width: 120px; /* 라벨 크기 조정 */
    text-align: right; /* 텍스트 오른쪽 정렬 */
    margin-right: 10px;
}

.form-group input {
    width: 250px;
    text-align: center;
}



</style>

<form action="registerhandle.do" method="post">
<div class="form-container">
<h3>회원가입</h3>
    <div class="form-group">
        <label for="id">아이디</label>
        <input type="text" class="form-control" id="id" name="id" required="">
        <button class="btn btn-primary rounded-pill px-3" type="button">중복확인</button>
        <c:choose>
        <c:when test="${checkOverlap > 0 }">
        <div class="alert alert-danger d-flex align-items-center"
							role="alert">
							<svg class="bi flex-shrink-0 me-2" width="24" height="24"
								role="img" aria-label="Danger:">
								<use xlink:href="#exclamation-triangle-fill" /></svg>
							<p>이미존재하는 아이디입니다</p>
						</div>
        </c:when>
       
        </c:choose>
    </div>

    <div class="form-group">
        <label for="password">비밀번호</label>
        <input type="password" class="form-control" name="password" id="password" required="">
    </div>

    <div class="form-group">
        <label for="passwordcheck">비밀번호 확인</label>
        <input type="password" class="form-control" name="" id="passwordcheck" required="비밀번호입력하세요">
    </div>

    <div class="form-group">
        <label for="name">이름</label>
        <input type="text" class="form-control" name="username" id="name" required="">
    </div>

    <div class="form-group">
        <label for="nickname">이메일</label>
        <input type="email" class="form-control"name="email" id="email" required="">
    </div>
    
      <div class="form-group">
        <label for="birth">생년월일</label>
        <input type="date" class="form-control" name="birth" id="birth" required="">
    </div>
     
    

     <div class="form-group">
        <label for="address">우편번호</label>
        <input type="text" class="form-control" name="postcode"  id="postcode" placeholder="우편번호" required="">
    </div> 
      <div class="form-group">
        <label for="address">주소</label>
        <input type="text" class="form-control" name="address"  id="address" placeholder="주소" required="">
    </div> 
      <div class="form-group">
        <label for="detailAddress">상세주소</label>
        <input type="text" class="form-control" name="detailAddress"  id="detailAddress" placeholder="주소" required="">
    </div> 
    <button type="button" onclick="execDaumPostcode()" class="btn btn-success">주소찾기</button> 

    
  <!-- <label>우편번호</label>
    <input type="text" id="postcode" placeholder="우편번호">
  
    
    <label>주소</label>
    <input type="text" id="address" placeholder="주소">
    
    <label>상세주소</label>
    <input type="text" id="detailAddress" placeholder="상세주소">  --> 

    
    <div class="form-group">
        <label for="phone">전화번호</label>
        <input type="tel" class="form-control" name="phone" id="phone" required="">
    </div>
    
</div>
<button id="regbutton" class="btn btn-primary d-inline-flex align-items-center" type="submit">
    회원가입신청
    <svg class="bi ms-1" width="20" height="20"><use xlink:href="#arrow-right-short"></use></svg>
  </button>
</form>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            document.getElementById('postcode').value = data.zonecode; 
            document.getElementById('address').value = data.roadAddress; 
        }
    }).open();
}
</script>
<script src="js/test/testapi.js"></script>
