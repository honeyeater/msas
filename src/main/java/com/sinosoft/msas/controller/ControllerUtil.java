package com.sinosoft.msas.controller;

import javax.servlet.http.HttpServletRequest;

import com.sinosoft.msas.model.mobile.MicV1Req;
import com.sinosoft.msas.util.Base64Utils;
import com.sinosoft.msas.util.CipherUtil;
import com.sinosoft.msas.util.DESUtil;
import com.sinosoft.msas.util.RSAUtil;

/**
 * 控制器基础工具
 */
public class ControllerUtil {

	public static MicV1Req paramToReq(HttpServletRequest request) throws Exception {
		MicV1Req micV1Req = new MicV1Req();
		String reqmsg = request.getParameter("reqmsg");
		String timestamp = request.getParameter("timestamp");
		String sign = request.getParameter("sign");
		String key = request.getParameter("key");
		String userid = request.getParameter("userid");
		
		micV1Req.setReqmsg(reqmsg);
		micV1Req.setTimestamp(timestamp);
		micV1Req.setUserid(userid);
		micV1Req.setSign(sign);
		micV1Req.setKey(key);
		
		// 验证签名
		boolean isVerify = verify(sign, reqmsg, timestamp, userid);
		// -1不通过错误码
		if(!isVerify) {
			micV1Req.setErrorCode("-1");
			return micV1Req;
		}
		if(key == null || "".equals(key)) {
			micV1Req.setErrorCode("-2");
			return micV1Req;
		}
		String reqmsgPlain = "";
		if(reqmsg != null && !"".equals(reqmsg)) {
			// 密文转换为明文
			reqmsgPlain = cipherToPlain(key, reqmsg);
		}
		micV1Req.setReqmsg(reqmsgPlain);
		micV1Req.setErrorCode("0");
		return micV1Req;
	}

	/**
	 * 验证签名是否合法
	 * @param sign
	 * @param reqmsg
	 * @param userid
	 * @return
	 */
	public static boolean verify(String sign, String reqmsg, String timestamp, String userid) {
		return sign !=null && !"".equals(sign) && 
				CipherUtil.getMD5ofStr(reqmsg + timestamp + userid).equals(sign);
	}

	/**
	 * 密文转换为明文
	 * @param key
	 * @param reqmsg
	 * @return
	 * @throws Exception 
	 */
	public static String cipherToPlain(String key, String reqmsg) throws Exception {
		String desKey = new String(RSAUtil.decryptByPrivateKey(key.getBytes()));
		byte[] plainBytes = DESUtil.decrypt(Base64Utils.decode(reqmsg), key.getBytes());
		return new String(plainBytes);
	}
	
}
