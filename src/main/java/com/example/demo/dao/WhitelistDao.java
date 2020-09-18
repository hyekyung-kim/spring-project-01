package com.example.demo.dao;

import com.example.demo.domain.Whitelist;

import java.util.List;

public interface WhitelistDao {
    List<Whitelist> getWhitelist();

    void insertWhitelist(Whitelist whitelist);

    int isInWhitelist(String name);
}
