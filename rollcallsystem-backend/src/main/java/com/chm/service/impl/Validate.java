package com.chm.service.impl;


import com.chm.exception.ParamExecption;

import java.util.Map;

/**
 * 参数校验类
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/19 22:58
 */
public class Validate {

    public static void selectRecordVali(Map params) {
        if (!params.containsKey("stuId")) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

    public static void addFace(Map params) {
        if (!params.containsKey("stuId") || !params.containsKey("faceData")) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

    public static void getFace(Map params) {
        if (!params.containsKey("stuId")) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

}
