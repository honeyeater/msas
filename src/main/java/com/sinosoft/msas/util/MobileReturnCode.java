package com.sinosoft.msas.util;

import java.util.HashMap;
import java.util.Map;

import com.sinosoft.msas.model.mobile.MicV1Resp;

/**
 *@Title:
 *@Description: 手机和平台进行交互，平台返回给手机的信息编码类
 */
 
public class MobileReturnCode {
	
	//成功标识
	public final static String SUCCESS = "1";
	//失败标识
	public final static String FAIL = "0";

	//结果标识MAP
	public  static final Map<String,String> RESULTFLAG_MAP = new HashMap<String,String>();  
	static{
		//进行初始化
		RESULTFLAG_MAP.put(SUCCESS, "成功");
		RESULTFLAG_MAP.put(FAIL, "失败");
	}
	
	//返回值MAP
	public  static final Map<String,String> RETURNCODE_MAP = new HashMap<String,String>();  
	public static final String KEY_MOBILE_00001 = "000001";
	public static final String KEY_MOBILE_00002 = "000002";
	public static final String KEY_MOBILE_00003 = "000003";
	public static final String KEY_MOBILE_00004 = "000004";
	public static final String KEY_MOBILE_00005 = "000005";
	public static final String KEY_MOBILE_00006 = "000006";
	public static final String KEY_MOBILE_00007 = "000007";
	public static final String KEY_MOBILE_00008 = "000008";
	public static final String KEY_MOBILE_00009 = "000009";
	public static final String KEY_MOBILE_00010 = "000010";
	public static final String KEY_MOBILE_00011 = "000011";
	public static final String KEY_MOBILE_00012 = "000012";
	public static final String KEY_MOBILE_00013 = "000013";
	public static final String KEY_MOBILE_00014 = "000014";
	public static final String KEY_MOBILE_00015 = "000015";
	public static final String KEY_MOBILE_00016 = "000016";
	public static final String KEY_MOBILE_00017 = "000017";
	public static final String KEY_MOBILE_00018 = "000018";
	public static final String KEY_MOBILE_00019 = "000019";
	public static final String KEY_MOBILE_00020 = "000020";
	public static final String KEY_MOBILE_00021 = "000021";
	public static final String KEY_MOBILE_00022 = "000022";
	public static final String KEY_MOBILE_00023 = "000023";
	public static final String KEY_MOBILE_00024 = "000024";
	public static final String KEY_MOBILE_00025 = "000025";
	public static final String KEY_MOBILE_00026 = "000026";
	public static final String KEY_MOBILE_00027 = "000027";
	public static final String KEY_MOBILE_00028 = "000028";
	public static final String KEY_MOBILE_00029 = "000029";
	public static final String KEY_MOBILE_00030 = "000030";
	public static final String KEY_MOBILE_00031 = "000031";
	public static final String KEY_MOBILE_00032 = "000032";
	public static final String KEY_MOBILE_00033 = "000033";
	public static final String KEY_MOBILE_00034 = "000034";
	static{
		//进行初始化
		RETURNCODE_MAP.put(KEY_MOBILE_00001, "用户名或密码为空");
		RETURNCODE_MAP.put(KEY_MOBILE_00002, "用户名或密码错误，请核对");
		RETURNCODE_MAP.put(KEY_MOBILE_00003, "用户不存在");
		RETURNCODE_MAP.put(KEY_MOBILE_00004, "密码不正确");
		RETURNCODE_MAP.put(KEY_MOBILE_00005, "该用户无效");
		RETURNCODE_MAP.put(KEY_MOBILE_00006, "签名验证错误，请核对");
		RETURNCODE_MAP.put(KEY_MOBILE_00007, "登陆失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00008, "请求参数为空");
		RETURNCODE_MAP.put(KEY_MOBILE_00009, "申请改派失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00010, "上传图片没有数据");
		RETURNCODE_MAP.put(KEY_MOBILE_00011, "请求理赔失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00012, "案件正在处理中，请稍候！");
		RETURNCODE_MAP.put(KEY_MOBILE_00013, "获取最新版本失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00014, "当前为最新版本");
		RETURNCODE_MAP.put(KEY_MOBILE_00015, "有新版本");
		RETURNCODE_MAP.put(KEY_MOBILE_00016, "没有案件");
		RETURNCODE_MAP.put(KEY_MOBILE_00017, "案件转人工失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00018, "手机号为空");
		RETURNCODE_MAP.put(KEY_MOBILE_00019, "与理赔交互失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00020, "更新确认状态失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00021, "查询定损单状态失败");
		RETURNCODE_MAP.put(KEY_MOBILE_00022, "没有该变量");
		RETURNCODE_MAP.put(KEY_MOBILE_00023, "查勘完成异常");
		RETURNCODE_MAP.put(KEY_MOBILE_00024, "当前用户已在其他设备登陆！");
		RETURNCODE_MAP.put(KEY_MOBILE_00025, "没有对应的公司！");
		RETURNCODE_MAP.put(KEY_MOBILE_00026, "获取案件排队数和预测时长失败！");
		RETURNCODE_MAP.put(KEY_MOBILE_00027, "没有该案件！");
		RETURNCODE_MAP.put(KEY_MOBILE_00028, "获取案件状态失败！");
		RETURNCODE_MAP.put(KEY_MOBILE_00029, "没有需要处理的案件！");
		RETURNCODE_MAP.put(KEY_MOBILE_00030, "获取案件排队情况接口失败！");
		RETURNCODE_MAP.put(KEY_MOBILE_00031, "手机注册解绑失败！");
		RETURNCODE_MAP.put(KEY_MOBILE_00032, "操作标识错误！");
		RETURNCODE_MAP.put(KEY_MOBILE_00033, "信息列表为空！");
		RETURNCODE_MAP.put(KEY_MOBILE_00034, "未知异常");
	}
	
	/**
	 * @Description:通过返回代码封装返回给手机端的信息
	 * @param rmg
	 * @param strSuccessFlag   SUCCESSFLAG_MAP 中的key
	 * @param strErrorCode   RETURNCODE_MAP 中的key
	*/
	public static void setReturnMsg(MicV1Resp rmg, String resultFlag, String strMsgCode){
		rmg.setCode(resultFlag);
		rmg.setMessage(RESULTFLAG_MAP.get(resultFlag));
		rmg.setMessageext(RETURNCODE_MAP.get(strMsgCode));
	}
	
}
