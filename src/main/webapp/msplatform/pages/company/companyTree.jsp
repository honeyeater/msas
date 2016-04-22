<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@page import="com.sinosoft.msplatform.domain.PrpmUser"%>
<html>
<head>
<link rel="stylesheet"
	href="${ctx}/msplatform/zTreeStyle/zTreeStyle.css" type="text/css" />
<link rel="stylesheet"
	href="${ctx}/msplatform/zTreeStyle/zTreeMain.css" type="text/css" />
	
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/jquery.ztree.core-3.5.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/zTreeStyle/zTreeMain.js"
	type="text/javascript"></script>
</head>
<%
	 String type = (String)request.getParameter("type");
     request.setAttribute("type", type);
     String comType = (String)request.getParameter("comType");
     request.setAttribute("comType",comType);
     PrpmUser user = (PrpmUser)session.getAttribute("user");
     String locationId=user.getCompanyUuid();
     request.setAttribute("locationId",locationId);
%>
<body>
<table class="tab_tree">
	<input type="hidden" id="type" value="${type}" />
	<input type="hidden" id="locationId" value="${locationId}" />
	<input type="hidden" id="comType" value="${comType}" />
	<tr>
		<td>
			<div class="searchDiv">
				<input type="text" id="key" value="" class="searchKey" onkeydown="keydown(event)" /> 
				<input type="button" value="" onclick="search()" class="searchButton" >
			</div>
			<div style="height:100%; overflow-x: auto; width:200px " class="treeCss">
				<table id="TreeTable">
					<tr>
						<td>
							<ul id="treeBody" class="ztree">
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
<script>
	$(function(){
		var H =  $(parent.window).height();
		$(".treeCss").height($(parent.window).height()-75); 
	});
</script>
</html>


