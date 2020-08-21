package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login.do")
public class LoginController {

    @Value("login")
    private String formViewName;

    @RequestMapping(method = RequestMethod.GET)
    public String form() {
        System.out.println("여기는 컨트롤러!");
        return formViewName;
    }
}
