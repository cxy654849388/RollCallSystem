package com.chm.mapper;

import com.chm.domain.Class;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassMapper {
    int deleteByPrimaryKey(String classid);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(String classid);

    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);

    /**
     * 根据任课id获取学生所在班级标签集合
     *
     * @param teachid
     * @return
     */
    List<String> getLabels(@Param("teachid") Integer teachid);
}