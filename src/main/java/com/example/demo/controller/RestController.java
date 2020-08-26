package com.example.demo.controller;

import com.example.demo.domain.AnalysisRequest;
import com.example.demo.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@org.springframework.web.bind.annotation.RestController
public class RestController {
    @Autowired
    private AnalysisService analysisService;

    @ResponseBody
    @RequestMapping(value="/request-analysis", method= RequestMethod.POST)
    public AnalysisRequest getAnalysisInfo(@RequestBody AnalysisRequest analysisRequest,
                                           HttpServletResponse response, Model model) throws IOException, ParseException {
        System.out.println("rest api test:");

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
