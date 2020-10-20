package com.example.demo.controller;

import com.example.demo.domain.AnalysisRequest;
import com.example.demo.domain.GrantCheck;
import com.example.demo.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

@org.springframework.web.bind.annotation.RestController
public class RestFileController {
    @Autowired
    private AnalysisService analysisService;

    @ResponseBody
    @RequestMapping(value="/request-file/{id}", method= RequestMethod.GET)
    public GrantCheck fileRequest(@PathVariable("id") final String id,
                                  HttpServletResponse response) throws IOException {

        AnalysisRequest analysisRequest = analysisService.getAnalysisById(Integer.parseInt(id));
        int isGrant = analysisRequest.getGrantCheck();

        System.out.println("파일 요청 grant: " + isGrant);

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        // 권한 여부 확인
        GrantCheck grantCheck = new GrantCheck();
        if(isGrant == 0){   // 승인 거부
            grantCheck.setGrant("rejected");
        }else {              // 승인
            grantCheck.setGrant("accepted");
        }

        return grantCheck;
    }

    @RequestMapping(value="/download/{id}", method= RequestMethod.GET)
    public void download(@PathVariable("id") final String id,
                         HttpServletResponse response) throws IOException {
        AnalysisRequest analysisRequest = analysisService.getAnalysisById(Integer.parseInt(id));

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 파일 다운
        String path = analysisRequest.getFilePath();
        String contentType = "text/plain";

        File file = new File(path);
        String fileName = file.getName();

        System.out.println("full path: " + path);
        System.out.println("file name: " + fileName);

        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        response.setHeader("Content-Type", contentType);

        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(path);

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
