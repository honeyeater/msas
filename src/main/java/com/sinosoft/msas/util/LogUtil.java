package com.sinosoft.msas.util;

import org.apache.log4j.Logger;

/**
 * @Description: 日志输出类
 */

public class LogUtil {
	public static final String MOBILELOG = "mobileLog"; // 与手机交互的日志输出
	public static final String CLAIMLOG = "claimLog"; // 与理赔机交互的日志输出
	public static final String VIDEOLOG = "videoLog"; // 与视频交互的日志输出
	public static final String OSSLOG = "ossLog"; // 与oss交互的日志输出
	public static final String GETUILOG = "getuiLog"; // 个推发送信息的日志输出
	public static final String TIMETASKLOG = "timetaskLog"; // 个推发送信息的日志输出
	public static final Logger MOBILE_LOGGER = Logger.getLogger(MOBILELOG);
	public static final Logger CLAIM_LOGGER = Logger.getLogger(CLAIMLOG);
	public static final Logger VIDEO_LOGGER = Logger.getLogger(VIDEOLOG);
	public static final Logger OSS_LOGGER = Logger.getLogger(OSSLOG);
	public static final Logger GETUI_LOGGER = Logger.getLogger(GETUILOG);
	public static final Logger TIMETASK_LOGGER = Logger.getLogger(TIMETASKLOG);
	public static final Logger CONSOLE_LOGGER = Logger.getLogger(LogUtil.class);

	/**
	 * @Description: 这个方法只用于记录平台和手机交互报文，其他信息不输入到此日志
	 * @param strMessage
	 *            日志信息
	 */
	public static final void printMobileLog(String logTitle, String strMessage) {

		MOBILE_LOGGER.debug(logTitle + ":" + strMessage);
	}

	/**
	 * @Description: 这个方法只用于记录平台和核心交互报文，其他信息不输入到此日志
	 * @param strMessage
	 *            日志信息
	 */
	public static final void printClaimLog(String strMessage) {
		CLAIM_LOGGER.debug(strMessage);
	}

	/**
	 * @Description: 输出日志信息到控制台
	 * @param strMessage
	 *            日志信息
	 */
	public static final void printConsoleLog(String strMessage) {
		CONSOLE_LOGGER.info(strMessage);
	}

	/**
	 * @Description: 与OSS交互的日志输出
	 * @param strMessage
	 */
	public static final void printOSSLog(String strMessage) {
		OSS_LOGGER.debug(strMessage);
	}

	/**
	 * @Description: 与个推日志输出
	 * @param strMessage
	 */
	public static final void printGetuiLog(String strMessage) {
		GETUI_LOGGER.debug(strMessage);
	}

	/**
	 * @Description: 视频交互输出日志
	 * @param strMessage
	 *            日志信息
	 */
	public static final void printVideoLog(String strMessage) {
		VIDEO_LOGGER.debug(strMessage);
	}

	/**
	 * @Description: 定时任务日志输出
	 * @param strMessage
	 * @ReturnType:void
	 * @exception
	 * @Since:2015-12-3 上午10:36:34
	 * @Author:YJX
	 */
	public static final void printTimeTaskLog(String strMessage) {
		TIMETASK_LOGGER.debug(strMessage);
	}
}
