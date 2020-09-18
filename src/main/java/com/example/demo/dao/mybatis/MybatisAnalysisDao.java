package com.example.demo.dao.mybatis;

import com.example.demo.dao.AnalysisDao;
import com.example.demo.dao.mybatis.mapper.AnalysisMapper;
import com.example.demo.domain.AnalysisRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MybatisAnalysisDao implements AnalysisDao {

    @Autowired
    private AnalysisMapper analysisMapper;

    public List<AnalysisRequest> getAnalysisList(){
        return analysisMapper.getAnalysisList();
    }

    public void insertAnalysis(AnalysisRequest analysisRequest){
        analysisMapper.insertAnalysis(analysisRequest);
    }

    public void changeStatusToRun(int id){
        analysisMapper.changeStatusToRun(id);
    }

    public AnalysisRequest getAnalysisById(int id){
        return analysisMapper.getAnalysisById(id);
    }
}
