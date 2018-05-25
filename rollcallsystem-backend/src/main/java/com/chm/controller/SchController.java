package com.chm.controller;

import com.chm.domain.Schedule;
import com.chm.service.ScheduleService;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 课表控制器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/7
 */
@RestController
public class SchController {

    @Autowired
    private ScheduleService scheduleService;


    @PostMapping(value = "/getSchedule")
    public Result getSchedule(Integer roomid) {
        Schedule schedule = scheduleService.getSchedule(roomid);
        //返回课表
        return schedule != null ?
            ResultUtils.success(scheduleService.getSchedule(roomid)) :
            ResultUtils.error("not schedule", "not schedule");
    }
}
