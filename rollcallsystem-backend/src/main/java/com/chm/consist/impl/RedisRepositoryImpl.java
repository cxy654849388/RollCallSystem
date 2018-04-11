package com.chm.consist.impl;

import com.chm.consist.RedisRepository;
import com.chm.mapper.StudentMapper;
import com.chm.mapper.TeacherMapper;
import com.chm.utils.TokenUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.converter.json.GsonFactoryBean;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;
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
        Map map = new HashMap();
        if (userId.length() == 10) {
            map.put("student", studentMapper.selectByPrimaryKey(userId));
        } else {
            map.put("teacher", teacherMapper.selectByPrimaryKey(userId));
        }
        String userInfo = new JSONObject(map).toString();
        redisTemplate.opsForValue().set(token, "{}".equals(userInfo) ? null : userInfo, time, TimeUnit.SECONDS);
        return token;
    }

    @Override
    public void update(String token) {
        redisTemplate.opsForValue().getOperations().expire(token, time, TimeUnit.SECONDS);
    }

    @Override
    public String get(String userId) {
        return String.valueOf(redisTemplate.opsForValue().get(userId));
    }

    @Override
    public void delete(String userId) {
        redisTemplate.opsForValue().getOperations().delete(userId);
    }
}
