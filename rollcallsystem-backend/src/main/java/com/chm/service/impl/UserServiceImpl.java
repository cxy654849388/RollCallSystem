package com.chm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.chm.consist.RedisRepository;
import com.chm.domain.Student;
import com.chm.domain.Teacher;
import com.chm.mapper.*;
import com.chm.service.UserService;
import com.chm.utils.ResultUtils;
import com.chm.utils.RoleTypeUtils;
import com.chm.vo.Result;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/23
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private ManagerMapper managerMapper;

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private RedisRepository redisRepository;

    @Override
    public Result login(Map params) {
        Validate.login(params);
        String userId = params.get("userId").toString();
        String password = params.get("password").toString();
        String token = null;
        String name = null;
        String userType = null;
        //判别登陆类型
        if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.STUDENT)) {
            if (password.equals(studentMapper.getPasswordByStuid(userId))) {
                token = redisRepository.add(userId);
                name = ((Student) redisRepository.get(token)).getStuname();
                userType = "student";
            }
        } else if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.TEACHER)) {
            if (password.equals(teacherMapper.getPasswordByTeaid(userId))) {
                token = redisRepository.add(userId);
                name = ((Teacher) redisRepository.get(token)).getTeaname();
                userType = "teacher";
            }
        } else if (RoleTypeUtils.discriminant(userId).equals(RoleTypeUtils.MANAGER)) {
            if (password.equals(managerMapper.getPasswordByAccount(userId))) {
                token = redisRepository.add(userId);
                name = "管理员";
                userType = "manager";
            }
        }
        //登陆成功
        Map map = Maps.newHashMap();
        if (token != null) {
            map.put("token", token);
            map.put("name", name);
            map.put("userType", userType);
            //返回token
            return ResultUtils.success(map);
        }
        return ResultUtils.error("", "账号或密码错误");
    }

    @Override
    public Result logout(HttpServletRequest request) {
        String token = request.getHeader("token");
        redisRepository.delete(token);
        return ResultUtils.success();
    }
}
