package com.chm.controller;

import com.chm.domain.Schedule;
import com.chm.mapper.ScheduleMapper;
import com.chm.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/7 14:05
 */
@RestController
public class SchController {

    @Autowired
    ScheduleService scheduleService;


    @PostMapping(value = "/getSchedule")
    public Schedule getSchedule(Integer roomid) {
        return scheduleService.getSchedule(roomid);
    }
}
