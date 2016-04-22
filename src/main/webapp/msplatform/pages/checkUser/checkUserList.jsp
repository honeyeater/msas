<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>查勘员管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/checkUser/checkUserList.js" ></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/common/checkBox.js" ></script>
	
</head>

<body class="body1" >
	<form action ="${ctx}/checkUser/checkUser_queryByTree"  method="post" name="pageForm" id="pageForm">
		<table class="table">
			<!-- 隐藏域 -->
			<input type="hidden" id="checkType" name="checkType" value="${checkType}" />
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="jspType" id="jspType" value="checkUserList"/>

			<tr >
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
					<table class="table1">
						<tr>
							<td class="td2">
								<c:if test="${checkType==1}">系统用户代码：</c:if>
								<c:if test="${checkType==2}">修理厂代码：</c:if>
								<input type="text" name="query_userCode" 
								id="query_userCode" value="${query_userCode}" ></td>
							<td class="td2">
								<c:if test="${checkType==1}">姓名：</c:if>
								<c:if test="${checkType==2}">名称：</c:if>
								<input type="text" name="query_userName"
								id="query_userName" value="${query_userName}" ></td>
							<td class="td2" style="border-right:1px solid #ccc;">手机号：<input type="text" name="query_userMobile"
								id="query_userMobile" value="${query_userMobile}" >
							</td>
							<td class="td2" style="padding-left:10%"><input type="button"
								onclick="query()" value="查询" class="cx"/>
							</td>
						</tr>
						<tr>
							<td height="10">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table2">
						<tr class="tr_title">
							<td width="3%">
								<input type="checkbox" id="checkall" name="checkall" onclick="selectCheckBoxs()">
							</td>
							<td width="5%">序号</td>
							<td width="15%">
								<c:if test="${checkType==1}">系统用户代码</c:if>
								<c:if test="${checkType==2}">修理厂代码</c:if>
							</td>
							<td width="10%">
								<c:if test="${checkType==1}">姓名</c:if>
								<c:if test="${checkType==2}">名称</c:if>
							</td>
							<td width="15%">手机号</td>
							<!-- <td width="15%">密码</td>  
							<c:if test="${checkType==1}">
							<td width="15%">场景</td> 
							</c:if>-->
							<td width="14%">操作</td>
						</tr>
						<c:forEach items="${checkUserList}" var="checkUser" varStatus="index">
							<tr id='bg' >
								<td >
									<input type="checkbox" name="check1" value="${checkUser.uuid}" onclick="changeCheckBoxs()">
								</td>
								<td >${((pageInfo.pageNum-1)*pageInfo.pageSize)+index.index+1 }</td>
								<td >${checkUser.useCode }</td>
								<td >${checkUser.name }</td>
								<td >${checkUser.mobile }</td>
								<!--<td >${checkUser.password }</td> 
								<c:if test="${checkType==1}">
								<td >天安</td> 
								</c:if>-->
								<td >
									<a class="img_button2"
									onclick="return editCheckUser('${checkUser.uuid}')" >编辑</a>
									&nbsp;
									<a class="img_button2"
									onclick="return deleteCheckUser('${checkUser.uuid}')" >删除</a>&nbsp;
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
