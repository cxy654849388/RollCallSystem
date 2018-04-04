package com.chm.domain;

import java.time.LocalTime;

public class Schedule {
    private Integer schid;

    private Integer roomid;

    private Integer teachid;

    private LocalTime starttime;

    private LocalTime endtime;

    private String weekofsemester;

    private Integer dayofweek;

    public Integer getSchid() {
        return schid;
    }

    public void setSchid(Integer schid) {
        this.schid = schid;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getTeachid() {
        return teachid;
    }

    public void setTeachid(Integer teachid) {
        this.teachid = teachid;
    }

    public LocalTime getStarttime() {
        return starttime;
    }

    public void setStarttime(LocalTime starttime) {
        this.starttime = starttime;
    }

    public LocalTime getEndtime() {
        return endtime;
    }

    public void setEndtime(LocalTime endtime) {
        this.endtime = endtime;
    }

    public String getWeekofsemester() {
        return weekofsemester;
    }

    public void setWeekofsemester(String weekofsemester) {
        this.weekofsemester = weekofsemester;
    }

    public Integer getDayofweek() {
        return dayofweek;
    }

    public void setDayofweek(Integer dayofweek) {
        this.dayofweek = dayofweek;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "schid=" + schid +
                ", roomid=" + roomid +
                ", teachid=" + teachid +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                ", weekofsemester=" + weekofsemester +
                ", dayofweek=" + dayofweek +
                '}';
    }
}