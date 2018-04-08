package com.chm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * @Author: Hongming Cai
 * @Created: 2018/3/27 23:15
 */
@Controller
public class Index {

    private String hello = "Hello GODads";


    @RequestMapping(value = {"/helloJsp","/"},method = RequestMethod.GET)
    public String helloJsp(Map<String, Object> map) {
        System.out.println("HelloController.helloJsp().hello=" + hello);
        map.put("hello", hello);
        return "index";
    }
}
