package com.example.demo.controller;

import com.example.demo.domain.AnalysisRequest;
import com.example.demo.domain.GrantCheck;
import com.example.demo.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

@org.springframework.web.bind.annotation.RestController
public class RestFileController {
    @Autowired
    private AnalysisService analysisService;

    @ResponseBody
    @RequestMapping(value="/request-file/{id}", method= RequestMethod.GET)
    public File fileRequest(@PathVariable("id") final String id,
                            HttpServletResponse response) throws IOException {

        AnalysisRequest analysisRequest = analysisService.getAnalysisById(Integer.parseInt(id));

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        int isGrant = analysisRequest.getGrantCheck();
        GrantCheck grantCheck = new GrantCheck();
        if (isGrant == 0) {   // 승인 거부
            grantCheck.setGrant("rejected");
            return null;
        } else {              // 승인
            grantCheck.setGrant("accepted");

            // 파일 다운
            String path = analysisRequest.getFilePath(); // 전체 파일 경로
            File file = new File(path);       // DB에서 받아온 경로로 파일 객체 생성

            return file;
        }
    }

    @ResponseBody
    @RequestMapping(value="/download/{id}", method= RequestMethod.GET)
    public void download(@PathVariable("id") final String id,
                         HttpServletResponse response) throws IOException {
        AnalysisRequest analysisRequest = analysisService.getAnalysisById(Integer.parseInt(id));

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        // 파일 다운
        String filePath = analysisRequest.getFilePath();
        File file = new File(filePath);
        String fileName = file.getName();
        String contentType = "text/plain";

        System.out.println("full path: " + filePath);
        System.out.println("file name: " + fileName);

        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        response.setHeader("Content-Type", contentType);

        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(filePath);

            int count = 0;
            byte[] bytes = new byte[1024];

            while ((count = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, count);
            }

            fis.close();
            os.close();
        } catch (FileNotFoundException ex) {
            System.out.println("FileNotFoundException");
        }
    }
}
