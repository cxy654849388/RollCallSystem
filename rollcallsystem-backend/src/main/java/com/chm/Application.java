package com.chm;

import com.chm.consist.RedisRepository;
import com.chm.domain.Schedule;
import com.chm.mapper.*;
import com.chm.service.ScheduleService;
import com.chm.service.StudentService;
import com.github.pagehelper.PageHelper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import java.util.*;

@SpringBootApplication
@ComponentScan(basePackages = "com.chm")
@MapperScan("com.chm.mapper")
public class Application {


    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(Application.class, args);
        StudentService studentService = (StudentService) context.getBean("studentService");

        RecordMapper recordMapper = (RecordMapper) context.getBean("recordMapper");

        ClassMapper classMapper = (ClassMapper) context.getBean("classMapper");

        ScheduleMapper scheduleMapper = (ScheduleMapper) context.getBean("scheduleMapper");

        StudentMapper studentMapper = (StudentMapper) context.getBean("studentMapper");

        TeachMapper teachMapper = (TeachMapper) context.getBean("teachMapper");

        ScheduleService scheduleService = (ScheduleService) context.getBean("scheduleService");

        RedisRepository redisRepository = (RedisRepository) context.getBean("redisRepository");

        String user_token = redisRepository.add("1407020401");

        System.out.println("user_token:" + user_token);

        System.out.println("get_user_token:" + redisRepository.get(user_token));

        List list = studentService.selectRecord(null);

        System.out.println(Arrays.toString(list.toArray()));

        System.out.println(recordMapper.selectStatusByStuidAndSchidAndWeekofsemester("2", 1, String.valueOf(10)));

        //根据任课实例获取课堂所有学生相应的标签
        List<String> labels = classMapper.getLabels(31);
        System.out.println(labels);

        PageHelper.startPage(1, 10);
        //System.out.println(studentMapper.findAll().size());
        //获取课表实例
        Schedule schedule = scheduleMapper.selectByPrimaryKey(31);
        System.out.println(schedule);

        Set<String> stringSet = new HashSet<>();
        String str = "1,2,3,4,5,6,7,8,9,10";
        stringSet.addAll(Arrays.asList(str.split(",")));
        System.out.println(stringSet);

        System.out.println(scheduleService.getSchedule(17));

        System.out.println(recordMapper.countting(20, "5"));



    }
}
