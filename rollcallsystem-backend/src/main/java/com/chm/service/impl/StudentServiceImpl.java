package com.chm.service.impl;

import com.chm.consist.FaceRecognition;
import com.chm.consist.RedisRepository;
import com.chm.domain.*;
import com.chm.mapper.*;
import com.chm.service.StudentService;
import com.chm.utils.ResultUtils;
import com.chm.vo.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoField;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Service("studentService")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class StudentServiceImpl implements StudentService {

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private FaceDataMapper faceDataMapper;

    @Autowired
    private FaceDataTrainStatusMapper faceDataTrainStatusMapper;

    @Autowired
    private ClassMapper classMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ScheduleMapper scheduleMapper;

    @Autowired
    private SelectCourseMapper selectCourseMapper;

    @Autowired
    private FaceRecognition faceRecognition;

    @Autowired
    private RedisRepository redisRepository;

    /**
     * 正常签到开始
     * 默认上课前二十分钟
     */
    @Value("#{${NORMALSTART:20} * 60}")
    private int NORMALSTART;


    /**
     * 正常签到结束
     * 默认上课后五分钟
     */
    @Value("#{${NORMALEND:5} * -60}")
    private int NORMALEND;


    /**
     * 迟到
     * 默认上课后五分钟至上课后二十分钟
     */
    @Value("#{${NORMAL:20} * -60}")
    private int LATE;

    /**
     * 学期开始周数
     */
    @Value("${STARTWEEK}")
    Integer STARTWEEK;

    /**
     * 当前学期
     */
    @Value("${SEMESTER}")
    private String SEMESTER;


    /**
     * 查询签到记录方法
     *
     * @param params 参数集
     * @return
     */
    @Override
    public Result selectRecord(Map params, HttpServletRequest request) {

        //获取参数
        //页码
        Integer page = Integer.parseInt(params.get("page") == null ? "1" : params.get("page").toString());
        //单页大小
        Integer size = Integer.parseInt(params.get("size") == null ? "10" : params.get("size").toString());
        //获取学生实例
        Student stu = (Student) redisRepository.get(request.getHeader("token"));
        //学生学号
        String stuId = stu.getStuid();
        //课表编号
        Integer teachId = params.containsKey("teachid") ?
            Integer.parseInt(params.get("teachid").toString()) : null;
        //开始周数
        Integer startWeek = params.containsKey("startWeek") ?
            Integer.parseInt(String.valueOf(params.get("startWeek"))) : 1;
        //结束周数
        Integer endWeek = params.containsKey("endWeek") ?
            Integer.parseInt(String.valueOf(params.get("endWeek"))) : null;
        Page<?> p = PageHelper.startPage(page, size);
        //返回查询结果
        List list = recordMapper.findSignedRecords(stuId, teachId, startWeek, endWeek, SEMESTER);
        Map m = Maps.newHashMap();
        m.put("totalPages", p.getPages());
        m.put("page", p.getPageNum());
        m.put("totalElements", p.getTotal());
        m.put("size", p.getPageSize());
        m.put("data", list);
        return ResultUtils.success(m);
    }

    /**
     * 统计学生学期签到情况
     *
     * @param params
     * @return
     */
    @Override
    public Result countSignedRecord(Map params, HttpServletRequest request) {
        //校验参数
        Validate.countSignedRecord(params);
        //获取学生实例
        Student stu = (Student) redisRepository.get(request.getHeader("token"));
        //学生学号
        String stuId = stu.getStuid();
        //课表编号
        Integer schId = params.containsKey("schId") ?
            Integer.parseInt(params.get("schId").toString()) : null;
        List list = recordMapper.countSignedRecord(stuId, schId, SEMESTER);
        return ResultUtils.success(list);
    }

    /**
     * 获取学生选课
     *
     * @param request
     * @return
     */
    @Override
    public Result getSelectCourse(HttpServletRequest request) {
        //获取学生实例
        Student stu = (Student) redisRepository.get(request.getHeader("token"));
        //学生学号
        String stuId = stu.getStuid();
        //查询结果
        List list = selectCourseMapper.getSelectCourse(stuId);
        //返回结果
        return ResultUtils.success(list);
    }

    /**
     * 学生签到方法
     *
     * @param image      学生图像
     * @param schid      课表id
     * @param signedTime 签到时间
     * @return 签到学生的实例
     */
    @Override
    public synchronized Student signed(String image, Integer schid, LocalTime signedTime) {
        //获取课表实例
        Schedule schedule = scheduleMapper.selectByPrimaryKey(schid);
        if (schedule.getStarttime().toSecondOfDay() - signedTime.toSecondOfDay() > NORMALSTART) {
            //没到签到时间
            return null;
        }
        //根据任课实例获取课堂所有学生相应的标签
        List<String> labels = classMapper.getClasses(schid);
        //识别，获取识别结果 label格式:groupId/userId
        String label = faceRecognition.recogntion(image, labels);
        //计算本周为第几周
        String weekofsemester = String.valueOf(LocalDate.now().get(ChronoField.ALIGNED_WEEK_OF_YEAR) - STARTWEEK + 1);
        if (label != null) {
            //获取学生ID
            String stuId = label.split("/")[1];
            //插入签到结果
            //查询是否已签到
            if (recordMapper.selectStatusByStuidAndSchidAndWeekofsemester(stuId, schid, weekofsemester, SEMESTER) == null) {
                //进行签到
                //比较签到时间
                long time = schedule.getStarttime().toSecondOfDay() - signedTime.toSecondOfDay();
                //新建签到实例
                Record record = new Record();
                //学生学号
                record.setStuid(stuId);
                //课表编号
                record.setSchid(schid);
                //周数
                record.setWeekofsemester(weekofsemester);
                if (time > NORMALEND && time < NORMALSTART) {
                    //正常签到
                    record.setStatus("正常");
                } else if (time > LATE) {
                    //迟到
                    record.setStatus("迟到");
                } else if (time < LATE && schedule.getEndtime().getSecond() > signedTime.getSecond()) {
                    //缺课
                    record.setStatus("缺课");
                }
                //签到时间
                record.setSignedtime(LocalTime.now());
                //当前学期
                record.setSemester(SEMESTER);
                //插入签到记录
                recordMapper.insert(record);
                //构造人脸数据训练状态对象
                FaceDataTrainStatus faceDataTrainStatus = new FaceDataTrainStatus();
                faceDataTrainStatus.setStuid(stuId);
                faceDataTrainStatus.setStatus("0");
                //插入人脸数据训练状态记录
                faceDataTrainStatusMapper.insertOrUpdate(faceDataTrainStatus);
                //插入人脸数据
                FaceData faceData = new FaceData();
                faceData.setFacedate(image);
                faceData.setStuid(stuId);
                faceDataMapper.insertSelective(faceData);
            }
            Student student = studentMapper.selectByPrimaryKey(stuId);
            //返回学生学号
            return student;
        } else {
            return null;
        }
    }

}
