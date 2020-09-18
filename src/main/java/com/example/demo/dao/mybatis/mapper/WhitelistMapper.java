package com.example.demo.dao.mybatis.mapper;

import com.example.demo.domain.Whitelist;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface WhitelistMapper {

    List<Whitelist> getWhitelist();

    void insertWhitelist(Whitelist whitelist);

    int isInWhitelist(String name);
}
