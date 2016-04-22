package com.sinosoft.msas.domain;

public class PrpMcode {
    private String codetype;

    private String codecode;

    private String codecname;

    private String codeename;

    private String newcodetype;

    private String newcodecode;

    private String validstatus;

    private String flag;

    public String getCodetype() {
        return codetype;
    }

    public void setCodetype(String codetype) {
        this.codetype = codetype == null ? null : codetype.trim();
    }

    public String getCodecode() {
        return codecode;
    }

    public void setCodecode(String codecode) {
        this.codecode = codecode == null ? null : codecode.trim();
    }

    public String getCodecname() {
        return codecname;
    }

    public void setCodecname(String codecname) {
        this.codecname = codecname == null ? null : codecname.trim();
    }

    public String getCodeename() {
        return codeename;
    }

    public void setCodeename(String codeename) {
        this.codeename = codeename == null ? null : codeename.trim();
    }

    public String getNewcodetype() {
        return newcodetype;
    }

    public void setNewcodetype(String newcodetype) {
        this.newcodetype = newcodetype == null ? null : newcodetype.trim();
    }

    public String getNewcodecode() {
        return newcodecode;
    }

    public void setNewcodecode(String newcodecode) {
        this.newcodecode = newcodecode == null ? null : newcodecode.trim();
    }

    public String getValidstatus() {
        return validstatus;
    }

    public void setValidstatus(String validstatus) {
        this.validstatus = validstatus == null ? null : validstatus.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }
}