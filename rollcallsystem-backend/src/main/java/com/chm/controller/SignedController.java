package com.chm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.domain.Student;
import com.chm.service.RecordService;
import com.chm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalTime;
import java.util.HashMap;
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
    public JSONObject signed(String image, Integer schid, String signedTime) {
        //检测人脸为哪位学生并进行签到
        Student student = studentService.signed(image, schid, LocalTime.parse(signedTime));

        JSONObject json = new JSONObject();

        Map map = new HashMap();
        //组成返回格式
        if (student != null) {
            json.put("student", student);
            json.put("record", recordService.getRecord(student.getStuid(), schid));
        }
        System.out.println("resu:" + json.toString());
        //返回结果
        return json;
    }
}
