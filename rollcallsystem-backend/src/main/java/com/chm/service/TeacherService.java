package com.chm.service;

import com.chm.vo.Result;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/11
 */
public interface TeacherService {

    /**
     * 获取教师任课表
     *
     * @param request
     * @return
     */
    Result getTeach(HttpServletRequest request);

    /**
     * 获取课堂列表
     *
     * @param params
     * @param request
     * @return
     */
    Result getRecords(Map params, HttpServletRequest request);

    /**
     * 查询课堂签到记录
     *
     * @param params
     * @return
     */
    Result getSignedRecords(Map params);

    /**
     * 统计学生签到情况
     *
     * @param params
     * @return
     */
    Result countSignedRecords(Map params);

    /**
     * 获取学生签到详情
     *
     * @param params
     * @return
     */
    Result getStudentSignedDetails(Map params);

    /**
     * 签到状态修改
     *
     * @param params
     * @return
     */
    Result signedStatusChange(Map params);

}
