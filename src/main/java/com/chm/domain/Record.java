package com.chm.domain;

public class Record {
    private Integer recid;

    private Integer teachid;

    private String stuid;

    private String status;

    public Integer getRecid() {
        return recid;
    }

    public void setRecid(Integer recid) {
        this.recid = recid;
    }

    public Integer getTeachid() {
        return teachid;
    }

    public void setTeachid(Integer teachid) {
        this.teachid = teachid;
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

    @Override
    public String toString() {
        return "Record{" +
                "recid=" + recid +
                ", teachid=" + teachid +
                ", stuid='" + stuid + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}