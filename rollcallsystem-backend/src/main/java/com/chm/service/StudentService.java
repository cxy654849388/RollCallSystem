package com.chm.service;

import com.chm.domain.Record;
import com.chm.domain.Student;
import com.chm.exception.ParamExecptiom;
import org.springframework.mail.MailParseException;

import java.time.LocalTime;
import java.util.List;
import java.util.Map;

public interface StudentService {


    /**
     * 根据学生学号查询签到记录
     *
     * @param params
     * @return
     */
    List<Record> selectRecord(Map params);

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
