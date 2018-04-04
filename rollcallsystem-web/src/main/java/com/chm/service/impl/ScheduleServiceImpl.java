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
    ScheduleMapper scheduleMapper;

    @Value("${STARTWEEK}")
    Integer STARTWEEK;


    @Override
    public Schedule getSchedule(Integer roomid) {
        //获取本周为第几周
        String weekofsemeter = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK);
        //返回课表
        return scheduleMapper.selectByRoomidAndWeek(roomid, weekofsemeter);
    }


}
