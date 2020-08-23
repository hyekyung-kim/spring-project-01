package com.example.demo.service.impl;

import com.example.demo.dao.MemberDao;
import com.example.demo.domain.Member;
import com.example.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;

    public Member getMember(String name, String password){
        return memberDao.getMember(name, password);
    }

    public Member getMemberByName(String name){
        return memberDao.getMemberByName(name);
    }
}
