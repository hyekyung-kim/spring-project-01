package com.example.demo.domain;

import java.util.Date;

public class Whitelist {
    String name;
    Date regDate;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getRegDate() {
        return regDate;
    }

    @Override
    public String toString(){
        String str = "";

        str += "[ 화이트리스트 이름: " + getName() + " ";
        str += "날짜: " + getRegDate() + " ]";

        return str;
    }
}
