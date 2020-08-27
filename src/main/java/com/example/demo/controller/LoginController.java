package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @Value("login")
    private String loginViewName;

    @Value("index")
    private String indexViewName;

    @ModelAttribute("loginForm")
    public LoginForm formBacking() {
        return new LoginForm();
    }

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String form() {
        System.out.println("로그인 페이지!");
        return loginViewName;
    }

    @RequestMapping(value="/signin/process")
    public String handleRequest() {
        return indexViewName;
    }
}
