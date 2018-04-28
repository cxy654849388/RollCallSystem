package com.chm.handle;

import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;


/**
 * @Author: caihongming
 * @Created: 2018/4/20
 */
@ControllerAdvice
@CrossOrigin
public class ExceptionHandle {

    /**
     * 表明这个handler只处理什么类型的异常
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Result handle(Exception e, HttpServletResponse response) {
        if ("登录超时".equals(e.getMessage())) {
            response.setHeader("Access-Control-Allow-Origin", "*");
            return ResultUtils.error("1A", e.getMessage());
        }
        return ResultUtils.error("-1", e.getMessage());
    }


}