package com.chm.mapper;

import com.chm.domain.Schedule;
import org.apache.ibatis.annotations.Param;

import java.time.LocalTime;


public interface ScheduleMapper {
    int deleteByPrimaryKey(Integer schid);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(Integer schid);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);

    Schedule selectByRoomidAndWeek(@Param("roomid") Integer roomid, @Param("weekofsemester") String weekofsemester);

}