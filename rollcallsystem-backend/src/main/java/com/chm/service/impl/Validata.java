package com.chm.service.impl;


import com.chm.exception.ParamExecptiom;

import java.util.Map;

/**
 * 参数校验类
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/19 22:58
 */
public class Validata {

    public static void selectRecordVali(Map map) throws ParamExecptiom {
        if (!map.containsKey("stuId")) {
            throw new ParamExecptiom("Param_Is_Not");
        }
    }
}
