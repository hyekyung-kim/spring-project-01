package com.example.demo.dao.mybatis.mapper;

import com.example.demo.domain.Member;

public interface MemberMapper {
    Member getMember(String name, String password);

    Member getMemberByName(String name);
}
