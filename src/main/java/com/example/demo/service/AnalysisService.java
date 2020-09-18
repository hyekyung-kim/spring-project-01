package com.example.demo.service;

import com.example.demo.domain.AnalysisRequest;

import java.util.List;

public interface AnalysisService {
    List<AnalysisRequest> getAnalysisList();

    void insertAnalysis(AnalysisRequest analysisRequest);

    void changeStatusToRun(int id);

    AnalysisRequest getAnalysisById(int id);
}
