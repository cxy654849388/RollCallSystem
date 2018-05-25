package com.chm.controller;

import com.chm.annotations.Authorization;
import com.chm.service.StudentService;
import com.chm.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 学生控制器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/18 23:38
 */
@CrossOrigin
@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * 获取学生签到记录
     *
     * @return
     */
    @Authorization
    @PostMapping("/getSignedRecords")
    public Result getSignedRecords(@RequestBody Map params, HttpServletRequest request) {
        //查询结果
        return studentService.selectRecord(params, request);
    }

    /**
     * 统计学生学期签到情况
     *
     * @return
     */
    @Authorization
    @PostMapping("/getCountSignedRecord")
    public Result getCountSignedRecord(@RequestBody Map params, HttpServletRequest request) {
        //查询结果
        return studentService.countSignedRecord(params, request);
    }

    /**
     * 获取学生选课
     *
     * @return
     */
    @Authorization
    @PostMapping("/getSelectCourse")
    public Result getSelectCourse(HttpServletRequest request) {
        //查询结果
        return studentService.getSelectCourse(request);
    }

}
