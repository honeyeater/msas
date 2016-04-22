package com.sinosoft.msas.domain;

import java.util.Date;

public class PrpMclass {
    private String classcode;

    private String oldclasscode;

    private String classcname;

    private String classscname;

    private String classtname;

    private String classename;

    private String classsename;

    private String creatorcode;

    private Date createtime;

    private String updatercode;

    private Date updatetime;

    private Date validdate;

    private Date invaliddate;

    private String auditflag;

    private String validind;

    private String tcol1;

    private String tcol2;

    private String tcol3;

    private String remark;

    private String flag;

    public String getClasscode() {
        return classcode;
    }

    public void setClasscode(String classcode) {
        this.classcode = classcode == null ? null : classcode.trim();
    }

    public String getOldclasscode() {
        return oldclasscode;
    }

    public void setOldclasscode(String oldclasscode) {
        this.oldclasscode = oldclasscode == null ? null : oldclasscode.trim();
    }

    public String getClasscname() {
        return classcname;
    }

    public void setClasscname(String classcname) {
        this.classcname = classcname == null ? null : classcname.trim();
    }

    public String getClassscname() {
        return classscname;
    }

    public void setClassscname(String classscname) {
        this.classscname = classscname == null ? null : classscname.trim();
    }

    public String getClasstname() {
        return classtname;
    }

    public void setClasstname(String classtname) {
        this.classtname = classtname == null ? null : classtname.trim();
    }

    public String getClassename() {
        return classename;
    }

    public void setClassename(String classename) {
        this.classename = classename == null ? null : classename.trim();
    }

    public String getClasssename() {
        return classsename;
    }

    public void setClasssename(String classsename) {
        this.classsename = classsename == null ? null : classsename.trim();
    }

    public String getCreatorcode() {
        return creatorcode;
    }

    public void setCreatorcode(String creatorcode) {
        this.creatorcode = creatorcode == null ? null : creatorcode.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getUpdatercode() {
        return updatercode;
    }

    public void setUpdatercode(String updatercode) {
        this.updatercode = updatercode == null ? null : updatercode.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Date getValiddate() {
        return validdate;
    }

    public void setValiddate(Date validdate) {
        this.validdate = validdate;
    }

    public Date getInvaliddate() {
        return invaliddate;
    }

    public void setInvaliddate(Date invaliddate) {
        this.invaliddate = invaliddate;
    }

    public String getAuditflag() {
        return auditflag;
    }

    public void setAuditflag(String auditflag) {
        this.auditflag = auditflag == null ? null : auditflag.trim();
    }

    public String getValidind() {
        return validind;
    }

    public void setValidind(String validind) {
        this.validind = validind == null ? null : validind.trim();
    }

    public String getTcol1() {
        return tcol1;
    }

    public void setTcol1(String tcol1) {
        this.tcol1 = tcol1 == null ? null : tcol1.trim();
    }

    public String getTcol2() {
        return tcol2;
    }

    public void setTcol2(String tcol2) {
        this.tcol2 = tcol2 == null ? null : tcol2.trim();
    }

    public String getTcol3() {
        return tcol3;
    }

    public void setTcol3(String tcol3) {
        this.tcol3 = tcol3 == null ? null : tcol3.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }
}