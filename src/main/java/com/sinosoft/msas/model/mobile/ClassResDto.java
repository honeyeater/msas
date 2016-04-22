package com.sinosoft.msas.model.mobile;

/**
 * 险类占比信息
 */
public class ClassResDto {
	private String classCode;// 险类代码
	private String classCName;// 险类名称
	private String percent;// 占比

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getClassCName() {
		return classCName;
	}

	public void setClassCName(String classCName) {
		this.classCName = classCName;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

}
