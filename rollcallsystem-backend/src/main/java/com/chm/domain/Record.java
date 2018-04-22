package com.chm.domain;

import java.time.LocalTime;

public class Record {
    private Integer recid;

    private Integer schid;

    private String stuid;

    private String status;

    private String weekofsemester;

    private LocalTime signedtime;

    private String semester;

    public Integer getRecid() {
        return recid;
    }

    public void setRecid(Integer recid) {
        this.recid = recid;
    }

    public Integer getSchid() {
        return schid;
    }

    public void setSchid(Integer schid) {
        this.schid = schid;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid == null ? null : stuid.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getWeekofsemester() {
        return weekofsemester;
    }

    public void setWeekofsemester(String weekofsemester) {
        this.weekofsemester = weekofsemester;
    }

    public LocalTime getSignedtime() {
        return signedtime;
    }

    public void setSignedtime(LocalTime signedtime) {
        this.signedtime = signedtime;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester == null ? null : semester.trim();
    }
}