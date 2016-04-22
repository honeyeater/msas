<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.*" language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp" %>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>

<script type="text/javascript">
var client_Y;
var the_dist;
window.onbeforeunload = function(){
	client_Y = window.event.clientY;
	the_dist = window.event.screenX - window.screenLeft;
}
</script>
<html>
<head>
<title>移动视频查勘平台</title>
<meta http-equiv=Content-Type content=text/html;charset=utf-8>
</head>

<frameset rows="120,*" frameborder="NO" border="0" framespacing="0">
	<frame src="${ctx}/msplatform/pages/frame/user_top.jsp?manageType=2"
		noresize="noresize" frameborder="no" name="topFrame" scrolling="no"
		marginwidth="0" marginheight="0" />
    
	<frame src=""
		noresize="noresize" frameborder="no" scrolling="no" name="main1"
		marginwidth="0" marginheight="0" scrolling=auto id="main1" />
</frameset>
</html>