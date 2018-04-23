package com.chm.service.impl;

import com.chm.domain.Schedule;
import com.chm.mapper.ScheduleMapper;
import com.chm.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoField;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ScheduleMapper scheduleMapper;

    /**
     * 学期开始周数
     */
    @Value("${STARTWEEK}")
    private Integer STARTWEEK;


    @Override
    public Schedule getSchedule(Integer roomid) {
        //计算本周为第几周
        String weekofsemester = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK + 1);
        //返回课表
        return scheduleMapper.selectByRoomidAndWeek(roomid, weekofsemester);
    }


}
