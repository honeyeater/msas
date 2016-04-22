package com.sinosoft.msas.model.mobile;

/**
 * 用户信息
 */
public class LoginUserDto {
	
	private String usercode;//用户工号

	private String password;//用户密码

	private String comcode;//用户归属机构

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getComcode() {
		return comcode;
	}

	public void setComcode(String comcode) {
		this.comcode = comcode;
	}
	
}
