package com.chm.service.impl;

import com.chm.consist.RedisRepository;
import com.chm.domain.Teacher;
import com.chm.mapper.RecordMapper;
import com.chm.mapper.TeacherMapper;
import com.chm.service.TeacherService;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.mchange.lang.IntegerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/11
 */
@Service("teacherService")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private RedisRepository redisRepository;

    @Override
    public Result getTeach(HttpServletRequest request) {
        //获取token
        String token = request.getHeader("Authorization");
        //获取教师实例
        Teacher teacher = (Teacher) redisRepository.get(token);
        //查询结果
        List list = teacherMapper.getTeach(teacher.getTeaid());
        //返回结果
        return ResultUtils.success(list);
    }

    @Override
    public Result getRecords(Map params, HttpServletRequest request) {
        //获取参数
        //任课id
        Integer teachid = params.containsKey("params") ? Integer.parseInt(String.valueOf(params.get("teachid"))) : null;
        //获取token
        String token = request.getHeader("Authorization");
        //获取教师实例
        Teacher teacher = (Teacher) redisRepository.get(token);
        //教师id
        String teaid = teacher.getTeaid();
        //查询结果
        List list = teacherMapper.getRecords(teachid, teaid);
        //返回结果
        return ResultUtils.success(list);
    }

    @Override
    public Result getSignedRecords(Map params) {
        //校验参数
        Validate.getSignedRecords(params);
        //获取课表id
        Integer schid = Integer.parseInt(String.valueOf(params.get("schid")));
        //周数
        String weekofsemester = String.valueOf(params.get("weekofsemester"));
        //查询结果
        List list = recordMapper.getSignedRecords(schid, weekofsemester);
        //返回结果
        return ResultUtils.success(list);
    }

    @Override
    public Result countSignedRecords(Map params) {
        //校验参数
        Validate.countSignedRecords(params);
        //获取任课id
        Integer teachid = Integer.parseInt(String.valueOf(params.get("teachid")));
        //查询结果
        List list = recordMapper.countSignedRecords(teachid);
        //返回结果
        return ResultUtils.success(list);
    }


}
