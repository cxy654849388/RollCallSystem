package com.chm.mapper;

import com.chm.domain.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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
    List<Record> selectByStuId(@Param("stuid") String stuId);

    /**
     * 根据学号和任课编码查询签到状态
     *
     * @param stuId 学生学号
     * @param schId 课表编号
     * @return
     */
    String selectStatusByStuidAndSchid(@Param("stuid") String stuId, @Param("schid") Integer schId);
}