package com.chm.mapper;

import com.chm.domain.FaceData;

import java.util.List;

public interface FaceDataMapper {
    int deleteByPrimaryKey(Integer faceid);

    int insert(FaceData record);

    int insertSelective(FaceData record);

    FaceData selectByPrimaryKey(Integer faceid);

    int updateByPrimaryKeySelective(FaceData record);

    int updateByPrimaryKeyWithBLOBs(FaceData record);

    int updateByPrimaryKey(FaceData record);

    List<String> getFaceData(String stuid);

    /**
     * 更新人脸库数据数量(每个学生最多十张人脸数据)
     *
     * @param stuid 学生学号
     * @return
     */
    int updateFaceDataCountFacedate(String stuid);
}