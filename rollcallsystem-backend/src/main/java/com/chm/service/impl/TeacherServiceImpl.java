package com.chm.service.impl;

import com.chm.consist.RedisRepository;
import com.chm.domain.Teacher;
import com.chm.exception.ParamExecption;
import com.chm.mapper.RecordMapper;
import com.chm.mapper.StudentMapper;
import com.chm.mapper.TeacherMapper;
import com.chm.service.TeacherService;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
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
    private StudentMapper studentMapper;

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private RedisRepository redisRepository;

    /**
     * 请假状态标识码
     */
    private static int leave = 1;
    /**
     * 补签状态标识码
     */
    private static int retroactive = 2;

    @Override
    public Result getTeach(HttpServletRequest request) {
        //获取token
        String token = request.getHeader("token");
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
        //页码
        Integer page = Integer.parseInt(params.get("page") == null ? "1" :
            params.get("page").toString());
        //单页大小
        Integer size = Integer.parseInt(params.get("size") == null ? "20" :
            params.get("size").toString());
        //任课id
        Integer teachid = params.get("teachid") == null ? null :
            Integer.parseInt(params.get("teachid").toString());
        //获取token
        String token = request.getHeader("token");
        //获取教师实例
        Teacher teacher = (Teacher) redisRepository.get(token);
        //教师id
        String teaid = teacher.getTeaid();
        Page<?> p = PageHelper.startPage(page, size);
        //查询结果
        List list = teacherMapper.getRecords(teachid, teaid);
        //返回查询结果
        Map m = Maps.newHashMap();
        m.put("totalPages", p.getPages());
        m.put("page", p.getPageNum());
        m.put("totalElements", p.getTotal());
        m.put("size", p.getPageSize());
        m.put("data", list);
        //返回结果
        return ResultUtils.success(m);
    }

    @Override
    public Result getStudentList(Map params, HttpServletRequest request) {
        //页码
        Integer page = Integer.parseInt(params.get("page") == null ? "1" :
            params.get("page").toString());
        //单页大小
        Integer size = Integer.parseInt(params.get("size") == null ? "20" :
            params.get("size").toString());
        //获取token
        String token = request.getHeader("token");
        //获取教师实例
        Teacher teacher = (Teacher) redisRepository.get(token);
        //教师id
        String teaid = teacher.getTeaid();
        params.put("teaid", teaid);
        Page<?> p = PageHelper.startPage(page, size);
        //查询结果
        List list = studentMapper.getStudentList(params);
        //返回查询结果
        Map m = Maps.newHashMap();
        m.put("totalPages", p.getPages());
        m.put("page", p.getPageNum());
        m.put("totalElements", p.getTotal());
        m.put("size", p.getPageSize());
        m.put("data", list);
        //返回结果
        return ResultUtils.success(m);
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
    public Result countSignedRecords(Map params, HttpServletRequest request) {
        //校验参数
        Validate.countSignedRecords(params);
        //获取学生学号
        String stuId = String.valueOf(params.get("stuid"));
        //获取任课id
        Integer teachid = params.get("teachid") == null ? null :
            Integer.parseInt(params.get("teachid").toString());
        //获取token
        String token = request.getHeader("token");
        //获取教师实例
        Teacher teacher = (Teacher) redisRepository.get(token);
        //教师id
        String teaid = teacher.getTeaid();
        //查询结果
        Map map = recordMapper.countSignedRecords(stuId, teachid, teaid);
        //返回结果
        return ResultUtils.success(map);
    }

    @Override
    public Result getStudentSignedDetails(Map params, HttpServletRequest request) {
        //校验参数
        Validate.getStudentSignedDetails(params);
        //获取学生学号
        String stuId = String.valueOf(params.get("stuid"));
        //任课id
        Integer teachId = params.get("teachid") == null ? null :
            Integer.parseInt(params.get("teachid").toString());
        //获取token
        String token = request.getHeader("token");
        //获取教师实例
        Teacher teacher = (Teacher) redisRepository.get(token);
        //教师id
        String teaid = teacher.getTeaid();
        //查询结果
        List list = recordMapper.getStudentSignedDetails(teachId, stuId, teaid);
        //返回结果
        return ResultUtils.success(list);
    }

    @Override
    public Result signedStatusChange(Map params) {
        //校验参数
        Validate.signedStatusChange(params);
        //获取学生学号
        String stuId = String.valueOf(params.get("stuid"));
        //获取课表编号
        String schid = String.valueOf(params.get("schid"));
        //获取周数
        String week = String.valueOf(params.get("weekofsemester"));
        //获取状态
        String status = null;
        Integer statusCode = params.get("status") == null ? null :
            Integer.parseInt(params.get("status").toString());
        if (statusCode.intValue() == leave) {
            //请假
            status = "请假";
        } else if (statusCode.intValue() == retroactive) {
            //补签
            status = "正常";
        } else {
            throw new ParamExecption("状态标识码错误");
        }
        //修改签到状态
        recordMapper.signedStatusChange(stuId, schid, week, status);
        //返回结果
        return ResultUtils.success();
    }

}
