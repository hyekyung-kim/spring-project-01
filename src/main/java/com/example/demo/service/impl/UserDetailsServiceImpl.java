package com.example.demo.service.impl;

import com.example.demo.dao.mybatis.mapper.MemberMapper;
import com.example.demo.domain.Member;
import com.example.demo.domain.SecurityMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
        Member member = memberMapper.getMemberByName(username);

        if(member != null) {
            member.setAuthorities(makeGrantedAuthority(memberMapper.getRoleByName(username)));
        }
        return new SecurityMember(member);
    }

    private static List<GrantedAuthority> makeGrantedAuthority(List<String> roles){
        List<GrantedAuthority> list = new ArrayList<>();
        roles.forEach(role -> list.add(new SimpleGrantedAuthority(role)));
        return list;
    }


}
