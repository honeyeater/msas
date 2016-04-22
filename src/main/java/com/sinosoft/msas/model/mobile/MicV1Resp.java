package com.sinosoft.msas.model.mobile;

/**
 * 移动端响应信息
 */
public class MicV1Resp {

	private String code;
	private String message;
	private String messageext;
	private String responsetime;
	private String data;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessageext() {
		return messageext;
	}

	public void setMessageext(String messageext) {
		this.messageext = messageext;
	}

	public String getResponsetime() {
		return responsetime;
	}

	public void setResponsetime(String responsetime) {
		this.responsetime = responsetime;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}
}
