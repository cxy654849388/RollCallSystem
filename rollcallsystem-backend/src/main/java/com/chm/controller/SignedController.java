package com.chm.controller;

import com.chm.domain.Student;
import com.chm.service.RecordService;
import com.chm.service.StudentService;
import org.json.JSONObject;
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
    public String signed(String image, Integer schid, String signedTime) {

        Student student = studentService.signed(image, schid, LocalTime.parse(signedTime));

        Map map = new HashMap();
        if (student != null) {
            map.put("student", student);
            map.put("record", recordService.getRecord(student.getStuid(), schid));
        }
        JSONObject json = new JSONObject(map);
        System.out.println("resu:" + json.toString());
        return json.toString();
    }
}
