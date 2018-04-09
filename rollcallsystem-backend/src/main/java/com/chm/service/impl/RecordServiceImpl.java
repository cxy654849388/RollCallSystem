package com.chm.service.impl;

import com.chm.domain.Record;
import com.chm.mapper.ClassMapper;
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
    RecordMapper recordMapper;

    @Autowired
    ClassMapper classMapper;

    @Autowired

    /**
     * 学期开始周数
     */
    @Value("${STARTWEEK}")
    Integer STARTWEEK;

    @Override
    public Record getRecord(String stuId, Integer schId) {
        //计算本周为第几周
        String weekofsemester = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK + 1);
        return recordMapper.selectStatusByStuidAndSchidAndWeekofsemester(stuId, schId, weekofsemester);
    }

    @Override
    public void counting(Integer schId) {
        //计算本周为第几周
        String weekofsemester = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK + 1);
        //获取未签到学生学号
        List<String> stuIds = recordMapper.countting(schId, weekofsemester);
        //插入未签到学生记录
        recordMapper.insertNotSigned(stuIds, schId, weekofsemester);
    }


}
