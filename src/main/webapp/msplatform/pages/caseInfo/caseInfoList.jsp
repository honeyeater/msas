<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>案件管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/caseInfo/caseInfoList.js" type="text/javascript"></script>
</head>

<body class="body1" >
	<form  action="${ctx}/caseInfo/caseInfo_queryByTree" method="post" name="pageForm" id="pageForm" >
		<table class="table">
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="export_caseStatus" id="export_caseStatus" value="${export_caseStatus}" />
			<input type="hidden" name="export_caseNo" id="export_caseNo" value="${export_caseNo}"/>
			<tr>
				<td>
					<table class="table1">
						<tr>
							<td class="td1">当前位置：<span id="Position">${treeNodeName}</span></td>
							<td width="75%"></td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>	
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table1">
						<tr>
							<td class="td2">
							当前状态：
								<s:select list="#request.CASESTATUSMAP"   
								listValue="value"   listKey="key"  theme="simple"  headerKey="" headerValue="--请选择--"
				 				name="caseStatus" id="caseStatus" onChange="changeStatus()"  value="#request.caseStatus" >
				 				</s:select>
							</td>
							<td class="td2">
							案件号：<input type="text" name="query_caseNo"
								id="query_caseNo" value="${query_caseNo }"></td>
							<td class="td2" style="border-right:1px solid #ccc;">
							</td>
							<td class="td2" style="padding-left:5%"><input type="button"
								onclick="caseSearch()" value="查询" class="cx"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" onclick="exportExcel()" value="导出" class="cx" />
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
							<td width="10%">车牌号</td>
							<td width="10%">手机号</td>
							<td width="10%">分公司</td>
							<td width="10%">状态</td>
							<td width="11%">类型</td>
							<td width="14%">开始时间</td>
							<td width="14%">结束时间</td>
						</tr>
						<c:forEach items="${realCaseInfoDtoList}" var="realCaseInfoDto" varStatus="index">
							<tr id='bg' >
								<td >${index.index+1 }</td>
								<td >${realCaseInfoDto.caseNo }</td>
								<td >${realCaseInfoDto.licenseNo }</td>
								<td >${realCaseInfoDto.mobile }</td>
								<td >${realCaseInfoDto.name }</td>
								<td >
								<c:forEach var="map" items="${CASESTATUSMAP }">
									<c:if test="${map.key==realCaseInfoDto.caseStatus}">
										${map.value}
									</c:if>
								</c:forEach>
								</td>
								<td >
								<c:forEach var="map" items="${CASETYPESMAP }">
									<c:if test="${map.key==realCaseInfoDto.mobileUser}">
										${map.value}
									</c:if>
								</c:forEach>
								<td ><fmt:formatDate value="${realCaseInfoDto.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td >
									<fmt:formatDate value="${realCaseInfoDto.endCaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
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
