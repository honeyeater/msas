<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath() + "/msplatform";
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>哎呀…您访问的页面不存在</title>
<link rel="stylesheet" type="text/css" />

<style>
*{margin:0;padding:0}
body{font-family:"微软雅黑";background:#DAD9D7}
img{border:none}
a *{cursor:pointer}
ul,li{list-style:none}
table{table-layout:fixed;}
table tr td{word-break:break-all; word-wrap:break-word;}

a{text-decoration:none;outline:none}
a:hover{text-decoration:underline}
.cf:after{content: ".";display: block;height: 0;font-size: 0;clear:both;visibility: hidden;}
.cf{zoom: 1;clear:both}

.bg{width:100%;background:url("<%=path %>/images/errorpic/01.jpg") no-repeat center top #DAD9D7;position:absolute;top:0;left:0;height:600px;overflow:hidden}
.cont{margin:0 450;width:500px;line-height:20px;}
.c1{height:360px;text-align:center;margin-top:180px;margin-left:155px;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="<%=path %>/images/errorpic/01.png");}

.cont h2{text-align:center;color:#555;font-size:18px;font-weight:normal;height:35px}
.c2{height:35px;text-align:center}
.c2 a{display:inline-block;margin:0 4px;font-size:14px;height:23px;color:#626262;padding-top:1px;text-decoration:none;text-align:left}
.c2 a:hover{color:#626262;text-decoration:none;}
.c2 a.home{width:96px;height:24px;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="<%=path %>/images/errorpic/02.png",sizingMethod ="crop");padding-left:30px}
.c2 a.home:hover{background:url("<%=path %>/images/errorpic/02.png") 0 -24px}
.c2 a.home:active{background:url("<%=path %>/images/errorpic/02.png") 0 -48px}
.c2 a.re{width:96px;height:24px;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="<%=path %>/images/errorpic/03.png",sizingMethod ="crop"));padding-left:30px}
.c2 a.re:hover{background:url("<%=path %>/images/errorpic/03.png") 0 -24px}
.c2 a.re:active{background:url("<%=path %>/images/errorpic/03.png") 0 -48px}
.c2 a.sr{width:153px;background:url("<%=path %>/images/errorpic/04.png");padding-left:28px}
.c2 a.sr:hover{background:url("<%=path %>/images/errorpic/04.png") 0 -24px}
.c2 a.sr:active{background:url("<%=path %>/images/errorpic/04.png") 0 -48px}
.c3{height:60px;text-align:center;color:#999;font-size:12px}
#bf{position:absolute;top:269px;left:0;width:100%}
.bf1{margin:0 auto;width:99px;padding-left:32px}
.bd{height:600px;overflow:hidden}
#box{position:absolute;top:165px;left:0;width:100%;text-align:center}
.bf1{margin:0 auto;width:99px;padding-left:32px}
</style>

</head>
<body>
<div class="bg">
	<div class="cont">
		<div class="c1"></div>
		<h2>抱歉…出错了，但是有人正在修理</h2>
		<div class="c2"><a href="javascript:history.go(-1)" class="re">返回</a><a href="<%=path%>/index" class="home">网站首页</a></div>
		<div class="c3"><a href="#" class="c3"></a>提醒您 - 服务器出了一点小问题，没关系，你可以尝试返回或者回到主页</div>
	</div>
</div>
</body>
</html>
