package com.chm.service;

/**
 * @Author: caihongming
 * @Created: 2018/4/12
 */
public interface ManagerService {
    /**
     * 管理员登录方法
     *
     * @param account  管理员账号
     * @param password 密码
     * @return
     */
    String login(String account, String password);


}
