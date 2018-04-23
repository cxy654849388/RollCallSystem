package com.chm.service;

import com.chm.vo.Result;

import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/12
 */
public interface ManagerService {
    /**
     * 添加学生人脸方法
     * @param params
     * @return
     */
    Result addFace(Map params);

    /**
     * 获取学生人脸信息
     * @param params
     * @return
     */
    Result getFace(Map params);

    /**
     * 获取学院班级信息
     * @return
     */
    Result getSchoolInfo();

    /**
     * 获取学生信息
     * @param params
     * @return
     */
    Result getStudentList(Map params);

}
