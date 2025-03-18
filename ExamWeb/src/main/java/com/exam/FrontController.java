package com.exam;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.cart.control.CartDeleteControl;
import com.exam.cart.control.CartFormControl;
import com.exam.cart.control.CartToPaymentInsert;
import com.exam.common.Control;
import com.exam.detail.control.DetailControl;
import com.exam.detail.control.ReplyAddControl;
import com.exam.detail.control.ReplyListControl;
import com.exam.detail.control.ReplyPageContol;
import com.exam.mypage.control.MyCartsControl;
import com.exam.mypage.control.MyPaymentControl;
import com.exam.mypage.control.MyQnaControl;
import com.exam.mypage.control.SearchIdControl;
import com.exam.mypage.control.SearchIdhandleControl;
import com.exam.mypage.control.SignoutControl;
import com.exam.test.control.ProdInsertControl;
import com.exam.test.control.ProdInsertFormControl;
import com.exam.payment.control.DeletePayControl;
import com.exam.payment.control.DownloacFormControl;
import com.exam.payment.control.DownloadFormAjax;
import com.exam.payment.control.PaymentClearControl;
import com.exam.payment.control.PaymentsForm;
import com.exam.payment.control.PdfDownloadControl;
import com.exam.qna.control.QnaAddFormControl;
import com.exam.qna.control.QnaDeleteControl;
import com.exam.qna.control.QnaDetailForm;
import com.exam.qna.control.QnaListAjaxControl;
import com.exam.qna.control.QnaListControl;
import com.exam.qna.control.QnaPaging;
import com.exam.qna.control.QnaReplyAddControl;
import com.exam.qna.control.QnaReplyListForm;
import com.exam.qna.control.QnaReplyPageControl;
import com.exam.qna.control.qnaAddControl;
import com.exam.test.control.LogOutControl;
import com.exam.test.control.MainControl;
import com.exam.test.control.MyInfoControl;
import com.exam.test.control.MyPageControl;
import com.exam.test.control.NoLoginControl;
import com.exam.test.control.OverlapControl;
import com.exam.test.control.ProdInsertControl;
import com.exam.test.control.ProdInsertFormControl;
import com.exam.test.control.ProdListControl;
import com.exam.test.control.RegisterControl;
import com.exam.test.control.RegisterHandle;
import com.exam.test.control.TestControl;
import com.exam.test.control.loginControl;
import com.exam.test.control.loginhandlecontrol;






/*
 * MVC 패턴에서의 Control역활.
 * url요청 -> 서블릿
 */
public class FrontController extends HttpServlet{
	// Map<String, Control> map; Map<String, 인터페이스명> map
	Map<String, Control> map;
	
	public FrontController() {
		map = new HashMap<>(); // map 필드의 초기화.
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
//		map.put("url",  "servlet"); // addStudent.do 요청이 들어오면 AddStudentServlet
		//영서

		map.put("/test.do", new TestControl() ); // 테스트.
		map.put("/prodList.do", new ProdListControl()); // 상품목록.
		map.put("/prodInsertForm.do", new ProdInsertFormControl()); // 등록화면.
		map.put("/prodInsert.do", new ProdInsertControl()); //등록처리.

		
		
		
		//현욱
		map.put("/paymentForm.do", new PaymentsForm());
		map.put("/deletePay.do", new DeletePayControl());
		map.put("/paymentClear.do", new PaymentClearControl());
		map.put("/downloadPage.do", new DownloacFormControl());
		map.put("/downloadAjax.do", new DownloadFormAjax());
		map.put("/downloadControl.do", new PdfDownloadControl());
		map.put("/cartForm.do", new CartFormControl());
		map.put("/cartDelete.do", new CartDeleteControl());
		map.put("/cartTopay.do", new CartToPaymentInsert());
		map.put("/qnaList.do", new QnaListControl());
		map.put("/qnaListAjax.do",new QnaListAjaxControl());
		map.put("/qnaPaging.do",new QnaPaging());
		map.put("/qnaAddForm.do", new QnaAddFormControl());
		map.put("/qnaAddControl.do", new qnaAddControl());
		map.put("/qnaDetail.do", new QnaDetailForm());	
		map.put("/deleteQna.do", new QnaDeleteControl());
		map.put("/qnaReplyList.do", new QnaReplyListForm());
		map.put("/qnaReplyPage.do", new QnaReplyPageControl());
		map.put("/qnaReplyAdd.do", new QnaReplyAddControl());
		
		
		
		
		
		
		
		
		//은애 
		//로그인페이지 이동
		map.put("/login.do", new loginControl());
		map.put("/logout.do",new LogOutControl());
		map.put("/loginhandle.do", new loginhandlecontrol());
		//회원정보 존재하지 않을때 새로운 로그인 페이지 
		map.put("/nologin.do", new NoLoginControl());
		map.put("/main.do", new MainControl());
		//회원가입페이지
		map.put("/register.do", new RegisterControl());
		map.put("/registerhandle.do", new RegisterHandle());
		map.put("/checkOverlap.do", new OverlapControl());
		//마이페이지 
		map.put("/mypage.do", new MyPageControl()); 
		map.put("/myinfo.do", new MyInfoControl());
	    map.put("/mypageqna.do",new MyQnaControl());
		map.put("/mypagecarts.do", new MyCartsControl());
		map.put("/mypagepayment.do", new MyPaymentControl());
		map.put("/signout.do", new SignoutControl());//회원탈퇴
		map.put("/searchid.do", new SearchIdControl());//아이디 비밀번호 찾기
		map.put("/searchidhandle.do", new SearchIdhandleControl());
		
		
		// 민영
		map.put("/detail.do", new DetailControl()); // 상세
		map.put("/replyList.do", new ReplyListControl()); // 댓글목록
		map.put("/replypaging.do", new ReplyPageContol()); 
		map.put("/replyAdd.do", new ReplyAddControl());
		
		
		
		
		
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//  http://localhost:8080/BoardWeb/addStudent.do = url
		//  /BoardWeb/addStudent.do => uri
		String uri = req.getRequestURI(); // "/BoardWeb/addStudent.do"
		String context = req.getContextPath(); // "/BoardWeb"
		// substring= 정해진 문자열에서부터 자름. uri - context = page (.do)나옴 
		String page = uri.substring(context.length());
		
		System.out.println(page);
		// page에는 /주소.do가 반환됨.
		// map컬렉션에서 key를 입력하면 val반환.
		Control control = map.get(page);
		control.exec(req, resp);
	}
}