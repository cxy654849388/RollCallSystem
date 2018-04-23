package com.chm.service;

import com.chm.vo.Result;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/23
 */
public interface UserService {
    /**
     * 用户登录方法
     * @param params
     * @return
     */
    Result login(Map params);

    /**
     * 用户注销方法
     * @param request
     * @return
     */
    Result logout(HttpServletRequest request);
}
