package com.chm.exception;

import com.alibaba.druid.wall.violation.ErrorCode;

/**
 * 自定义异常类
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/19 23:03
 */
public class ParamExecption extends RuntimeException {
    /**
     * 异常消息
     */
    private final String errorMsg;

    public ParamExecption(String errorMsg) {
        super(errorMsg);
        this.errorMsg = errorMsg;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

}
