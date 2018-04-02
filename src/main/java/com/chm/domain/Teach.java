package com.chm.domain;

public class Teach {
    private Integer teachid;

    private String teaid;

    private Integer couid;

    public Integer getTeachid() {
        return teachid;
    }

    public void setTeachid(Integer teachid) {
        this.teachid = teachid;
    }

    public String getTeaid() {
        return teaid;
    }

    public void setTeaid(String teaid) {
        this.teaid = teaid == null ? null : teaid.trim();
    }

    public Integer getCouid() {
        return couid;
    }

    public void setCouid(Integer couid) {
        this.couid = couid;
    }
}