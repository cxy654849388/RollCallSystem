package com.chm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.consist.RedisRepository;
import com.chm.domain.Manager;
import com.chm.domain.Student;
import com.chm.domain.Teacher;
import com.chm.service.ManagerService;
import com.chm.service.StudentService;
import com.chm.service.TeacherService;
import com.chm.utils.RoleTypeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 登陆控制器
 *
 * @Author: caihongming
 * @Created: 2018/4/11
 */
@RestController
@RequestMapping("/user")
@CrossOrigin
public class UserController {

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
        String name = null;
        String userType = null;
        //判别登陆类型
        if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.STUDENT)) {
            token = studentService.login(userId, password);
            name = ((Student) redisRepository.get(token)).getStuname();
            userType = "student";

        } else if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.TEACHER)) {
            token = teacherService.login(userId, password);
            name = ((Teacher) redisRepository.get(token)).getTeaname();
            userType = "teacher";
        } else if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.MANAGER)) {
            token = managerService.login(userId, password);
            name = "管理员";
            userType = "manager";
        }
        //登陆成功
        JSONObject json = new JSONObject();
        if (token != null) {
            json.put("token", token);
            json.put("name", name);
            json.put("userType", userType);
            //返回token
            return json;
        }
        //登陆失败
        return null;
    }

    @PostMapping("/user/logout")
    public JSONObject logout(@RequestParam("token") String token) {
        redisRepository.delete(token);
        System.out.println(11111111);
        return null;
    }

}
