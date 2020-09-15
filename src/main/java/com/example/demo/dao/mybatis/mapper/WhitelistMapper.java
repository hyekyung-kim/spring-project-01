package com.example.demo.dao.mybatis.mapper;

import com.example.demo.domain.Whitelist;

import java.util.List;

public interface WhitelistMapper {

    List<Whitelist> getWhitelist();

    void insertWhitelist(Whitelist whitelist);
}
