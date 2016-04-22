<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp" %>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery.min.js"></script>
<script src="${ctx}/msplatform/js/login/login.js" type="text/javascript"></script>
<title>控件下载</title>
</head>

<body
	style="padding-left: 20px; font: 14px 'microsoft yahei', Tahoma, Geneva, sans-serif;">
	<p>
		<span><strong><br /> </strong></span>
	</p>
	<p>
		<span><strong>使用视频系统需要安装视频控件，并对IE进行相关设置，可按照下列进行操作：</strong></span>
	</p>
	<p>
		<span><strong><br /> </strong></span>
	</p>
	<p>
		<strong>1.</strong><strong><a
			href="javascript:downloadAINF();">下载视频控件(点击我)</a></strong>
	</p>
	<p>
		<span style="line-height: 1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;将下载的文件拷贝到桌面上，并安装控件程序。</span><span
			style="line-height: 1.5;">（win7、win8、win10需要右键点击下载文件"AInfsetup.exe",选择以<strong>管理员权限</strong>运行）
		</span>
	</p>
	<p>
		<strong>2.选择32位IE浏览器运行：</strong>
	</p>
	<p>
		<span style="line-height: 1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;64位的操作系统（win7、win8、win10）</span><span
			style="line-height: 1.5;">需要注意，进入C:\Program Files
			(x86)\Internet Explorer，双击运行“iexplore”，使用32位的IE浏览器。</span>
	</p>
	<p>
		<span style="line-height: 1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作方法：进入路径</span><span
			style="line-height: 1.5;">C:\Program Files (x86)\Internet
			Explorer</span><span style="line-height: 1.5;">，双击运行“iexplore”。</span>
	</p>
	<p style="padding-left:30px"><img src="${ctx}/msplatform/images/login/5.jpg"></p>
	<p>
		<br />
	</p>
	<%-- <p>
		<span><strong>3.添加信任站点:</strong></span>
	</p>
	<p>
		<span style="line-height: 1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作方法：IE浏览器的菜单“工具”—》“Internet选项”—》在“安全”标签页选择可信站点，
		</span><span style="line-height: 1.5;">点击“站点”</span><span
			style="line-height: 1.5;">—》在可信站点窗口中</span><span
			style="line-height: 1.5;">点击“添加”</span><span
			style="line-height: 1.5;">（注意需去掉下图复选框）。&nbsp;</span>
	</p>
	
	<p style="padding-left:30px"><img src="${ctx}/msplatform/images/login/1.jpg"> &nbsp;&nbsp;&nbsp;&nbsp;<img src="${ctx}/msplatform/images/login/2.jpg"></p>
	<p>
		<br />
	</p>
	<p>
		<span><strong>4.启用视频activex控件:</strong></span>
	</p>
	<p>
		<span style="line-height: 1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作方法：点击上图中的</span><span
			style="line-height: 1.5;">“自定义级别”</span><span
			style="line-height: 1.5;">，在受信任的站点区域窗口中，找到“未标记为可安全执行脚本的ActiveX控件初始化并执行”，</span><span
			style="line-height: 1.5;">选择“启用”</span><span
			style="line-height: 1.5;">，点击</span><span style="line-height: 1.5;">“确定”</span><span
			style="line-height: 1.5;">修改该区域的设置。</span>
	</p>
	    <p style="padding-left:30px"><img src="${ctx}/msplatform/images/login/3.jpg"></p>
	    
	     --%>
	<p>
		<br />
	</p>
	<strong>恭喜您！视频控件安装设置完毕，点击</strong>
	<a href="${ctx}/"><strong>登陆页面</strong></a>
	<strong>。</strong>
	<p>
		<br />
	</p>
</body>
</html>
