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

    /**
     * 插入更新训练状态实例
     *
     * @param record
     * @return
     */
    int insertOrUpdate(FaceDataTrainStatus record);

    /**
     * 返回需要训练的学生学号集合
     *
     * @return
     */
    List<String> findStatusNo();
}
