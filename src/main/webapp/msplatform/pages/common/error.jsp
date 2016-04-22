<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>error</title>
		<script type="text/javascript">
	//页面初始化函数
	function init()
	{
		var str = document.getElementById("msg").value;
		if (str == "1")
		{
			alert("图片下载失败,该照片不存在");
		}
		else if (str == "2")
		{
			alert("打包下载失败,该照片不存在");
		}
		history.go(-1);
	}
</script>
	</head>

	<body onload="init()">
		<input type="hidden" value="${msg}" id="msg">
	</body>
</html>
