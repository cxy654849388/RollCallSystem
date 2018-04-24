package com.chm.mapper;

import com.chm.domain.SelectCourse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SelectCourseMapper {
    int deleteByPrimaryKey(Integer selectid);

    int insert(SelectCourse record);

    int insertSelective(SelectCourse record);

    SelectCourse selectByPrimaryKey(Integer selectid);

    int updateByPrimaryKeySelective(SelectCourse record);

    int updateByPrimaryKey(SelectCourse record);

    /**
     * 获取学生选课
     *
     * @param stuid 学生学号
     * @return
     */
    List getSelectCourse(@Param("stuid") String stuid);
}