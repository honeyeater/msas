package com.sinosoft.msas.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.sinosoft.msas.model.mobile.BasicdataDto;
import com.sinosoft.msas.model.mobile.MicV1Req;
import com.sinosoft.msas.model.mobile.MicV1Resp;
import com.sinosoft.msas.service.SysBasicService;

/**
 * 统计数据控制器
 *
 */
@Controller
@RequestMapping("/sas/v1")
public class StatisticsController {

	@Resource
	private SysBasicService sysBasicService;

	@RequestMapping(value="/synca", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String syncBasicData(HttpServletRequest request, Model model) {
		String result = "";
		MicV1Req micV1Req = null;
		MicV1Resp micV1Resp = new MicV1Resp();
		try {
			// 验证与参数解析
			micV1Req = ControllerUtil.paramToReq(request);
			// 验证与参数解析失败
//			if(!"0".equals(micV1Req.getErrorCode())) {
//				micV1Resp.setCode("0");
//				micV1Resp.setMessage("");
//				throw new Exception();
//			}
			// 返回数据封装
			BasicdataDto basicdataDto = sysBasicService.findAllBasicData();
			String data = JSON.toJSONString(basicdataDto, SerializerFeature.WriteMapNullValue);
			System.out.println(data);
			micV1Resp.setData(data);
			micV1Resp.setCode("1");
			micV1Resp.setMessage("成功");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			result = JSON.toJSONString(micV1Resp, SerializerFeature.WriteMapNullValue);
		}
		System.out.println(result);
		
		return result;
	}


}
