<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%
String path = request.getContextPath() ;
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
input.cx{width:60px; hright:28px; line-height:28px; text-align:center; color:#fff; font-size:14px; border-radius:3px; background-color:#0079ff; border:none; margin-left:35px;margin-right:5px; cursor:pointer;}
</style>
<script type="text/javascript">
alert("系统异常，请重新登录。");
backLogin();
function  backLogin(){
	parent.parent.window.location = "<%=path%>";
}
</script>
</head>
<body>
</body>
</html>
