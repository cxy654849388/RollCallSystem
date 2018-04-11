package com.chm.controller;

import com.chm.service.StudentService;
import com.chm.service.TeacherService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登陆控制器
 *
 * @Author: caihongming
 * @Created: 2018/4/11
 */
@RestController
public class LoginController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;


    @PostMapping("/api/login")
    public String login(String userId, String password) {
        String token = null;
        //判别登陆类型
        if (userId.length() == 10) {
            token = studentService.login(userId, password);
        } else {
            token = teacherService.login(userId, password);
        }
        //登陆成功
        if (token != null) {
            JSONObject json = new JSONObject();
            json.put("user_token", token);
            //返回token
            return json.toString();
        }
        //登陆失败
        return null;
    }

}
