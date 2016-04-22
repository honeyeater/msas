package com.sinosoft.msas.model.mobile;

/**
 * 整体统计信息
 */
public class OutLineDto {
	private int id;
	private String premiumTotal;// 保费收入
	private String payTotal;// 赔付支出
	private String lossRatio;// 综合赔付率
	private String expenseRatio;// 综合费用率
	private String costRatio;// 综合成本率

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
