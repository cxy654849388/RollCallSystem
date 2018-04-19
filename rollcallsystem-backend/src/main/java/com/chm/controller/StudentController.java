package com.chm.controller;

import com.alibaba.fastjson.JSONObject;
import com.chm.service.StudentService;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 学生控制器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/18 23:38
 */
@RestController
@RequestMapping("/student")
@CrossOrigin
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * 获取学生签到记录
     *
     * @param map
     * @return
     */
    @PostMapping("getSignedRecords")
    public JSONObject getSignedRecords(@RequestBody Map map) {
        //查询结果
        List list = studentService.selectRecord(map);
        JSONObject json = new JSONObject();
        return null;
    }

}
