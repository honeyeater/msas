package com.sinosoft.msas.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinosoft.msas.util.SystemControllerLog;

/**
 * 主页控制器
 */
@Controller
public class WelcomeController {
	
	@RequestMapping("/")
	@SystemControllerLog(description = "欢迎")
	public String toindex(HttpServletRequest request, Model model) {
		return "login";
	}
	
	@RequestMapping("/login")
	@SystemControllerLog(description = "跳转到登录")
	public String tologin(HttpServletRequest request, Model model) {
		return "login";
	}
}
