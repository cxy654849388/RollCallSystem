package com.chm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.service.ScheduleService;
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
    public JSONObject getSchedule(Integer roomid) {
        //Map map = new HashMap();
        JSONObject json = new JSONObject();
        //返回课表
        json.put("schedule", scheduleService.getSchedule(roomid));
        return json;
    }
}
