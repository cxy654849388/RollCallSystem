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

    /**
     * 获取教师密码
     *
     * @param teaid 教师编号
     * @return
     */
    String getPasswordByTeaid(@Param("teaid") String teaid);

    /**
     * 获取教师任课列表
     *
     * @param teaid 教师编号
     * @return
     */
    List getTeach(@Param("teaid") String teaid);

    /**
     * 获取签到记录
     *
     * @param teachid 任课编号
     * @param teaid   教师编号
     * @return
     */
    List getRecords(@Param("teachid") Integer teachid,
                    @Param("teaid") String teaid);
}