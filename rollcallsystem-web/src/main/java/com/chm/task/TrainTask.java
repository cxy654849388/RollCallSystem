package com.chm.task;

import com.chm.consist.FaceRecognition;
import com.chm.domain.FaceDataTrainStatus;
import com.chm.mapper.FaceDataMapper;
import com.chm.mapper.FaceDataTrainStatusMapper;
import com.github.pagehelper.PageHelper;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TrainTask implements Job {

    @Autowired
    private FaceRecognition faceRecognition;

    @Autowired
    private FaceDataTrainStatusMapper faceDataTrainStatusMapper;

    @Autowired
    private FaceDataMapper faceDataMapper;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        //获取最新可训练学生学号
        List<String> stuIdList = faceDataTrainStatusMapper.findStatusNo();

        //遍历训练
        for (String stuId : stuIdList) {
            //组装标签 lable:groupId/userId
            StringBuilder stringBuffer = new StringBuilder().append(stuId.substring(0, 8)).append("/").append(stuId);
            PageHelper.startPage(1, 10);
            //获取学生照片集合
            List<String> images = faceDataMapper.getFaceData(stuId);
            //训练模型
            faceRecognition.train(images, stringBuffer.toString());
            //创建FaceDataTrainStatus对象
            FaceDataTrainStatus faceDataTrainStatus = new FaceDataTrainStatus();
            faceDataTrainStatus.setStuid(stuId);
            faceDataTrainStatus.setStatus("1");
            //更新人脸训练状态
            faceDataTrainStatusMapper.updateByPrimaryKeySelective(faceDataTrainStatus);
        }

    }
}
