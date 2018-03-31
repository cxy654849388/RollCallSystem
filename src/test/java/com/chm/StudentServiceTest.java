package com.chm;

import com.chm.domain.Record;
import com.chm.service.StudentService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;


/**
 * @Author: Hongming Cai
 * @Created: 2018/3/31 20:24
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class StudentServiceTest {

    @Autowired
    private StudentService studentService;

    /**
     * 测试
     */
    @Test
    public void test() {
        List<Record> records = new ArrayList<Record>();

        Record record = new Record();

        record.setRecid(1);
        record.setTeachid(1);
        record.setStuid("2");
        record.setStatus("迟到");
        records.add(record);

        records = studentService.selectRecord("2");

        Assert.assertEquals(records, studentService.selectRecord("2"));


    }

}
