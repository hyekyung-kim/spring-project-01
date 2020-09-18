package com.example.demo.controller;

import com.example.demo.domain.AnalysisRequest;
import com.example.demo.domain.Whitelist;
import com.example.demo.service.AnalysisService;
import com.example.demo.service.WhitelistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class RequestController {
    @Value("index")
    private String indexViewName;

    @Value("manage-request")
    private String manageRequestViewName;

    @Value("manage-whitelist")
    private String manageWhitelistViewName;

    @Value("request-page")
    private String requestPageName;

    @Autowired
    private AnalysisService analysisService;

    @Autowired
    private WhitelistService whitelistService;

    // 분석 요청: login.jsp -> request-page.jsp
    @RequestMapping(value="/request/page", method = RequestMethod.GET)
    public String requestPage(){
        return requestPageName;
    }

    // 분석 요청 관리: index.jsp -> manage-request.jsp
    @RequestMapping(value="/manage-request")
    public ModelAndView manageRequest(){
        ModelAndView mav = new ModelAndView();

        List<AnalysisRequest> analysisList = analysisService.getAnalysisList();

        for(int i = 0; i < analysisList.size(); i++){
            System.out.println(i + " analysisList: " + analysisList.get(i).getId() + " "
                    + analysisList.get(i).getReqName() + " " + analysisList.get(i).getReqDate()
                    + " " + analysisList.get(i).getStatus());
        }

        mav.addObject("analysisList", analysisList);
        mav.setViewName(manageRequestViewName);
        return mav;
    }

    // 화이트리스트 페이지:  -> manage-whitelist.jsp
    @RequestMapping(value="/manage-whitelist")
    public ModelAndView whitelistRequest(){
        ModelAndView mav = new ModelAndView();

        List<Whitelist> whitelist = whitelistService.getWhitelist();

        for(int i = 0; i < whitelist.size(); i++){
            System.out.println(i + " whitelist: " +
                    whitelist.get(i).getName() + " " + whitelist.get(i).getRegDate());
        }

        mav.addObject("whitelist", whitelist);

        mav.setViewName(manageWhitelistViewName);
        return mav;
    }

    // 대시보드: manage-request.jsp -> index.jsp
    @RequestMapping(value="/index", method = RequestMethod.GET)
    public String indexPage(){
        return indexViewName;
    }
}
