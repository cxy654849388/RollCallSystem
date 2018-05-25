package com.chm.service.impl;

import com.chm.domain.Record;
import com.chm.mapper.RecordMapper;
import com.chm.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.temporal.ChronoField;
import java.util.List;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/7 14:05
 */
@Service("recordService")
public class RecordServiceImpl implements RecordService {

    @Autowired
    private RecordMapper recordMapper;

    @Autowired

    /**
     * 学期开始周数
     */
    @Value("${STARTWEEK}")
    private Integer STARTWEEK;

    /**
     * 当前学期
     */
    @Value("${SEMESTER}")
    private String SEMESTER;

    @Override
    public Record getRecord(String stuId, Integer schId) {
        //计算本周为第几周
        String weekofsemester = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK + 1);
        return recordMapper.selectStatusByStuidAndSchidAndWeekofsemester(stuId, schId, weekofsemester, SEMESTER);
    }

    @Override
    public void counting(Integer schId) {
        //计算本周为第几周
        String weekofsemester = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK + 1);
        //获取未签到学生学号
        List<String> stuIds = recordMapper.counting(schId, weekofsemester);
        //插入未签到学生记录
        recordMapper.insertNotSigned(stuIds, schId, weekofsemester, SEMESTER);
    }

    @Override
    public void absence(String stuid, Integer schid) {
        //计算本周为第几周
        String week = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK + 1);
        //修改签到状态
        recordMapper.signedStatusChange(stuid, schid, week, "缺课");
    }


}
