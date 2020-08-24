package com.example.demo.dao.mybatis.mapper;

import com.example.demo.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberMapper {
    Member getMember(String name, String password);

    Member getMemberByName(String name);
}
