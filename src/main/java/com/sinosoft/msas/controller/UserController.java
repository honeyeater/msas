package com.sinosoft.msas.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinosoft.msas.domain.PrpMuser;
import com.sinosoft.msas.service.UserService;
import com.sinosoft.msas.util.CipherUtil;
import com.sinosoft.msas.util.SystemControllerLog;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;

	@SystemControllerLog(description = "显示用户")
	@RequestMapping("/show")
	public String showUser(HttpServletRequest request, Model model) {
		PrpMuser muser = userService.findByUserCode("0000");
		model.addAttribute("muser", muser);
		return "showUser";
	}

	/**
	 * 验证用户名和密码
	 * 
	 * @param request
	 * @return
	 */
	@SystemControllerLog(description = "登录校验")
	@RequestMapping("/checkLogin")
	public String login(HttpServletRequest request) {
		String result = "login";
		// 取得用户名
		String username = request.getParameter("usercode");
		// 取得 密码，并用MD5加密
		String password = new CipherUtil().generatePassword(request
				.getParameter("password"));
		UsernamePasswordToken token = new UsernamePasswordToken(username,
				password);
		Subject currentUser = SecurityUtils.getSubject();
		try {
			System.out.println("----------------------------");
			if (!currentUser.isAuthenticated()) {// 使用shiro来验证
				token.setRememberMe(true);
				currentUser.login(token);// 验证角色和权限
			}
			System.out.println("result: " + result);
			result = "main";// 验证成功
		} catch (Exception e) {
			result = "login";// 验证失败
		}
		return result;
	}

	/**
	 * 退出
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public String logout() {
		String result = "login";
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return result;
	}

}
