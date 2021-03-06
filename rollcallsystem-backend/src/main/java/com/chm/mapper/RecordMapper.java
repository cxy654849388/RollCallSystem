package com.chm.mapper;

import com.chm.domain.Record;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface RecordMapper {
    int deleteByPrimaryKey(Integer recid);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer recid);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);

    /**
     * 更改学生签到状态为缺课方法
     *
     * @param schid 课表编号
     * @param stuid 学生学号
     * @return
     */
    int absence(Integer schid, String stuid);

    /**
     * 查询学生签到记录
     *
     * @param stuId 学生学号
     * @return
     */
    List findSignedRecords(@Param("stuid") String stuId,
                           @Param("teachid") Integer teachId,
                           @Param("startWeek") Integer startWeek,
                           @Param("endWeek") Integer endWeek,
                           @Param("semester") String semester);

    /**
     * 统计学生在某门课的签到记录
     *
     * @param stuId
     * @param teachId
     * @param semester
     * @return
     */
    Map countSignedRecord(@Param("stuid") String stuId,
                          @Param("teachid") Integer teachId,
                          @Param("semester") String semester);

    /**
     * 根据学号和任课编码查询签到状态
     *
     * @param stuId          学生学号
     * @param schId          课表编号
     * @param weekofsemester 周数
     * @return
     */
    Record selectStatusByStuidAndSchidAndWeekofsemester(@Param("stuid") String stuId,
                                                        @Param("schid") Integer schId,
                                                        @Param("weekofsemester") String weekofsemester,
                                                        @Param("semester") String semester);

    /**
     * 清点出未签到的人数
     *
     * @param schId          课表编号
     * @param weekofsemester 周数
     * @return
     */
    List<String> counting(@Param("schid") Integer schId,
                          @Param("weekofsemester") String weekofsemester);

    /**
     * 插入未签到学生记录
     *
     * @param stuIds         学生学号集合
     * @param schId          课表编号
     * @param weekofsemester 周数
     * @return
     */
    int insertNotSigned(@Param("list") List stuIds,
                        @Param("schid") Integer schId,
                        @Param("weekofsemester") String weekofsemester,
                        @Param("semester") String semester);

    /**
     * 获取课堂签到记录
     *
     * @param schid          任课编号
     * @param weekofsemester 周数
     * @return
     */
    List getSignedRecords(@Param("schid") Integer schid,
                          @Param("week") String weekofsemester);

    /**
     * 统计学生签到记录
     *
     * @param stuId   学生学号
     * @param teachid 任课编号
     * @param teaid   教师编号
     * @return
     */
    Map countSignedRecords(@Param("stuid") String stuId,
                           @Param("teachid") Integer teachid,
                           @Param("teaid") String teaid);

    /**
     * 获取某学生签到详情
     *
     * @param teachid 任课编号
     * @param stuId   学生学号
     * @param teaid   教师编号
     * @return
     */
    List getStudentSignedDetails(@Param("teachid") Integer teachid,
                                 @Param("stuid") String stuId,
                                 @Param("teaid") String teaid);

    /**
     * 改签方法
     *
     * @param stuId  学生学号
     * @param schId  课表编号
     * @param week   周数
     * @param status 状态
     * @return
     */
    int signedStatusChange(@Param("stuid") String stuId,
                           @Param("schid") Integer schId,
                           @Param("week") String week,
                           @Param("status") String status);
}