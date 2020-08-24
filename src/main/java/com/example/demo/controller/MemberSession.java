package com.example.demo.controller;

import com.example.demo.domain.Member;

public class MemberSession {
    private Member member;

    public MemberSession(){
    }
    public MemberSession(Member member){
        this.member = member;
    }

    public Member getMember(){
        return member;
    }
}
