package com.example.demo.service.impl;

import com.example.demo.dao.MemberDao;
import com.example.demo.domain.Member;
import com.example.demo.service.MemberService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberDao memberDao;

    public MemberServiceImpl(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public Member getMember(String name, String password){
        return memberDao.getMember(name, password);
    }

    public Member getMemberByName(String name){
        return memberDao.getMemberByName(name);
    }

    public List<String> getRoleByName(String name){
        return memberDao.getRoleByName(name);
    }
}
