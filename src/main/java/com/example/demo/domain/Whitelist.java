package com.example.demo.domain;

import java.util.Date;

public class Whitelist {
    String name;
    Date reqDate;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setReqDate(Date reqDate) {
        this.reqDate = reqDate;
    }

    public Date getReqDate() {
        return reqDate;
    }

}
