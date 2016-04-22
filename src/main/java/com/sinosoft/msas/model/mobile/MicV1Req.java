package com.sinosoft.msas.model.mobile;

/**
 * 移动端请求信息
 */
public class MicV1Req {
	private String reqmsg;
	private String timestamp;
	private String sign;
	private String key;
	private String userid;
	private String errorCode;
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getReqmsg() {
		return reqmsg;
	}

	public void setReqmsg(String reqmsg) {
		this.reqmsg = reqmsg;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
