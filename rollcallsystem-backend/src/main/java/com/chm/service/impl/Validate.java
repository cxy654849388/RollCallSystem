package com.chm.service.impl;


import com.chm.exception.ParamExecption;
import org.apache.ibatis.annotations.Param;

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

    public static void login(Map params) {
        if (!params.containsKey("userId") || !params.containsKey("password")) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

    public static void getSignedRecords(Map params) {
        if (!params.containsKey("schid") || !params.containsKey("weekofsemester")) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

    public static void countSignedRecords(Map params) {
        if (!params.containsKey("stuid")) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

    public static void getStudentSignedDetails(Map params) {
        if (!params.containsKey("stuid")) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

    public static void signedStatusChange(Map params) {
        if (!params.containsKey("schid") || !params.containsKey("weekofsemester")
            || !params.containsKey("status")|| !params.containsKey("stuid") ) {
            throw new ParamExecption("ERROR_PARAM_IS_NULL");
        }
    }

}
