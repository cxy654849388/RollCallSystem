package com.chm.domain;

public class Record {
    private Integer recid;

    private Integer schid;

    private String stuid;

    private String status;

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

    @Override
    public String toString() {
        return "Record{" +
                "recid=" + recid +
                ", schid=" + schid +
                ", stuid='" + stuid + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}