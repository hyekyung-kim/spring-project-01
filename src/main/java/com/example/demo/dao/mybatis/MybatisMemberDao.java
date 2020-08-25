package com.example.demo.dao.mybatis;

import com.example.demo.dao.MemberDao;
import com.example.demo.dao.mybatis.mapper.MemberMapper;
import com.example.demo.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MybatisMemberDao implements MemberDao {

    @Autowired
    private MemberMapper memberMapper;

    public Member getMember(String name, String password){
        return memberMapper.getMember(name, password);
    }

    public Member getMemberByName(String name){
        return memberMapper.getMemberByName(name);
    }

    public List<String> getRoleByName(String name){
        return memberMapper.getRoleByName(name);
    }
}
