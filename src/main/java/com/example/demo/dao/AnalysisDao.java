package com.example.demo.dao;

import com.example.demo.domain.AnalysisRequest;

import java.util.List;

public interface AnalysisDao {
    List<AnalysisRequest> getAnalysisList();

    void insertAnalysis(AnalysisRequest analysisRequest);

    void changeStatusToRun(int id);

    void changeToGranted(int id);

    AnalysisRequest getAnalysisById(int id);
}
