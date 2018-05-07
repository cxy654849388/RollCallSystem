package com.chm.service.impl;

import com.chm.consist.FaceRecognition;
import com.chm.consist.RedisRepository;
import com.chm.domain.FaceData;
import com.chm.mapper.AcademyMapper;
import com.chm.mapper.FaceDataMapper;
import com.chm.mapper.ManagerMapper;
import com.chm.mapper.StudentMapper;
import com.chm.service.ManagerService;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
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
    private FaceRecognition faceRecognition;


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
        //检测人脸
        if (faceRecognition.faceDetect(faceData)) {
            //新建人脸实例
            FaceData face = new FaceData();
            face.setStuid(stuId);
            face.setFacedate(faceData);
            //插入人脸信息
            faceDataMapper.insert(face);
            return ResultUtils.success();
        } else {
            return ResultUtils.error("0001", "没有检测到人脸或者人脸数量不为1");
        }
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
        //页码
        Integer page = Integer.parseInt(params.get("page") == null ? "1" : params.get("page").toString());
        //单页大小
        Integer size = Integer.parseInt(params.get("size") == null ? "20" : params.get("size").toString());
        //学院编号
        String acaid = params.get("acaid") != null ? String.valueOf(params.get("acaid")) : null;
        //专业编号
        String proid = params.get("proid") != null ? String.valueOf(params.get("proid")) : null;
        //班级编号
        String classid = params.get("classid") != null ? String.valueOf(params.get("classid")) : null;
        Page<?> p = PageHelper.startPage(page, size);
        //查询学生集合
        List list = studentMapper.getStudentList(acaid, proid, classid);
        //返回查询结果
        Map m = Maps.newHashMap();
        m.put("totalPages", p.getPages());
        m.put("page", p.getPageNum());
        m.put("totalElements", p.getTotal());
        m.put("size", p.getPageSize());
        m.put("data", list);

        //返回结果
        return ResultUtils.success(m);
    }


}
