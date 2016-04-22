<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>公司管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	
	<script type="text/javascript"  src="${ctx}/msplatform/js/company/companyList.js" ></script>
</head>

<body class="body1" >
	<form  action="${ctx}/company/company_queryByTree" method="post" name="pageForm" id="pageForm" >
	<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
	<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
	<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
	<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
	<input type="hidden" name="jspType" id="jspType" value="companyList"/>
		<table class="table">
			<tr >
				<td>
					<table class="table1">
						<tr>
							<td class="td1">当前位置：<span id="Position">${treeNodeName}</span>
							</td>
							<td width="75%"></td>
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
							<td>序号</td>
							<td>公司名</td>
							<td>所在省</td>
							<td>所在市</td>
							<td>地址</td>
							<td>手机号</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${companyList}" var="company" varStatus="index" >
							<tr id='bg' >
								<td width="40px">${((pageInfo.pageNum-1)*pageInfo.pageSize)+index.index+1 }</td>
								<td width="180px">${company.name }</td>
								<td width="120px">${company.province }</td>
								<td width="120px">${company.city }</td>
								<td width="380px" title="${company.address }">
									<div>${company.address }</div>
								</td>
								<td width="180px">${company.mobile }</td>
								<td >
									<a class="img_button2"
									onclick="return editCompany('${company.uuid}')" >编辑</a>
									&nbsp;
									<a class="img_button2"
									onclick="return deleteCompany('${company.uuid}')" >删除</a>&nbsp;
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