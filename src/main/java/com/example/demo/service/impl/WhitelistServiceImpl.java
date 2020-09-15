package com.example.demo.service.impl;

import com.example.demo.dao.WhitelistDao;
import com.example.demo.domain.Whitelist;
import com.example.demo.service.WhitelistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WhitelistServiceImpl implements WhitelistService {

    @Autowired
    WhitelistDao whitelistDao;

    public List<Whitelist> getWhitelist(){
        return whitelistDao.getWhitelist();
    }

    public void insertWhitelist(Whitelist whitelist){
        whitelistDao.insertWhitelist(whitelist);
    }
}
