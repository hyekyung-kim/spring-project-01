package com.example.demo.service;

import com.example.demo.domain.Whitelist;

import java.util.List;

public interface WhitelistService {
    List<Whitelist> getWhitelist();

    void insertWhitelist(Whitelist whitelist);

    int isInWhitelist(String name);
}
