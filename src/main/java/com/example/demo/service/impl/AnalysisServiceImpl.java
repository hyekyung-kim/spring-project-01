package com.example.demo.service.impl;

import com.example.demo.dao.AnalysisDao;
import com.example.demo.domain.AnalysisRequest;
import com.example.demo.service.AnalysisService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnalysisServiceImpl implements AnalysisService {

    private final AnalysisDao analysisDao;

    public AnalysisServiceImpl(AnalysisDao analysisDao) {
        this.analysisDao = analysisDao;
    }

    @Override
    public List<AnalysisRequest> getAnalysisList() {
        return analysisDao.getAnalysisList();
    }

    @Override
    public void insertAnalysis(AnalysisRequest analysisRequest){
        analysisDao.insertAnalysis(analysisRequest);
    }
}
