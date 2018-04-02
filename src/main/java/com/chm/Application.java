package com.chm;

import com.chm.mapper.RecordMapper;
import com.chm.service.StudentService;
import com.chm.service.impl.StudentServiceImpl;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import java.util.Arrays;
import java.util.List;

@SpringBootApplication
@ComponentScan(basePackages = "com.chm")
@MapperScan("com.chm.mapper")
public class Application {


    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(Application.class, args);
        StudentService studentService = (StudentService) context.getBean("studentService");

        RecordMapper recordMapper = (RecordMapper) context.getBean("recordMapper");

        List list = studentService.selectRecord(null);

        System.out.println(Arrays.toString(list.toArray()));

        System.out.println(recordMapper.selectStatusByStuidAndSchid("2", 1));

        System.out.println(((StudentServiceImpl) studentService).getNORMAL());

    }
}
