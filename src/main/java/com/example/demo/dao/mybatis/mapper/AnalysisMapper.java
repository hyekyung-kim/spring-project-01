package com.example.demo.dao.mybatis.mapper;

import com.example.demo.domain.AnalysisRequest;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AnalysisMapper {
    List<AnalysisRequest> getAnalysisList();

    void insertAnalysis(AnalysisRequest analysisRequest);

    void changeStatusToRun(int id);
}
