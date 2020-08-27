package com.example.demo.service;

import com.example.demo.domain.Member;

import java.util.List;

public interface MemberService {

    Member getMember(String name, String password);

    Member getMemberByName(String name);

    List<String> getRoleByName(String name);
}
