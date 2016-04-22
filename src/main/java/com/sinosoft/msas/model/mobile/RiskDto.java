package com.sinosoft.msas.model.mobile;

/**
 * 险种信息
 * 
 */
public class RiskDto {

	private int id;

	private String riskCode;// 险种代码

	private String riskCName;// 险种名称

	private String classCode;// 险类代码

	private String createDate;// 创建时间

	private String validstatus;// 有效标志

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRiskCode() {
		return riskCode;
	}

	public void setRiskCode(String riskCode) {
		this.riskCode = riskCode;
	}

	public String getRiskCName() {
		return riskCName;
	}

	public void setRiskCName(String riskCName) {
		this.riskCName = riskCName;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getValidstatus() {
		return validstatus;
	}

	public void setValidstatus(String validstatus) {
		this.validstatus = validstatus;
	}

}
