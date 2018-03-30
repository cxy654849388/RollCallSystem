package com.chm.domain;

public class FaceData {
    private Integer faceid;

    private String stuid;

    private byte[] facedate;

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

    public byte[] getFacedate() {
        return facedate;
    }

    public void setFacedate(byte[] facedate) {
        this.facedate = facedate;
    }
}