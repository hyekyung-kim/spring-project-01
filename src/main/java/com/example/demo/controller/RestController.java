package com.example.demo.controller;

import com.example.demo.domain.AnalysisRequest;
import com.example.demo.domain.GrantCheck;
import com.example.demo.domain.Whitelist;
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
                                           HttpServletResponse response) throws IOException {
        System.out.println("분석 요청:");
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

        return analysisRequest;
    }

    @ResponseBody
    @RequestMapping(value="/request-status/{id}", method= RequestMethod.GET)
    public AnalysisRequest requestStatus(@PathVariable("id") final String id,
                                        HttpServletResponse response) throws IOException {
        System.out.println("status를 run으로 변경");

        analysisService.changeStatusToRun(Integer.parseInt(id));
        AnalysisRequest analysisRequest = analysisService.getAnalysisById(Integer.parseInt(id));

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        return analysisRequest;
    }

    @ResponseBody
    @RequestMapping(value="/request-grant/{id}", method= RequestMethod.GET)
    public AnalysisRequest requestGrant(@PathVariable("id") final String id,
                                         HttpServletResponse response) throws IOException {
        System.out.println("grant를 1로 변경");

        analysisService.changeToGranted(Integer.parseInt(id));
        AnalysisRequest analysisRequest = analysisService.getAnalysisById(Integer.parseInt(id));

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        return analysisRequest;
    }

    @ResponseBody
    @RequestMapping(value="/request-whitelist", method= RequestMethod.POST)
    public Whitelist whitelistRequest(@RequestBody Whitelist whitelist,
                                      HttpServletResponse response) throws IOException {
        System.out.println("화이트리스트 추가:");
        System.out.println("name: " + whitelist.getName() + " regDate: " + whitelist.getRegDate());

        // 입력받은 id 추가
        whitelistService.insertWhitelist(whitelist);

        if (whitelist == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        return whitelist;
    }

    @ResponseBody
    @RequestMapping(value="/request-file/{id}", method= RequestMethod.GET)
    public GrantCheck fileRequest(@PathVariable("id") final String id,
                                  HttpServletResponse response) throws IOException {

        AnalysisRequest analysisRequest = analysisService.getAnalysisById(Integer.parseInt(id));
        int isGrant = analysisRequest.getGrantCheck();

        System.out.println("파일 요청 grant: " + isGrant);
        System.out.println("analysisRequest: " + analysisRequest.toString());

        if (analysisRequest == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        GrantCheck grantCheck = new GrantCheck();
        if(isGrant == 0){   // 승인 거부
            grantCheck.setGrant("rejected");
        }else{              // 승인
            grantCheck.setGrant("accepted");
        }

        return grantCheck;
    }

}