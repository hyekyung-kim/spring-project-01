package com.example.demo.service.impl;

import com.example.demo.controller.LoginForm;
import com.example.demo.domain.Member;
import com.example.demo.service.Authenticator;
import com.example.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.naming.AuthenticationException;

@Component
public class AuthenticatorImpl implements Authenticator {
    @Autowired
    private MemberService memberService;

    @Override
    public void authenticate(LoginForm loginForm) {
        Member realMember = memberService.getMemberByName(loginForm.getName());

        // name에 해당하는 member가 없을 경우
        if (realMember == null) {
            try {
                throw new AuthenticationException("noSuchMember");
            } catch (AuthenticationException e) {
                e.printStackTrace();
            }
        }

        // name과 비밀번호가 일치하지 않는 경우
        if (!realMember.matchPassword(loginForm.getPassword())) {
            try {
                throw new AuthenticationException("notMatchPassword");
            } catch (AuthenticationException e) {
                e.printStackTrace();
            }
        }
    }

}
