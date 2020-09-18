package com.example.demo.controller;

import com.example.demo.domain.AnalysisRequest;
import com.example.demo.service.AnalysisService;
import com.example.demo.service.WhitelistService;
import javafx.beans.NamedArg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

@org.springframework.web.bind.annotation.RestController
public class RestController {
    @Autowired
    private AnalysisService analysisService;

    @Autowired
    private WhitelistService whitelistService;

    @Value("${setup.mode}")
    private String setupMode;

    @ResponseBody
    @RequestMapping(value="/request-analysis", method= RequestMethod.POST)
    public AnalysisRequest getAnalysisInfo(@RequestBody AnalysisRequest analysisRequest,
                                           HttpServletResponse response, Model model) throws IOException, ParseException {
        System.out.println("rest api test:");
        System.out.println("setup.mode:" + setupMode);

        if(setupMode.equals("1")){
            analysisRequest.setStatus("run");
        }else if(setupMode.equals("2")){
            analysisRequest.setStatus("wait");
        }else if(setupMode.equals("3")){
            String name = analysisRequest.getReqName();

            if(whitelistService.isInWhitelist(name) == 1){ // 화이트리스트에 등록된 경우
                analysisRequest.setStatus("run");
            }else{                     // 화이트리스트에 없는 경우
                analysisRequest.setStatus("wait");
            }
        }else{
            System.out.println("exception");
            analysisRequest.setStatus("error");
        }

        // 요청 데이터 추가: 객체에 id set
        analysisService.insertAnalysis(analysisRequest);

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        model.addAttribute("analysisRequest", analysisRequest);

        return analysisRequest;
    }

}
