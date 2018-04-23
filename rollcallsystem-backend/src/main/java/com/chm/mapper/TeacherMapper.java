package com.chm.mapper;

import com.chm.domain.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {
    int deleteByPrimaryKey(String teaid);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(String teaid);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

    String getPasswordByTeaid(@Param("teaid") String teaid);

    List getTeach(@Param("teaid") String teaid);

    List getRecords(@Param("teachid") Integer teachid,
                    @Param("teaid") String teaid);
}