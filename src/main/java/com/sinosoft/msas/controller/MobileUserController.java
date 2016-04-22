package com.sinosoft.msas.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.sinosoft.msas.domain.PrpMuser;
import com.sinosoft.msas.model.mobile.LoginUserDto;
import com.sinosoft.msas.model.mobile.MicV1Req;
import com.sinosoft.msas.model.mobile.MicV1Resp;
import com.sinosoft.msas.service.LoggerService;
import com.sinosoft.msas.service.UserService;
import com.sinosoft.msas.util.DateUtil;
import com.sinosoft.msas.util.MobileReturnCode;
import com.sinosoft.msas.util.SystemControllerLog;

/**
 * 移动端用户控制器
 *
 */
@Controller
@RequestMapping("/sas/v1")
public class MobileUserController {

	@Resource
	private UserService userService;
	@Resource
	private LoggerService loggerService;

	@SystemControllerLog(description = "登录校验")
	@RequestMapping(value="/tologin", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toLogin(HttpServletRequest request, Model model) {
		String result = "";
		MicV1Req micV1Req = null;
		MicV1Resp micV1Resp = new MicV1Resp();
		try {
			// 验证与参数解析
			micV1Req = ControllerUtil.paramToReq(request);
			// 验证与参数解析失败
			if(!"0".equals(micV1Req.getErrorCode())) {
				MobileReturnCode.setReturnMsg(micV1Resp, MobileReturnCode.FAIL, MobileReturnCode.KEY_MOBILE_00006);
				throw new Exception("验证签名失败.");
			}
			String reqMsg = micV1Req.getReqmsg();
			// 请求参数信息为空
			if(reqMsg == null || "".equals(reqMsg)) {
				MobileReturnCode.setReturnMsg(micV1Resp, MobileReturnCode.FAIL, MobileReturnCode.KEY_MOBILE_00008);
				throw new Exception("请求参数为空.");
			}
			// 获取信息
			LoginUserDto loginUserDto = (LoginUserDto) JSONObject.parse(reqMsg);
			if(loginUserDto == null) {
				MobileReturnCode.setReturnMsg(micV1Resp, MobileReturnCode.FAIL, MobileReturnCode.KEY_MOBILE_00008);
				throw new Exception("请求参数为空.");
			}
			PrpMuser prpMuser = userService.findByUserCode(loginUserDto.getUsercode());
			// 用户不存在
			if(prpMuser == null) {
				MobileReturnCode.setReturnMsg(micV1Resp, MobileReturnCode.FAIL, MobileReturnCode.KEY_MOBILE_00003);
				throw new Exception("用户不存在.");
			} 
			// 验证正确
			if(loginUserDto.getPassword().equals(prpMuser.getPassword())) {
				MobileReturnCode.setReturnMsg(micV1Resp, MobileReturnCode.SUCCESS, "");
			} else {
				MobileReturnCode.setReturnMsg(micV1Resp, MobileReturnCode.FAIL, MobileReturnCode.KEY_MOBILE_00002);
				throw new Exception("用户名或密码错误.");
			}
		} catch(Exception e) {
			if(micV1Resp.getCode() == null || "".equals(micV1Resp.getCode())) {
				MobileReturnCode.setReturnMsg(micV1Resp, MobileReturnCode.FAIL, MobileReturnCode.KEY_MOBILE_00034);
			}
			e.printStackTrace();
		} finally {
			micV1Resp.setResponsetime(DateUtil.getCurrentDate());
			result = JSON.toJSONString(micV1Resp, SerializerFeature.WriteMapNullValue);
		}
		System.out.println(result);
		return result;
	}

}
