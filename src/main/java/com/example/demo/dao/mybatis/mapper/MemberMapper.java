package com.example.demo.dao.mybatis.mapper;

import com.example.demo.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MemberMapper {
    Member getMember(String name, String password);

    Member getMemberByName(String name);

    List<String> getRoleByName(String name);

}
