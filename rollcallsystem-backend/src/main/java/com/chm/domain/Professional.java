package com.chm.domain;

import java.util.List;

public class Professional {
    private String proid;

    private String acaid;

    private String proname;

    private List<Class> classes;

    public String getProid() {
        return proid;
    }

    public void setProid(String proid) {
        this.proid = proid == null ? null : proid.trim();
    }

    public String getAcaid() {
        return acaid;
    }

    public void setAcaid(String acaid) {
        this.acaid = acaid == null ? null : acaid.trim();
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname == null ? null : proname.trim();
    }

    public List<Class> getClasses() {
        return classes;
    }

    public void setClasses(List<Class> classes) {
        this.classes = classes;
    }
}