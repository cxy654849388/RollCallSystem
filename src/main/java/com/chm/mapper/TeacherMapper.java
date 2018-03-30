package com.chm.mapper;

import com.chm.domain.Teacher;

public interface TeacherMapper {
    int deleteByPrimaryKey(String teaid);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(String teaid);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
}