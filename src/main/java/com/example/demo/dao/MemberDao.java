package com.example.demo.dao;

import com.example.demo.domain.Member;

public interface MemberDao {

    Member getMember(String name, String password);

    Member getMemberByName(String name);
}
