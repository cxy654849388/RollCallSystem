package com.chm.controller;

import com.chm.service.ScheduleService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

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
    public String getSchedule(Integer roomid) {
        Map map = new HashMap();
        map.put("schedule", scheduleService.getSchedule(roomid));
        return new JSONObject(map).toString();
    }
}
