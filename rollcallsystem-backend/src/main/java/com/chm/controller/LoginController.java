package com.chm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.consist.RedisRepository;
import com.chm.service.ManagerService;
import com.chm.service.StudentService;
import com.chm.service.TeacherService;
import com.chm.utils.RoleTypeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 登陆控制器
 *
 * @Author: caihongming
 * @Created: 2018/4/11
 */
@RestController
@CrossOrigin
public class LoginController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    ManagerService managerService;

    @Autowired
    RedisRepository redisRepository;


    @PostMapping("/login")
    public JSONObject login(@RequestParam("userId") String userId,
                            @RequestParam("password") String password) {
        String token = null;
        String userType = null;
        //判别登陆类型
        if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.STUDENT)) {
            token = studentService.login(userId, password);
            userType = "student";
        } else if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.TEACHER)) {
            token = teacherService.login(userId, password);
            userType = "teacher";
        } else if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.MANAGER)) {
            token = managerService.login(userId, password);
            userType = "manager";
        }
        //登陆成功
        JSONObject json = new JSONObject();
        if (token != null) {
            json.put("token", token);
            json.put("userInfo", redisRepository.get(token));
            json.put("userType", userType);
            //返回token
            return json;
        }
        //登陆失败
        return null;
    }

}
