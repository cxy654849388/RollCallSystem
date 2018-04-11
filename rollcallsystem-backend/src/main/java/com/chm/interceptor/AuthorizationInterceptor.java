package com.chm.interceptor;

import com.chm.annotations.Authorization;
import com.chm.consist.RedisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

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
        //从header中得到token
        String user_token = request.getParameter("user_token");
        //查询token是否存在
        if (redisRepository.get(user_token) != null) {
            redisRepository.update(user_token);
            return true;
        }
        //验证token失败，并且方法注明了Authorization，返回401错误
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        return false;
    }
}
