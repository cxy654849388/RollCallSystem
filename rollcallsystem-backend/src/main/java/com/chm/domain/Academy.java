package com.chm.domain;

import java.util.List;

public class Academy {
    private String acaid;

    private String acaname;

    private List<Professional> professionals;

    public String getAcaid() {
        return acaid;
    }

    public void setAcaid(String acaid) {
        this.acaid = acaid == null ? null : acaid.trim();
    }

    public String getAcaname() {
        return acaname;
    }

    public void setAcaname(String acaname) {
        this.acaname = acaname == null ? null : acaname.trim();
    }

    public List<Professional> getProfessionals() {
        return professionals;
    }

    public void setProfessionals(List<Professional> professionals) {
        this.professionals = professionals;
    }
}