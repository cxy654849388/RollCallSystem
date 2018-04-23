package com.chm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.mapper.RecordMapper;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/23
 */
@RestController
public class TestController {

    @Autowired
    private RecordMapper recordMapper;

    @GetMapping("test")
    public Result test() {
        Map map = Maps.newHashMap();
        map.put("countSignedRecords", recordMapper.countSignedRecords(11));
        map.put("getSignedRecords", recordMapper.findSignedRecords("1407020401",
            null, null, null, "2016-2017-1"));
        map.put("countSignedRecord", recordMapper.countSignedRecord("1407020401", null, "2016-2017-1"));
        return ResultUtils.success(map);
    }
}
