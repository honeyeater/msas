package com.sinosoft.msas.model.mobile;

/**
 * 机构信息
 */
public class CompanyDto {

	private int id;
	private String comcode;// 机构代码
	private String comCName;// 机构名称
	private String addressCName;// 地址
	private String upperComCode;// 上级机构代码
	private String comLevel;// 机构级别
	private String comType;// 机构类型
	private String createDate;// 创建时间
	private String validstatus;// 有效标志

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComcode() {
		return comcode;
	}

	public void setComcode(String comcode) {
		this.comcode = comcode;
	}

	public String getComCName() {
		return comCName;
	}

	public void setComCName(String comCName) {
		this.comCName = comCName;
	}

	public String getAddressCName() {
		return addressCName;
	}

	public void setAddressCName(String addressCName) {
		this.addressCName = addressCName;
	}

	public String getUpperComCode() {
		return upperComCode;
	}

	public void setUpperComCode(String upperComCode) {
		this.upperComCode = upperComCode;
	}

	public String getComLevel() {
		return comLevel;
	}

	public void setComLevel(String comLevel) {
		this.comLevel = comLevel;
	}

	public String getComType() {
		return comType;
	}

	public void setComType(String comType) {
		this.comType = comType;
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
