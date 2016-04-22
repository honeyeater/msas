package com.sinosoft.msas.util;

import java.security.MessageDigest;

import javax.crypto.Cipher;

import org.apache.commons.codec.binary.Base64;

/**
 * 密码工具类
 */
public class CipherUtil {

	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	/**
	 * 加密密码（MD5）
	 */
	public static String generatePassword(String inputString) {
		return encodeByMD5(inputString);
	}
	
	/**
	 * 加密密码（MD5）
	 */
	public static String getMD5ofStr(String inputString) {
		return encodeByMD5(inputString);
	}

	/**
	 * MD5加密
	 * 
	 * @param 明文
	 * @return 密文
	 */
	private static String encodeByMD5(String originString) {
		if (originString != null) {
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] results = md.digest(originString.getBytes());
				String resultString = byteArrayToHexString(results);
				return resultString.toLowerCase();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 转换为二进制数组
	 */
	private static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}

	/**
	 * 转换为字符串
	 */
	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	/**
	 * base64解码
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static byte[] decryptBase64(String key) throws Exception {
		return Base64.decodeBase64(key);
	}

	/**
	 * base64编码
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static String encryptBase64(byte[] key) throws Exception {
		return Base64.encodeBase64String(key);
	}

	/**
	 * sha加密
	 * @param data
	 * @return
	 * @throws Exception
	 */
	public static byte[] encryptSHA(byte[] data)throws Exception{
		MessageDigest sha = MessageDigest.getInstance("SHA");
		sha.update(data);
		return sha.digest();
	}
	
	/**
	 * 测试
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		String pwd1 = "0000";
		String pwd2 = "";
		CipherUtil cipher = new CipherUtil();
		System.out.println("加密前" + pwd1);

		pwd2 = cipher.generatePassword(pwd1);
		System.out.println("加密后" + pwd2);

		System.out.print("验证:");
	}
}