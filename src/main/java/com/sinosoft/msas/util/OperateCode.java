package com.sinosoft.msas.util;

import java.util.HashMap;
import java.util.Map;


/**
 *@Title:
 *@Description:  prpmOperateLog表的OperateCode基础数据
 *@Author:YJX
 *@Since:2015-8-5 上午09:08:48
 *@Version:1.0.0
 *@Copyright (c) 中科软科技股份有限公司-版权所有
 */
 
public class OperateCode{
	/**
	 * OPERATECODE_MAP:存放code的map
	 */
	public  static final Map<String,String> OPERATECODE_MAP = new HashMap<String,String>();  
	/**************************和手机交互定义，  从M0001开始定义开始******************************/
	public static final String KEY_M0001 = "M0001";
	
	/**************************和手机交互定义，  从M0001开始定义结束******************************/
	
	/**************************和理赔交互定义，  从L0001开始定义开始******************************/
	public static final String KEY_L0001 = "L0001";
	
	/**************************和理赔交互定义，  从L0001开始定义结束******************************/
	
	/**************************在平台操作定义，  从P0001开始定义开始******************************/
	public static final String KEY_P0001 = "P0001";
	public static final String KEY_P0002 = "P0002";
	public static final String KEY_P0003 = "P0003";
	public static final String KEY_P0004 = "P0004";
	public static final String KEY_P0005 = "P0005";
	public static final String KEY_P0006 = "P0006";
	public static final String KEY_P0007 = "P0007";
	public static final String KEY_P0008 = "P0008";
	public static final String KEY_P0009 = "P0009";
	public static final String KEY_P0010 = "P0010";
	public static final String KEY_P0011 = "P0011";
	public static final String KEY_P0012 = "P0012";
	public static final String KEY_P0013 = "P0013";
	public static final String KEY_P0014 = "P0014";
	public static final String KEY_P0015 = "P0015";
	public static final String KEY_P0016 = "P0016";
	public static final String KEY_P0017 = "P0017";
	public static final String KEY_P0018 = "P0018";
	
	/**************************在平台操作定义，  从P0001开始定义结束******************************/
	static{
		//进行初始化
		OPERATECODE_MAP.put(KEY_M0001, "");
		OPERATECODE_MAP.put(KEY_L0001, "");
		OPERATECODE_MAP.put(KEY_P0001, "增加机构");
		OPERATECODE_MAP.put(KEY_P0002, "修改机构");
		OPERATECODE_MAP.put(KEY_P0003, "删除机构");
		OPERATECODE_MAP.put(KEY_P0004, "增加用户");
		OPERATECODE_MAP.put(KEY_P0005, "修改用户");
		OPERATECODE_MAP.put(KEY_P0006, "删除用户");
		OPERATECODE_MAP.put(KEY_P0007, "增加区域");
		OPERATECODE_MAP.put(KEY_P0008, "修改区域");
		OPERATECODE_MAP.put(KEY_P0009, "删除区域");
		OPERATECODE_MAP.put(KEY_P0010, "增加查勘员/修理厂");
		OPERATECODE_MAP.put(KEY_P0011, "修改查勘员/修理厂");
		OPERATECODE_MAP.put(KEY_P0012, "删除查勘员/修理厂");
		OPERATECODE_MAP.put(KEY_P0013, "增加用户和视频组件映射");
		OPERATECODE_MAP.put(KEY_P0014, "增加公司和视频组件映射");
		OPERATECODE_MAP.put(KEY_P0015, "删除用户和视频组件映射");
		OPERATECODE_MAP.put(KEY_P0016, "删除公司和视频组件映射");
		OPERATECODE_MAP.put(KEY_P0017, "修改公司和视频组件映射");
		OPERATECODE_MAP.put(KEY_P0018, "修改用户和视频组件映射");
	}
	
	/**
	 * @Description:通过key来获取定义的值
	 * @param key  map中的key
	 * @return 
	 * @ReturnType:String
	 * @exception 
	 * @Since:2015-8-5 上午09:14:25
	 * @Author:YJX
	*/
	public static String getValue(String key){
		return OPERATECODE_MAP.get(key);
	}
}
