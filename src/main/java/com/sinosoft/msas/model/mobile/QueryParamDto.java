package com.sinosoft.msas.model.mobile;

import java.util.List;

/**
 * 查询参数信息
 */
public class QueryParamDto {
	private String usercode;// 用户工号
	private String userComcode;// 用户归属机构
	private String startDate;// 统计开始时间
	private String endDate;// 统计结束时间
	private List<RiskDto> riskDtoList;//统计险种信息
	private List<CompanyDto> companyDtoList;//统计机构信息

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getUserComcode() {
		return userComcode;
	}

	public void setUserComcode(String userComcode) {
		this.userComcode = userComcode;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<RiskDto> getRiskDtoList() {
		return riskDtoList;
	}

	public void setRiskDtoList(List<RiskDto> riskDtoList) {
		this.riskDtoList = riskDtoList;
	}

	public List<CompanyDto> getCompanyDtoList() {
		return companyDtoList;
	}

	public void setCompanyDtoList(List<CompanyDto> companyDtoList) {
		this.companyDtoList = companyDtoList;
	}

}
