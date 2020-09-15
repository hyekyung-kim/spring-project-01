package com.example.demo.dao.mybatis;

import com.example.demo.dao.WhitelistDao;
import com.example.demo.dao.mybatis.mapper.WhitelistMapper;
import com.example.demo.domain.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MybatisWhitelistDao implements WhitelistDao {

    @Autowired
    WhitelistMapper whitelistMapper;

    public List<Whitelist> getWhitelist(){
        return whitelistMapper.getWhitelist();
    };

    public void insertWhitelist(Whitelist whitelist){
        whitelistMapper.insertWhitelist(whitelist);
    };
}
