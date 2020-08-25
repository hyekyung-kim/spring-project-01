package com.example.demo.service.impl;

import com.example.demo.dao.MemberDao;
import com.example.demo.domain.Member;
import com.example.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.management.relation.Role;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberDao memberDao;

    public MemberServiceImpl(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

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
