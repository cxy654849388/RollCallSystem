package com.chm.mapper;

import com.chm.domain.SelectCourse;

public interface SelectCourseMapper {
    int deleteByPrimaryKey(Integer selectid);

    int insert(SelectCourse record);

    int insertSelective(SelectCourse record);

    SelectCourse selectByPrimaryKey(Integer selectid);

    int updateByPrimaryKeySelective(SelectCourse record);

    int updateByPrimaryKey(SelectCourse record);
}