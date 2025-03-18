<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3>searchid</h3>

<style>

.row g-3{
    margin: 80px auto 0 auto;
    width: 50%; 
    text-align: center;
}

.col-sm-6{
     display: flex;
    align-items: center; /* 라벨과 input을 수직 정렬 */
    justify-content: center; /* input을 가운데 정렬 */
    margin-bottom: 10px; /* 입력칸 간격 */
    width: 100%;

}


</style>


          <!-- 후보2 -->
          <form action="searchidhandle.do" method="post" class="php-email-form aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
              <div class="row gy-4">
        		<h3>이름</h3>
                <div class="col-md-6">
                  <label for="name-field" class="pb-2">Your Name</label>
                  <input type="text" name="name" id="name-field" class="form-control" required="">
                </div>
                 <h3>이메일</h3>
                <div class="col-md-6">
                  <label for="email-field" class="pb-2">Your Email</label>
                  <input type="email" class="form-control" name="email" id="email-field" required="">
                </div>
                <h3>날짜</h3> 
                <div class="col-md-12">
                  <label for="subject-field" class="pb-2">Subject</label>
                  <input type="date" class="form-control" name="birth" id="subject-field" required="">
                </div>
              </div>
					<button type="submit" class="btn btn-success">아이디비번찾기</button>
            </form>
            
            
            
          
          
          