package com.sinosoft.msas.model.mobile;

/**
 * 机构统计信息
 *
 */
public class ComcodeResDto {

	private String comcode;// 机构代码
	private String comCName;// 机构名称
	private String riskCode;// 险种代码
	private String riskCName;// 险种名称
	private String caseCount;// 案件数量
	private String premiumTotal;// 保费收入
	private String payTotal;// 赔付支出
	private String lossRatio;// 综合赔付率
	private String expenseRatio;// 综合费用率
	private String costRatio;// 综合成本率

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

	public String getCaseCount() {
		return caseCount;
	}

	public void setCaseCount(String caseCount) {
		this.caseCount = caseCount;
	}

	public String getPremiumTotal() {
		return premiumTotal;
	}

	public void setPremiumTotal(String premiumTotal) {
		this.premiumTotal = premiumTotal;
	}

	public String getPayTotal() {
		return payTotal;
	}

	public void setPayTotal(String payTotal) {
		this.payTotal = payTotal;
	}

	public String getLossRatio() {
		return lossRatio;
	}

	public void setLossRatio(String lossRatio) {
		this.lossRatio = lossRatio;
	}

	public String getExpenseRatio() {
		return expenseRatio;
	}

	public void setExpenseRatio(String expenseRatio) {
		this.expenseRatio = expenseRatio;
	}

	public String getCostRatio() {
		return costRatio;
	}

	public void setCostRatio(String costRatio) {
		this.costRatio = costRatio;
	}

}
