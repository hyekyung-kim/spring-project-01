package com.example.demo.domain;

import java.util.Date;

public class AnalysisRequest {
    int id;
    String reqName;
    Date reqDate;
    String status;
    String filePath;
    int grantCheck;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setReqName(String reqName) {
        this.reqName = reqName;
    }

    public String getReqName() {
        return reqName;
    }

    public void setReqDate(Date reqDate) {
        this.reqDate = reqDate;
    }

    public Date getReqDate() {
        return reqDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setGrantCheck(int grantCheck) {
        this.grantCheck = grantCheck;
    }

    public int getGrantCheck() {
        return grantCheck;
    }

    @Override
    public String toString(){
        String str = "";

        str += "[ ID: " + getId() + " ";
        str += "요청 이름: " + getReqName() + " ";
        str += "날짜: " + getReqDate() + " ";
        str += "상태: " + getStatus() + " ";
        str += "파일경로: " + getFilePath() + " ";
        str += "권한여부: " + getGrantCheck() + " ]";

        return str;
    }
}
