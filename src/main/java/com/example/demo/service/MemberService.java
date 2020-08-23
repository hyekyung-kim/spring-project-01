package com.example.demo.service;

import com.example.demo.domain.Member;

public interface MemberService {

    Member getMember(String name, String password);

    Member getMemberByName(String name);
}
