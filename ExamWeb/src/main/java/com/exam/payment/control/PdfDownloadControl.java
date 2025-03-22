package com.exam.payment.control;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
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
        SqlSession session = DataSource.getInstance().openSession(true);
        PaymentMapper mapper = session.getMapper(PaymentMapper.class);

        // 로그인 세션값 가져오기
        HttpSession session1 = req.getSession();
        String sessionId = (String) session1.getAttribute("loginId");

        // 결제 번호 목록 받기
        String[] payNoList = req.getParameterValues("payNo");
        String[] payNoSplitList = payNoList[0].split(",");

        PaymentVO param = new PaymentVO();
        for (String payNo : payNoSplitList) {
            param.setUserId(sessionId);
            param.setPayNo(Integer.parseInt(payNo));
            if (mapper.cntCheck(param) >= 3) {
                resp.getWriter().print("{\"retCode\" : \"LIMIT\"}");
                return;
            }
        }

        // 파일 목록 받기
        String[] fileList = req.getParameterValues("file");
        String[] fileSplitList = fileList[0].split(",");

        List<String> path = new ArrayList<>();
        for (String fileName : fileSplitList) {
            path.add(req.getServletContext().getRealPath("file/" + fileName));
        }

        // ZIP 파일을 메모리에서 생성
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try (ZipOutputStream zipOut = new ZipOutputStream(byteArrayOutputStream)) {
            for (String filePath : path) {
                File fileToZip = new File(filePath);
                if (!fileToZip.exists()) continue;

                try (FileInputStream fis = new FileInputStream(fileToZip)) {
                    ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
                    zipOut.putNextEntry(zipEntry);

                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = fis.read(buffer)) != -1) {
                        zipOut.write(buffer, 0, bytesRead);
                    }
                    zipOut.closeEntry();
                }
            }
        }

        // ZIP 파일 다운로드 응답 설정
        byte[] zipBytes = byteArrayOutputStream.toByteArray();
        resp.setContentType("application/zip");
        resp.setHeader("Content-Disposition", "attachment; filename=\"pdf_files.zip\"");
        resp.setContentLength(zipBytes.length);

        // 응답 스트림으로 ZIP 파일 전송
        resp.getOutputStream().write(zipBytes);
        resp.getOutputStream().flush();

        // 다운로드 성공 시 다운로드 횟수 증가
        for (String payNo : payNoSplitList) {
            param.setUserId(sessionId);
            param.setPayNo(Integer.parseInt(payNo));
            mapper.cntUpdate(param);
        }
    }
}