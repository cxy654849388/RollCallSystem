package com.chm.service;

import com.chm.domain.Record;
import com.chm.domain.Teach;

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
     * @param image 学生图像
     * @param teachid 任课id
     * @return
     */
    String signed(String image, Integer teachid);

}
