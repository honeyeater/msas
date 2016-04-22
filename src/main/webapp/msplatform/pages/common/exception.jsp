<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%
String path = request.getContextPath() ;
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link rel="stylesheet" type="text/css" />

<style>
*{margin:0;padding:0}
body{font-family:"微软雅黑";background:#DAD9D7}
.bg{width:100%;center top #DAD9D7;position:absolute;top:150;left:0;overflow:hidden}
.cont{margin:0 30%;line-height:50px;}
input.cx{width:100px; hright:32px; line-height:28px; text-align:center; color:#fff; font-size:14px; border-radius:3px; background-color:#0079ff; border:none; margin-left:35px;margin-right:5px; cursor:pointer;}
</style>
<script type="text/javascript">
function  backLogin(){
	parent.parent.window.location = "<%=path%>";
}
function disp() {
	document.getElementById("errorMsg");
	
}
</script>
</head>
<body>
<div class="bg">
    
	<div class="cont"  style="margin-top:60px">
		<h3>抱歉，系统出现异常，请联系系统管理员.</h3>
	</div>
	<div style="margin-left:40%">
		<input type="button" value="重新登录" onclick="backLogin()" class="cx">
	</div>
	<h5 style="margin-left: 60px; margin-top: 10px;">便于快速处理问题，请将下面异常信息反馈给系统管理人员。</h5>
	<p style="font-size: 12px; margin-left: 60px; margin-right:60px; margin-top: 20px;margin-bottom:20px; border: 1px solid #111; padding: 8px;" id="errorMsg" onclick="disp()">
		<s:property value="exceptionStack" escape="false"/>
	</p>
</div>
</body>
</html>
