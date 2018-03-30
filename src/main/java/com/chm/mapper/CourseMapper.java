package com.chm.mapper;

import com.chm.domain.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer couid);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer couid);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}