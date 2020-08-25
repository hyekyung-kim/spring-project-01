package com.example.demo.dao;

import com.example.demo.domain.Member;

import java.util.List;

public interface MemberDao {

    Member getMember(String name, String password);

    Member getMemberByName(String name);

    List<String> getRoleByName(String name);
}
