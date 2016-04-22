<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp" %>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ page import="java.util.Date"%>
<%
	request.getSession().invalidate();//清空session 
    Cookie[] cookie = request.getCookies();//获取cookie
    if (cookie != null && cookie.length != 0)
    	cookie[0].setMaxAge(0);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" href="${ctx}/msplatform/css/login/base.css" />
<link rel="stylesheet" href="${ctx}/msplatform/css/login/login.css" />
<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery.min.js"></script>
<script src="${ctx}/msplatform/js/common/md5.js" type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx}/msplatform/js/login/login.js" type="text/javascript"></script>
</head>

<body onload = "initForm(); checkAINF();">
<div style="width: 1px; height: 1px; overflow: hidden;">
			<object id="AINF" classid="clsid:8FF79F70-3314-4B99-A5FF-A6D2FB2D8A5B"></object>
</div>
<form  method="post" name="loginForm"  id="loginForm" >
	<div class="head">
		<div class="head_top">
			<!-- <a href=""><img src="${ctx}/msplatform/images/login/logo.jpg"
			alt="天安财险" /></a><span></span> -->
		<font><b>移动视频查勘平台</b></font></div>
	</div>
	<div class="Content">
		<div class="login_content">
			<div class="Left"><img src="${ctx}/msplatform/images/login/left_img.jpg" width="595"
				height="301" /></div>
			<div class="Right">
			<h3>欢迎登录</h3>
				<ul class="ul_content">
					<li class="placeholder"><span class="bg1"></span>
					<input type="text" value="" id="username" name="username"
					data-value=""/><font class="font_ts">请输入用户名</font></li>
					
					<li class="placeholder" id="password_li"><span class="bg2"></span>
					<input type="password" value="" id="password" name="password"
					data-value=""/><font class="font_ts" id="font_li">请输入密码</font></li>
					
					<!-- 
					<li class="li_code"><span class="bg3"></span><input type="text"
						value="" id="verifyCode" name="verifyCode" data-value="请输入验证码" class="placeholder" />
						<span class="code"><a onclick="changeimg()" style = "cursor: pointer">
							<img alt="换一个" id="code" src="${ctx}/login_plat/login_creatCode?method=creatCode&a=<%=new Date().getTime()%>"/>
						</a></span></li>
					 -->
					 	
				</ul>
				<div class="login_btu"><input type="submit" value="登录" onclick = "OnBtnSave();" id="EhomeLoginButton" class="loginButton"></div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="foot_tab">
			<a href="javascript:;">平台使用说明</a>
			<a href="javascript:downloadAINF();">控件下载</a>
		    <a href="${ctx}/download"  class="right_no" target="_blank">客户端下载</a></div>
	</div>
</form>
</body>
<script>	
	
	//模拟placeholder	
	$(".placeholder font").bind('click',function(){
        var val = $(this).siblings('input').val(), text = $(this);
        val.length > 0 ? text.show() : text.hide();
        $(this).siblings('input').focus();
    });
    $(".placeholder input").bind('blur',function(){
        var val = $(this).val(), text = $(this).siblings("font");
        val.length > 0 ? text.hide() : text.show();
    });	

    $(".placeholder input").bind('focus',function(){
		var text = $(this).siblings("font");
		text.hide();
	});
    
	$('.placeholder').focus(function(){
		if($(this).val()==$(this).attr('data-value')){
			$(this).val('').css({'color':'#484848'});
		}
	})
	.blur(function(){
		if($(this).val()==''){
			$(this).val($(this).attr('data-value')).css({'color':'#999'});
		}				
	}).trigger('blur');
	
	//错误提示
	 /**
	 $(".ul_content>li>input").bind('focus',function(){				
			$(this).parent("li").next('.checkEvet').remove();
			$(this).parent().removeClass('error');	
			 });				
	
	$(".ul_content>li>input").bind('blur',function(){						
			$(this).parent('li').after(function(n){					
			  return '<p class="checkEvet">错误提示！</p>';
			  });
			$(this).parent().addClass('error');		
			
	});	*/
	//中间Content赋值高度
	var originHeight = 0;
	$(document).ready(function(){
		originHeight = $("html").height();
        var topH=$(".head").outerHeight();
		var footH=$(".footer").outerHeight();
		var H=$(window).height();
		$(".Content").height(H-topH-footH);
		setTimeout("styleAdjust()", 1000);
    });		
	function styleAdjust(){
		var curHeight = $("html").height();
		if(originHeight != curHeight){
			var topH=$(".head").outerHeight();
			var footH=$(".footer").outerHeight();
			var H=$(window).height();
			$(".Content").height(H-topH-footH);
		}
	}
</script>
</html>
