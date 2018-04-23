package com.chm.service.impl;

import com.chm.consist.RedisRepository;
import com.chm.domain.FaceData;
import com.chm.mapper.AcademyMapper;
import com.chm.mapper.FaceDataMapper;
import com.chm.mapper.ManagerMapper;
import com.chm.mapper.StudentMapper;
import com.chm.service.ManagerService;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/12
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;

    @Autowired
    private FaceDataMapper faceDataMapper;

    @Autowired
    private AcademyMapper academyMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private RedisRepository redisRepository;


    /**
     * 添加学生人脸
     *
     * @param params
     * @return
     */
    @Override
    public Result addFace(Map params) {
        //校验参数
        Validate.addFace(params);
        //获取学生ID
        String stuId = String.valueOf(params.get("stuId"));
        //获取学生人脸信息
        String faceData = String.valueOf(params.get("faceData"));
        //新建人脸实例
        FaceData face = new FaceData();
        face.setStuid(stuId);
        face.setFacedate(faceData);
        //插入人脸信息
        faceDataMapper.insert(face);
        return ResultUtils.success();
    }

    /**
     * 根据学生学号获取学生人脸
     *
     * @param params
     * @return
     */
    @Override
    public Result getFace(Map params) {
        //校验参数
        Validate.getFace(params);
        //获取学生ID
        String stuId = String.valueOf(params.get("stuId"));
        PageHelper.startPage(1, 10);
        List list = faceDataMapper.getFaceData(stuId);
        return ResultUtils.success(list);
    }

    /**
     * 学院班级信息
     *
     * @return
     */
    @Override
    public Result getSchoolInfo() {
        List list = academyMapper.getSchoolInfo();
        return ResultUtils.success(list);
    }

    /**
     * 获取学生信息
     *
     * @param params
     * @return
     */
    @Override
    public Result getStudentList(Map params) {
        //获取参数
        //学院编号
        String acaid = params.containsKey("acaid") ? params.get("acaid").toString() : null;
        //专业编号
        String proid = params.containsKey("proid") ? params.get("proid").toString() : null;
        //班级编号
        String classid = params.containsKey("classid") ? params.get("classid").toString() : null;
        //查询学生集合
        List list = studentMapper.getStudentList(acaid, proid, classid);
        //返回结果
        return ResultUtils.success(list);
    }


}
