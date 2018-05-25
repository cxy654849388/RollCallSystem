package com.chm.controller;

import com.chm.mapper.*;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/23
 */
@RestController
public class TestController {

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private SelectCourseMapper selectCourseMapper;

    @Autowired
    private AcademyMapper academyMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private TeacherMapper teacherMapper;

    @GetMapping("test")
    public Result test() {
        Map map = Maps.newHashMap();
        //map.put("countSignedRecords", recordMapper.countSignedRecords(11));
        map.put("findSignedRecords", recordMapper.findSignedRecords("1407020401",
            11, null, null, "2016-2017-1"));
        map.put("countSignedRecord", recordMapper.countSignedRecord("1407020401", 11, "2016-2017-1"));
        map.put("getSelectCourse", selectCourseMapper.getSelectCourse("1407020401"));
        map.put("getSchoolInfo", academyMapper.getSchoolInfo());
        //map.put("getStudentList", studentMapper.getStudentList("07", "0702", "14070204"));
        map.put("getTeach", teacherMapper.getTeach("0001"));
        map.put("getRecords", teacherMapper.getRecords(11, "0001"));
        map.put("getSignedRecords", recordMapper.getSignedRecords(20, "4"));
        map.put("getStudentSignedDetails", recordMapper.getStudentSignedDetails(11, "1407020401","0001"));
        return ResultUtils.success(map);
    }
}
