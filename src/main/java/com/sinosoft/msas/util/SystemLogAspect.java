package com.sinosoft.msas.util;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.sinosoft.msas.controller.ControllerUtil;
import com.sinosoft.msas.domain.PrpMoperatelog;
import com.sinosoft.msas.service.LoggerService;

/**
 * 切面
 */
@Aspect
@Component
public class SystemLogAspect {

	@Resource
	private LoggerService loggerService;

	// 本地异常日志记录对象
	private static final Logger logger = Logger
			.getLogger(SystemLogAspect.class);

	// service层切入点
	@Pointcut("@annotation(com.sinosoft.msas.util.SystemServiceLog)")
	public void serviceAspect() {

	}

	// controller层切入点
	@Pointcut("@annotation(com.sinosoft.msas.util.SystemControllerLog)")
	public void controllerAspect() {

	}

	/**
	 * 前置通知 用于拦截Controller层记录日志的操作
	 */
	@Before("controllerAspect()")
	public void doBefor(JoinPoint joinPoint) {
		System.out.println("====前置通知开始====");
		try {
			String targetName = joinPoint.getTarget().getClass().getName();
			String methodName = joinPoint.getSignature().getName();
			Object[] args = joinPoint.getArgs();
			String userid = "";
			String sign = "";
			String reqmsg = "";
			String timestamp = "";
			String key = "";
			String desc = getControllerMethodDescription(joinPoint);
			String uuid = UUID.randomUUID().toString();
			Date now = new Date();
			if (args != null && args.length > 0) {
				for (Object arg : args) {
					// 参数为HttpServletRequest
					if (arg.getClass().getName()
							.equals(HttpServletRequest.class.getName())) {
						reqmsg = ((HttpServletRequest) arg)
								.getParameter("reqmsg");
						timestamp = ((HttpServletRequest) arg)
								.getParameter("timestamp");
						sign = ((HttpServletRequest) arg).getParameter("sign");
						key = ((HttpServletRequest) arg).getParameter("key");
						userid = ((HttpServletRequest) arg)
								.getParameter("userid");
					}
				}
			}

			PrpMoperatelog operateLog = new PrpMoperatelog();
			operateLog.setUuid(uuid);
			operateLog.setOperatedate(now);
			operateLog.setOperatetime(now);
			operateLog.setUsercode(userid);
			operateLog.setUsername("");
			operateLog.setSerialno(new Long(1));
			operateLog.setOperatetype("1");
			operateLog.setApplicationno(desc);
			operateLog.setLogmsg("");
			operateLog.setRemark(key);
			operateLog.setSignatureid(sign);
			operateLog.setMethodname(methodName);
			operateLog.setClsname(targetName);
			operateLog.setLogtype("1");

			loggerService.addLog(operateLog);

			StringBuffer logTitle = new StringBuffer();
			logTitle.append(DateUtil.formatDate(now) + ":"); // 时间
			logTitle.append(uuid + ":"); // uuid
			logTitle.append(methodName + ":"); // 方法
			logTitle.append("请求值"); // 方法
			String strMessage = "";
			try {
				strMessage = ControllerUtil.cipherToPlain(key, reqmsg);
			} catch (Exception e) {
				e.printStackTrace();
			} // 入参信息

			LogUtil.printMobileLog(logTitle.toString(), strMessage);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println("====前置通知结束====");
	}

	/**
	 * 后置通知 用于拦截Controller层记录日志的操作
	 */
	@Around("controllerAspect()")
	public void doAfter(ProceedingJoinPoint joinPoint) {
		System.out.println("====后置通知开始====");
		try {
			String targetName = joinPoint.getTarget().getClass().getName();
			String methodName = joinPoint.getSignature().getName();
			Object[] args = joinPoint.getArgs();
			
			String userid = "";
			String sign = "";
			String key = "";
			String desc = getControllerMethodDescription(joinPoint);
			String uuid = UUID.randomUUID().toString();
			Date now = new Date();
			if (args != null && args.length > 0) {
				for (Object arg : args) {
					// 参数为HttpServletRequest
					if (arg.getClass().getName()
							.equals(HttpServletRequest.class.getName())) {
						sign = ((HttpServletRequest) arg).getParameter("sign");
						key = ((HttpServletRequest) arg).getParameter("key");
						userid = ((HttpServletRequest) arg)
								.getParameter("userid");
					}
				}
			}

			PrpMoperatelog operateLog = new PrpMoperatelog();
			operateLog.setUuid(uuid);
			operateLog.setOperatedate(now);
			operateLog.setOperatetime(now);
			operateLog.setUsercode(userid);
			operateLog.setUsername("");
			operateLog.setSerialno(new Long(1));
			operateLog.setOperatetype("1");
			operateLog.setApplicationno(desc);
			operateLog.setLogmsg("");
			operateLog.setRemark(key);
			operateLog.setSignatureid(sign);
			operateLog.setMethodname(methodName);
			operateLog.setClsname(targetName);
			operateLog.setLogtype("0");

			loggerService.addLog(operateLog);

			StringBuffer logTitle = new StringBuffer();
			logTitle.append(DateUtil.formatDate(now) + ":"); // 时间
			logTitle.append(uuid + ":"); // uuid
			logTitle.append(methodName + ":"); // 方法
			logTitle.append("返回值"); // 方法
			Object retVal = joinPoint.proceed();
			String strMessage = "";
			if(retVal != null) {
				strMessage = retVal.toString();
			}

			LogUtil.printMobileLog(logTitle.toString(), strMessage);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("====后置通知结束====");
	}

	/**
	 * 异常通知 用于拦截service层记录异常日志
	 */
	@AfterThrowing(pointcut = "serviceAspect()", throwing = "e")
	public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
		System.out.println("=====异常通知开始=====");
		try {
			String targetName = joinPoint.getTarget().getClass().getName();
			String methodName = joinPoint.getSignature().getName();
			Object[] args = joinPoint.getArgs();
			String userid = "";
			String sign = "";
			String key = "";
			String desc = getControllerMethodDescription(joinPoint);
			String uuid = UUID.randomUUID().toString();
			Date now = new Date();
			String params = "";
			if (args != null && args.length > 0) {
				for (Object arg : args) {
					params += JSON.toJSONString(arg) + ";";
				}
			}
			String errorName = e.getClass().getName();
			String errorMessage = e.getMessage();
	            
			PrpMoperatelog operateLog = new PrpMoperatelog();
			operateLog.setUuid(uuid);
			operateLog.setOperatedate(now);
			operateLog.setOperatetime(now);
			operateLog.setUsercode(userid);
			operateLog.setUsername("");
			operateLog.setSerialno(new Long(1));
			operateLog.setOperatetype("0");
			operateLog.setApplicationno(desc);
			operateLog.setLogmsg("");
			operateLog.setRemark(key);
			operateLog.setSignatureid(sign);
			operateLog.setMethodname(methodName);
			operateLog.setClsname(targetName);
			operateLog.setLogtype("2");
			
			if(errorMessage != null && !"".equals(errorMessage)) {
				operateLog.setLogmsg(errorMessage.substring(0, 1000));
			}
			
			loggerService.addLog(operateLog);

			StringBuffer logTitle = new StringBuffer();
			logTitle.append(DateUtil.formatDate(now) + ":"); // 时间
			logTitle.append(uuid + ":"); // uuid
			logTitle.append(methodName + ":"); // 方法
			logTitle.append(params + ":"); // 方法
			logTitle.append(errorName + ":"); // 方法
			logTitle.append("异常信息====="); // 方法

			LogUtil.printMobileLog(logTitle.toString(), errorMessage);
		} catch (ClassNotFoundException ee) {
			ee.printStackTrace();
		}
		
		System.out.println("=====异常通知结束=====");
	}

	/**
	 * 获取service层注解的描述信息
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static String getServiceMethodDescription(JoinPoint joinPoint)
			throws ClassNotFoundException {
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Class<?> targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		String description = "";
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				Class<?>[] parameterTypes = method.getParameterTypes();
				if (parameterTypes.length == args.length) {
					description = method.getAnnotation(SystemServiceLog.class)
							.description();
					break;
				}
			}
		}
		return description;
	}

	/**
	 * 获取controller层注解的描述信息
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static String getControllerMethodDescription(JoinPoint joinPoint)
			throws ClassNotFoundException {
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Class<?> targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		String description = "";
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				Class<?>[] parameterTypes = method.getParameterTypes();
				if (parameterTypes.length == args.length) {
					description = method.getAnnotation(
							SystemControllerLog.class).description();
					break;
				}
			}
		}
		return description;
	}

	public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString());
	}

}
