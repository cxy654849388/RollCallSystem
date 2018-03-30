package com.chm.mapper;

import com.chm.domain.FaceDataTrainStatus;

import java.util.List;

public interface FaceDataTrainStatusMapper {

    int deleteByPrimaryKey(String stuid);

    int insert(FaceDataTrainStatus record);

    int insertSelective(FaceDataTrainStatus record);

    FaceDataTrainStatus selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(FaceDataTrainStatus record);

    int updateByPrimaryKey(FaceDataTrainStatus record);

    List<String> findStatusNo();
}
