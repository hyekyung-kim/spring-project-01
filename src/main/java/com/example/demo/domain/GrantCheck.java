package com.example.demo.domain;

public class GrantCheck {
    String grant;

    public void setGrant(String grant) {
        this.grant = grant;
    }

    public String getGrant() {
        return grant;
    }

    @Override
    public String toString(){
        String str = "";

        str += "[ grant: " + getGrant() + " ]";

        return str;
    }
}
