package com.sinosoft.msas.model.mobile;

import java.util.List;

public class BasicdataDto {
	private List<CompanyDto> companyDtoList;// 机构集合
	private List<ClassDto> classDtoList;// 险类集合
	private List<RiskDto> riskDtoList;// 险种集合

	public List<CompanyDto> getCompanyDtoList() {
		return companyDtoList;
	}

	public void setCompanyDtoList(List<CompanyDto> companyDtoList) {
		this.companyDtoList = companyDtoList;
	}

	public List<ClassDto> getClassDtoList() {
		return classDtoList;
	}

	public void setClassDtoList(List<ClassDto> classDtoList) {
		this.classDtoList = classDtoList;
	}

	public List<RiskDto> getRiskDtoList() {
		return riskDtoList;
	}

	public void setRiskDtoList(List<RiskDto> riskDtoList) {
		this.riskDtoList = riskDtoList;
	}

}
