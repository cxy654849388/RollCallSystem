package com.chm.service;

/**
 * @Author: caihongming
 * @Created: 2018/4/11
 */
public interface TeacherService {

    /**
     * 教师登录方法
     *
     * @param teaid    教师工号
     * @param password 密码
     * @return
     */
    String login(String teaid, String password);
}
