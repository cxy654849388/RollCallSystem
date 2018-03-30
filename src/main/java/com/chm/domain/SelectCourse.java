package com.chm.domain;

public class SelectCourse {
    private Integer selectid;

    private String stuid;

    private Integer couid;

    private Double result;

    public Integer getSelectid() {
        return selectid;
    }

    public void setSelectid(Integer selectid) {
        this.selectid = selectid;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid == null ? null : stuid.trim();
    }

    public Integer getCouid() {
        return couid;
    }

    public void setCouid(Integer couid) {
        this.couid = couid;
    }

    public Double getResult() {
        return result;
    }

    public void setResult(Double result) {
        this.result = result;
    }
}