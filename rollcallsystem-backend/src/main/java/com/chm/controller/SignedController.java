package com.chm.controller;

import com.chm.domain.Student;
import com.chm.service.RecordService;
import com.chm.service.StudentService;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalTime;
import java.util.Map;

/**
 * 签到控制器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/7
 */
@RestController
public class SignedController {


    @Autowired
    private StudentService studentService;

    @Autowired
    private RecordService recordService;


    /**
     * 签到方法
     *
     * @param image      学生人脸
     * @param schid      课表编号
     * @param signedTime 签到时间
     * @return
     */
    @PostMapping(value = "/signed")
    public Result signed(String image, Integer schid, String signedTime) {
        //检测人脸为哪位学生并进行签到
        Student student = studentService.signed(image, schid, LocalTime.parse(signedTime));
        //组成返回参数
        Map result = Maps.newHashMap();

        //组成返回格式
        if (student != null) {
            result.put("student", student);
            result.put("record", recordService.getRecord(student.getStuid(), schid));
        }
        System.out.println("result:" + result);
        //返回结果
        return ResultUtils.success(result);
    }

    /**
     * 更改学生签到状态为缺课方法
     *
     * @param schid 课表编号
     * @param stuid 学生学号
     * @return
     */
    @PostMapping(value = "/absence")
    public Result absence(Integer schid, String stuid) {
        recordService.absence(stuid, schid);
        return ResultUtils.success();
    }
}
