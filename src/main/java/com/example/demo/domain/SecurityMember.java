package com.example.demo.domain;

import org.springframework.security.core.userdetails.User;

public class SecurityMember extends User {
    private static final long serialVersionUID = 1L;

    public SecurityMember(Member member){
        super(member.getName(), member.getPassword(), member.getAuthorities());
    }
}
