package com.chm.mapper;

import com.chm.domain.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    String getPasswordByStuid(@Param("stuid") String stuid);

    List getStudentList(@Param("acaid") String acaid,
                        @Param("proid") String proid,
                        @Param("classid") String classid);

}