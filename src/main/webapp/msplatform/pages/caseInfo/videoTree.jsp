<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" pageEncoding="utf-8" import="java.util.*"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String treeType = (String)request.getParameter("type");
	request.setAttribute("treeType",treeType);//type=video
%>

<html>
<head>
<base href="<%=basePath%>">
<title>客户端结构树</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet"
	href="${ctx}/msplatform/zTreeStyle/zTreeStyle.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/msplatform/zTreeStyle/zTreeMain.css"
	type="text/css" />

<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/jquery.ztree.core-3.5.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/caseInfo/videoTree.js" type="text/javascript"></script>
</head>

<body onunload="" onload="initViewTree();" style="background: #fff">
	<input type="hidden" id="treeType" value="${treeType}" />
	<div id="left_list"  style="height:20px; margin-top:5px;">
		<div><select id="selectTest" name="selectTest" style="width:65px; height:20px; line-height:20px; border:1px solid #ccc; float:left; margin-right:4px;">
			<option value="1" selected="selected">查勘员</option>
			<option value="2">手机自助</option>
			</select> 
			<input type="text" id="key" value="" class="empty"
				style="line-height:18px; width:60px; height:18px; border:1px solid #ccc; float:left;" /><a				
				onclick=searchTree(); alt="搜索" class="a_search"/></a><a				
				onclick=refreshTree(); alt="刷新" class="a_refresh"/></a>
		</div>
		<div id="left_list_inner" style="float:left;">
			<ul id="tree1" class="ztree"></ul>
			<ul id="tree2" class="ztree"></ul>
		</div>
	</div>
</body>
</html>






