package com.chm.service;

import com.chm.domain.Record;
import com.chm.domain.Student;
import com.sun.org.apache.xpath.internal.operations.Bool;

import java.time.LocalTime;
import java.util.List;

public interface StudentService {


    /**
     * 根据学生学号查询签到记录
     *
     * @param stuId
     * @return
     */
    List<Record> selectRecord(String stuId);

    /**
     * 学生签到方法
     *
     * @param image      学生图像
     * @param schid      课表id
     * @param signedTime 签到时间
     * @return 签到学生的实例
     */
    Student signed(String image, Integer schid, LocalTime signedTime);

    String login(String stuid, String password);

}
