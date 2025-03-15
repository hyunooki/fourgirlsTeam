package com.exam.payment.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.payment.mapper.PaymentMapper;
import com.exam.payment.vo.PaymentVO;

public class PdfDownloadControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlSession session = DataSource.getInstance().openSession(true);
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		//로그인 세션값 가져오기
		HttpSession session1 = req.getSession(); 
		 String sessionId = (String)session1.getAttribute("loginId");
		
		String[] payNoList = req.getParameterValues("payNo");
		System.out.println(payNoList[0]);
		String[] payNoSplitList = payNoList[0].split(",");
		
		//payments 객체를 생성해서 param값으로 보낼 준비 
		PaymentVO param = new PaymentVO();
		for(String payNo : payNoSplitList) {
			param.setUserId(sessionId);
			param.setPayNo(Integer.parseInt(payNo));
			if(mapper.cntCheck(param)>=3) {
				resp.getWriter().print("{\"retCode\" : \"LIMIT\"}");
				return;
			};
		}
		
		
		
		//다운 체크
				boolean downloadCheck = false;
		// 다운로드할 PDF 파일들의 경로를 배열로 저장
		String[] fileList = req.getParameterValues("file");
		System.out.println(fileList[0]);
		String[] fileSplitList = fileList[0].split(",");
		
		List<String> path = new ArrayList<>();
		for(int i=0; i<fileSplitList.length; i++) {
			path.add("C:\\java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\ExamWeb\\WEB-INF\\pdf\\"+fileSplitList[i]);
		}
		
	
		
        

        // 압축할 ZIP 파일을 저장할 경로 지정
        String zipFilePath = "C:\\Users\\User\\Downloads\\pdf_files.zip";

        // ZIP 파일을 생성하기 위한 FileOutputStream과 ZipOutputStream 생성
        try (FileOutputStream fos = new FileOutputStream(zipFilePath);
             ZipOutputStream zipOut = new ZipOutputStream(fos)) {

            // 배열에 있는 각 PDF 파일을 ZIP 파일에 추가
            for (String filePath : path) {
                File fileToZip = new File(filePath);

                // 파일이 존재하는지 확인 (없으면 건너뜀)
                if (!fileToZip.exists()) {
                    System.out.println("파일 없음: " + filePath);
                    continue;
                }

                // 파일을 읽어 ZIP에 추가
                try (FileInputStream fis = new FileInputStream(fileToZip)) {
                    // ZIP 파일 내에서의 파일 이름 설정
                    ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
                    zipOut.putNextEntry(zipEntry); // ZIP 파일에 새 항목 추가

                    // 파일을 읽고 ZIP에 쓰기 위한 버퍼 설정
                    byte[] buffer = new byte[4096]; 
                    int bytesRead;

                    // 파일을 읽어서 ZIP 파일에d 기록
                    while ((bytesRead = fis.read(buffer)) != -1) {
                        zipOut.write(buffer, 0, bytesRead);
                    }
                    // 정상 다운 완료
                    downloadCheck = true;
                }
            }
           
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (downloadCheck) {
        	for(String payNo : payNoSplitList) {
        		param.setUserId(sessionId);
        		param.setPayNo(Integer.parseInt(payNo));
    			mapper.cntUpdate(param);
    		}
            resp.getWriter().print("{\"retCode\" : \"OK\"}");
        } else {
            resp.getWriter().print("{\"retCode\" : \"NG\"}");
        }
	}

}
