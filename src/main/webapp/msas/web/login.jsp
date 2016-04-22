<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%  
    String url = request.getRequestURL().toString();  
    url = url.substring(0, url.indexOf('/', url.indexOf("//") + 2));  
    String context = request.getContextPath();  
    url += context;  
    application.setAttribute("ctx", url);  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>登录</title>
</head>
<body>
<h1>系统登录</h1>

	<form action="${ctx}/user/checkLogin" method="post">  
        usercode: <input type="text" name="usercode"><br>  
        password: <input type="password" name="password"><br>  
        <input type="submit" value="登录">  
    </form>
     
</body>
</html>