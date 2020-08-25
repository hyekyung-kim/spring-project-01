package com.example.demo.controller;

import com.example.demo.domain.AnalysisRequest;
import com.example.demo.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class RequestController {
    @Value("manage-request")
    private String requestViewName;

    @Autowired
    private AnalysisService analysisService;

    @RequestMapping(value="/manage-request")
    public ModelAndView handleRequest(){
        ModelAndView mav = new ModelAndView();

        List<AnalysisRequest> analysisList = analysisService.getAnalysisList();

        mav.addObject("analysisList", analysisList);
        mav.setViewName(requestViewName);
        return mav;
    }

}
