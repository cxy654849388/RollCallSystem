package com.chm.utils;

import com.chm.vo.Result;

/**
 * @Author: caihongming
 * @Created: 2018/4/20
 */
public class ResultUtils {
    public static Result success(Object object) {
        Result result = new Result();
        result.setResultCode(0);
        result.setResult(object);
        return result;
    }

    public static Result success() {
        return success(null);
    }

    public static Result error(String errorCode, String msg) {
        Result result = new Result();
        result.setResultCode(1);
        result.setErrorCode(errorCode);
        result.setErrorInfo(msg);
        return result;
    }

}
