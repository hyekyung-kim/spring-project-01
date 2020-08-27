package com.example.demo.controller;

import com.example.demo.domain.Member;
import com.example.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("memberSession")
public class LoginController {

    @Value("login")
    private String loginViewName;

    @Value("index")
    private String indexViewName;

    @Autowired
    private MemberService memberService;

    @ModelAttribute("loginForm")
    public LoginForm formBacking(HttpServletRequest request) throws Exception {
        return new LoginForm();
    }

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String form() {
        System.out.println("로그인 페이지!");
        return loginViewName;
    }

    @RequestMapping(value="/signin/process")
    public String handleRequest() throws Exception {

//        new LoginFormValidator().validate(loginForm, bindingResult);

        // 검증 오류 발생 시 다시 form view로 이동
//        if (bindingResult.hasErrors()) {
//            return new ModelAndView(formViewName);
//        }
//
        return indexViewName;

    }
}
