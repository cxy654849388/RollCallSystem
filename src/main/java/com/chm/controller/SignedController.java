package com.chm.controller;

import com.chm.consist.FaceRecognition;
import com.chm.domain.Student;
import com.chm.domain.Teach;
import com.chm.mapper.ClassMapper;
import com.chm.mapper.StudentMapper;
import com.chm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class SignedController {



    @Autowired
    private StudentService studentService;




    @RequestMapping(value = "/signed", method = RequestMethod.POST)
    @ResponseBody
    public String signed(@PathVariable("image") String image, @PathVariable("schid") Integer schid) {
        return studentService.signed(image, schid);
    }
}
