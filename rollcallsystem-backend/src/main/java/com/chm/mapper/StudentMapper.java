package com.chm.mapper;

import com.chm.domain.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    /**
     * 获取学生密码
     *
     * @param stuid 学生学号
     * @return
     */
    String getPasswordByStuid(@Param("stuid") String stuid);

    /**
     * 获取学生列表
     *
     * @param acaid   学院编号
     * @param proid   专业编号
     * @param classid 班级编号
     * @param teachid 任课编号
     * @param teaid   教师编号
     * @return
     */
    List getStudentList(@Param("params") Map params);
}