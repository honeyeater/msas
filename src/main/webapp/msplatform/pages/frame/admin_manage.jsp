<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>

<html>
<head>
<link rel="shortcut icon" href="${ctx}/msplatform/images/common/IE9.ico" />

<title>移动查勘视频平台</title>
<meta http-equiv=Content-Type content=text/html;charset=utf-8>
</head>
<frameset rows="120,*" frameborder="NO" border="0" framespacing="0">
	<frame src="${ctx}/msplatform/pages/frame/user_top.jsp?manageType=1"
		noresize="noresize" frameborder="no" name="topFrame" scrolling="no"
		marginwidth="0" marginheight="0" target="main" id="topFrame"/>
	<frameset cols="100%,*" frameborder="no" border="0" framespacing="0"
		id="mainframeset">
		<frame src="${ctx}/msplatform/pages/company/companyFrame.jsp"
			name="mainframe" />
	</frameset>
</frameset>
<noframes>
	<body></body>
</noframes>
</html>