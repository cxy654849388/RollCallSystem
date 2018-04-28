package com.chm.controller;

import com.chm.annotations.Authorization;
import com.chm.service.TeacherService;
import com.chm.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 教师控制器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/18 23:39
 */
@CrossOrigin
@RestController
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    /**
     * 获取教师任课表
     *
     * @return
     */
    @Authorization
    @PostMapping("/getTeach")
    public Result getTeach(HttpServletRequest request) {
        //获取课表
        return teacherService.getTeach(request);
    }

    /**
     * 获取课堂列表
     *
     * @return
     */
    @Authorization
    @PostMapping("/getRecords")
    public Result getRecords(@RequestBody Map params, HttpServletRequest request) {
        //获取课堂列表
        return teacherService.getRecords(params, request);
    }

    /**
     * 查询课堂签到记录
     *
     * @return
     */
    @Authorization
    @PostMapping("/getSignedRecords")
    public Result getSignedRecords(@RequestBody Map params) {
        //获取签到记录
        return teacherService.getSignedRecords(params);
    }

    /**
     * 统计学生签到情况
     *
     * @return
     */
    @Authorization
    @PostMapping("/countSignedRecords")
    public Result countSignedRecords(@RequestBody Map params) {
        //统计学生签到情况
        return teacherService.countSignedRecords(params);
    }

    /**
     * 获取学生签到详情
     *
     * @return
     */
    @Authorization
    @PostMapping("/getStudentSignedDetails")
    public Result getStudentSignedDetails(@RequestBody Map params) {
        //统计学生签到情况
        return teacherService.getStudentSignedDetails(params);
    }

    /**
     * 签到状态修改
     *
     * @param params
     * @return
     */
    @Authorization
    @PostMapping("/signedStatusChange")
    public Result signedStatusChange(@RequestBody Map params) {
        //签到状态修改
        return teacherService.signedStatusChange(params);
    }

}
