package com.example.demo.controller;

import com.example.demo.domain.Whitelist;
import com.example.demo.service.WhitelistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class WhitelistController {

    @Value("manage-whitelist")
    private String manageWhitelistViewName;

    @Autowired
    private WhitelistService whitelistService;

    // 화이트리스트 페이지:  -> manage-whitelist.jsp
    @RequestMapping(value="/manage-whitelist")
    public ModelAndView whitelistRequest(){
        ModelAndView mav = new ModelAndView();

        List<Whitelist> whitelist = whitelistService.getWhitelist();

        for(int i = 0; i < whitelist.size(); i++){
            System.out.println(i + " whitelist: " + whitelist.get(i).toString());
        }

        mav.addObject("whitelist", whitelist);

        mav.setViewName(manageWhitelistViewName);
        return mav;
    }
}
