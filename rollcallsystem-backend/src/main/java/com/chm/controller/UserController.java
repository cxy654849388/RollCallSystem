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
import com.chm.service.UserService;
import com.chm.utils.RoleTypeUtils;
import com.chm.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 登陆控制器
 *
 * @Author: caihongming
 * @Created: 2018/4/11
 */
@CrossOrigin
@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody Map params) {
        //登陆
        return userService.login(params);
    }

    @PostMapping("/logout")
    public Result logout(HttpServletRequest request) {
        //注销
        return userService.logout(request);
    }

}
