package com.chm.service;

import com.chm.domain.Student;
import com.chm.vo.Result;

import java.time.LocalTime;
import java.util.List;
import java.util.Map;

public interface StudentService {


    /**
     * 根据查询签到记录
     *
     * @param params
     * @return
     */
    Result selectRecord(Map params);

    /**
     * 统计学生学期签到情况
     *
     * @param params
     * @return
     */
    Result countSignedRecord(Map params);

    /**
     * 学生签到方法
     *
     * @param image      学生图像
     * @param schid      课表id
     * @param signedTime 签到时间
     * @return 签到学生的实例
     */
    Student signed(String image, Integer schid, LocalTime signedTime);

    /**
     * 学生登录方法
     *
     * @param stuid    学生学号
     * @param password 密码
     * @return
     */
    String login(String stuid, String password);

}
