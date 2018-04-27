package com.chm.interceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.annotations.Authorization;
import com.chm.consist.RedisRepository;
import com.chm.domain.Student;
import com.chm.exception.ParamExecption;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.Map;

/**
 * 自定义拦截器,拦截@Authorization注解的请求是否有权限
 *
 * @Author: caihongming
 * @Created: 2018/4/11
 */
@Component
public class AuthorizationInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private RedisRepository redisRepository;


    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        //如果不是映射到方法直接通过
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();
        //该方法没有注明Authorization，跳过验证token
        if (method.getAnnotation(Authorization.class) == null) {
            return true;
        }
        String userToken = request.getHeader("token");
        if (redisRepository == null) {
            //解决service为null无法注入问题
            BeanFactory factory = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
            redisRepository = (RedisRepository) factory.getBean("redisRepository");
        }
        //查询token是否存在
        if (redisRepository.get(userToken) != null) {
            redisRepository.update(userToken);
            return true;
        }
        //验证token失败，并且方法注明了Authorization，返回401错误
        throw new ParamExecption("token无效");

    }

}
