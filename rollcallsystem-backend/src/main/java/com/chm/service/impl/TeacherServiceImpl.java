package com.chm.service.impl;

import com.chm.consist.RedisRepository;
import com.chm.mapper.TeacherMapper;
import com.chm.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: caihongming
 * @Created: 2018/4/11
 */
@Service("teacherService")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    TeacherMapper teacherMapper;

    @Autowired
    RedisRepository redisRepository;

    /**
     * 教师登陆方法
     *
     * @param teaid    教师工号
     * @param password 密码
     * @return token
     */
    @Override
    public String login(String teaid, String password) {
        if (teacherMapper.getPasswordByTeaid(teaid).equals(password)) {
            return redisRepository.add(teaid);
        }
        return null;
    }
}
