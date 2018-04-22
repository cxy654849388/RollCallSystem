package com.chm.mapper;

import com.chm.domain.Record;
import org.apache.ibatis.annotations.Param;

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
     * 查询学生签到记录
     *
     * @param stuId 学生学号
     * @return
     */
    List findSignedRecords(@Param("stuid") String stuId,
                           @Param("schid") Integer schId,
                           @Param("startWeek") Integer startWeek,
                           @Param("endWeek") Integer endWeek,
                           @Param("semester") String semester);

    List countSignedRecord(@Param("stuid") String stuId,
                          @Param("schid") Integer schId,
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

}