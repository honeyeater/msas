package com.sinosoft.msas.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sinosoft.msas.util.SysConst;

/**
 * @Title:
 * @Description: 自启动servlet，加载一些配置文件用的
 * @Since:2015-8-5 下午05:41:43
 * @Version:1.0.0
 * @Copyright (c) 中科软科技股份有限公司-版权所有
 */

public class MPlatSysInit extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) {
		try {
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void init() {
		String configPath = getServletContext().getRealPath("/");
		
		String sysConstConfig = configPath
				+ "/WEB-INF/conf/SysConstConfig.xml";
		System.out.println("sysConstConfig:" + sysConstConfig);
		try {
			if (SysConst.isInited() == false) {
				SysConst.init(sysConstConfig, false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
