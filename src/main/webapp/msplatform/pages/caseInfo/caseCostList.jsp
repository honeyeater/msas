<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>案件管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/caseInfo/caseCostList.js" type="text/javascript"></script>
</head>

<body class="body1" >
	<form  action="${ctx}/caseInfo/caseInfo_queryCostByTree" method="post" name="pageForm" id="pageForm" >
		<table class="table">
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="exportcost_caseNo" id="exportcost_caseNo" value="${exportcost_caseNo}"/>
			<tr>
				<td>
					<table class="table1">
						<tr>
							<td class="td1">当前位置：<span id="Position">${treeNodeName}</span></td>
							</td>
							<td width="40%"></td>
							<td class="td2" style="border-right:1px solid #ccc;">
							案件号：<input type="text" name="query_caseNo"
								id="query_caseNo" value="${query_caseNo }"></td>
							<td class="td2" style="padding-left:5%"><input type="button"
								onclick="caseSearch()" value="查询" class="cx"/>
							</td>
							<td class="td2" style="padding-left:0%"><input type="button"
								onclick="exportExcel()" value="导出" class="cx"/>
							</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="18"></td>
			</tr>
			<tr>
				<td>
					<table class="table2">
						<tr class="tr_title">
							<td width="6%">序号</td>
							<td width="14%">案件号</td>
							<td width="10%">手机号</td>
							<td width="14%">结案时间</td>
						</tr>
						<c:forEach items="${endCaseList}" var="endCase" varStatus="index">
							<tr id='bg' >
								<td >${index.index+1 }</td>
								<td >${endCase.caseNo }</td>
								<td >${endCase.mobile }</td>
								<td ><fmt:formatDate value="${endCase.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</form>
	
	<%@include file="/msplatform/pages/common/pageInfo.jsp" %>
	
</body>
</html>
