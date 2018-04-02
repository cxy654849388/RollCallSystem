package com.chm.domain;

import java.util.Date;

public class Schedule {
    private Integer schid;

    private Integer roomid;

    private Integer teachid;

    private Date starttime;

    private Date endtime;

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

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }
}