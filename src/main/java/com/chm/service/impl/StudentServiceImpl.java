package com.chm.service.impl;

import com.chm.consist.FaceRecognition;
import com.chm.domain.FaceDataTrainStatus;
import com.chm.domain.Record;
import com.chm.domain.Student;
import com.chm.domain.Teach;
import com.chm.mapper.*;
import com.chm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private FaceDataTrainStatusMapper faceDataTrainStatusMapper;

    @Autowired
    private TeachMapper teachMapper;

    @Autowired
    private ClassMapper classMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private FaceRecognition faceRecognition;


    /**
     * 正常签到
     */
    @Value("#{${NORMAL:5} * -60000}")
    private int NORMAL;


    /**
     * 迟到
     */
    @Value("#{${NORMAL:20} * -60000}")
    private int LATE;

    public int getNORMAL() {
        return NORMAL;
    }

    public int getLATE() {
        return LATE;
    }

    /**
     * 查询签到记录方法
     *
     * @param stuId
     * @return
     */
    @Override
    public List<Record> selectRecord(String stuId) {
        return recordMapper.selectByStuId(stuId);
    }

    /**
     * 学生签到方法
     *
     * @param image   学生人脸图像
     * @param teachid 任课实例id
     * @return
     */
    @Override
    public String signed(String image, Integer teachid) {

        Teach teach = teachMapper.selectByPrimaryKey(teachid);
        //根据任课实例获取课堂所有学生相应的标签
        List<String> labels = classMapper.getLabels(teachid);
        //识别，获取识别结果 label格式:groupId/userId
        String label = faceRecognition.recogntion(image, labels);
        if (label != null) {
            //获取学生ID
            String stuId = label.split("/")[1];
            //插入签到结果
            //查询是否已签到
            if (recordMapper.selectStatusByStuidAndTeachid(stuId, teach.getTeachid()) == null) {
                //进行签到
                //比较签到时间
                long time = teach.getStarttime().getTime() - System.currentTimeMillis();
                Record record = new Record();
                record.setStuid(stuId);
                record.setTeachid(teach.getTeachid());
                if (time > NORMAL) {
                    //正常签到
                    record.setStatus("正常");
                } else if (time > LATE) {
                    //迟到
                    record.setStatus("迟到");
                } else {
                    //缺课
                    record.setStatus("缺课");
                }
                //插入签到记录
                recordMapper.insert(record);
                //构造人脸数据训练状态对象
                FaceDataTrainStatus faceDataTrainStatus = new FaceDataTrainStatus();
                faceDataTrainStatus.setStuid(stuId);
                faceDataTrainStatus.setStatus("0");
                //插入人脸数据训练状态记录
                faceDataTrainStatusMapper.updateByPrimaryKey(faceDataTrainStatus);
            }
            //返回学生学号
            return stuId;
        } else {
            return null;
        }


    }
}
