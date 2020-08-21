package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/login.do")
public class LoginController {

    @Value("login")
    private String formViewName;

    @ModelAttribute("loginForm")
    public LoginForm formBacking(HttpServletRequest request) throws Exception {
        return new LoginForm();
    }

    @RequestMapping(method = RequestMethod.GET)
    public String form() {
        System.out.println("여기는 컨트롤러!");
        return formViewName;
    }
}
