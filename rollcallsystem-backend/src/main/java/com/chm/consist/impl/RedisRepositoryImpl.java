package com.chm.consist.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.consist.RedisRepository;
import com.chm.domain.Student;
import com.chm.domain.Teacher;
import com.chm.mapper.StudentMapper;
import com.chm.mapper.TeacherMapper;
import com.chm.utils.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import java.util.concurrent.TimeUnit;

/**
 * @Author: caihongming
 * @Created: 2018/4/10
 */
@Repository("redisRepository")
public class RedisRepositoryImpl implements RedisRepository {

    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    TeacherMapper teacherMapper;

    /**
     * 半个小时后过期
     */
    private static final Long time = 1800L;

    @Override
    public String add(String userId) {
        String token = TokenUtil.createToken(userId);
        Object userInfo = null;
        if (userId.length() == 10) {
            Student student = studentMapper.selectByPrimaryKey(userId);
            if (student != null) {
                userInfo = student;
            }
        } else {
            Teacher teacher = teacherMapper.selectByPrimaryKey(userId);
            if (teacher != null) {
                userInfo = teacher;
            }
        }
        redisTemplate.opsForValue().set(token, userInfo, time, TimeUnit.SECONDS);
        return token;
    }

    @Override
    public void update(String token) {
        redisTemplate.opsForValue().getOperations().expire(token, time, TimeUnit.SECONDS);
    }

    @Override
    public Object get(String userId) {
        return redisTemplate.opsForValue().get(userId);
    }

    @Override
    public void delete(String userId) {
        redisTemplate.opsForValue().getOperations().delete(userId);
    }
}
