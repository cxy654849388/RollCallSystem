package com.chm.domain;

public class FaceData {
    private Integer faceid;

    private String stuid;

    private String facedate;

    public Integer getFaceid() {
        return faceid;
    }

    public void setFaceid(Integer faceid) {
        this.faceid = faceid;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid == null ? null : stuid.trim();
    }

    public String getFacedate() {
        return facedate;
    }

    public void setFacedate(String facedate) {
        this.facedate = facedate;
    }
}