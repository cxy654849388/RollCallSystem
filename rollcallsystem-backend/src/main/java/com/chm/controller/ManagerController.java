package com.chm.controller;

import com.alibaba.fastjson.JSON;
import com.chm.annotations.Authorization;
import com.chm.interceptor.AuthorizationInterceptor;
import com.chm.service.ManagerService;
import com.chm.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 管理员控制器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/18 23:37
 */
@RestController
@RequestMapping("/manager")
@CrossOrigin
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @Authorization
    @PostMapping("/addFace")
    public Result addFace() {
        //获取参数
        Map params = JSON.parseObject(AuthorizationInterceptor.getBody()).getInnerMap();
        //查询结果
        return managerService.addFace(params);
    }

    @Authorization
    @PostMapping("/getFace")
    public Result getFace() {
        //获取参数
        Map params = JSON.parseObject(AuthorizationInterceptor.getBody()).getInnerMap();
        //查询结果
        return managerService.getFace(params);
    }

    @Authorization
    @GetMapping("/getSchoolInfo")
    public Result getSchoolInfo() {
        //查询结果
        return managerService.getSchoolInfo();
    }

    @Authorization
    @PostMapping("/getStudentList")
    public Result getStudentList(){
        //获取参数
        Map params = JSON.parseObject(AuthorizationInterceptor.getBody()).getInnerMap();
        //查询结果
        return managerService.getStudentList(params);
    }
}
