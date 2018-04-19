package com.chm.controller;

import com.chm.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 清点控制器
 *
 * @Author: caihongming
 * @Created: 2018/4/9
 */
@RestController
@CrossOrigin
public class CountController {

    @Autowired
    private RecordService recordService;


    /**
     * 下课时间到清点人数
     *
     * @param schid 课表编号
     * @return
     */
    @PostMapping(value = "/counting")
    public void signed(Integer schid) {
        recordService.counting(schid);
    }

}
