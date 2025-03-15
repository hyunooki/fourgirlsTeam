package com.exam;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.common.Control;
import com.exam.payment.control.DeletePayControl;
import com.exam.payment.control.DownloacFormControl;
import com.exam.payment.control.DownloadFormAjax;
import com.exam.payment.control.PaymentClearControl;
import com.exam.payment.control.PaymentsForm;
import com.exam.payment.control.PdfDownloadControl;
import com.exam.test.control.ProdListControl;
import com.exam.test.control.TestControl;
import com.exam.test.control.loginControl;
import com.exam.test.control.loginhandlecontrol;
import com.exam.test.control.registerControl;


/*
 * MVC 패턴에서의 Control역활.
 * url요청 -> 서블릿.ㄹㄹㄹf  
 */
//@WebServlet("*.do")
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

		map.put("/test.do", new TestControl() );
		map.put("/prodList.do", new ProdListControl());

		
		
		
		
		//현욱
		map.put("/paymentForm.do", new PaymentsForm());
		map.put("/deletePay.do", new DeletePayControl());
		map.put("/paymentClear.do", new PaymentClearControl());
		map.put("/downloadPage.do", new DownloacFormControl());
		map.put("/downloadAjax.do", new DownloadFormAjax());
		map.put("/downloadControl.do", new PdfDownloadControl());
		
		
		//은애 
		//로그인페이지 이동
		map.put("/login.do", new loginControl());
		map.put("/loginhandle.do", new loginhandlecontrol());
		//회원가입페이지
		map.put("/register.do", new registerControl());
		
		
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
