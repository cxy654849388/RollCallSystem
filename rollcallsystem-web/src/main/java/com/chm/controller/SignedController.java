package com.chm.controller;

import com.chm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RestController
public class SignedController {


    @Autowired
    private StudentService studentService;


    /**
     * 签到方法
     *
     * @param image 学生人脸
     * @param schid 课表编号
     * @return
     */
    @PostMapping(value = "/signed")
    public String signed(String image, Integer schid) {
        return studentService.signed(image, schid);
    }
}
