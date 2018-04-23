package com.chm.service;

import com.chm.vo.Result;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/11
 */
public interface TeacherService {

    Result getTeach(HttpServletRequest request);

    Result getRecords(Map params,HttpServletRequest request);

    Result getSignedRecords(Map params);

    Result countSignedRecords(Map params);

}
