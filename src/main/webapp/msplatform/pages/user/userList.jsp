<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>用户管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/user/userList.js" ></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/common/checkBox.js" ></script>
</head>

<body class="body1" >
	<form action ="${ctx}/user/user_queryByTree" name="pageForm" id="pageForm"  method="post">
		<table class="table">
			<!-- 隐藏域 -->
			<input type="hidden" id="comType" name="comType" value="${comType}" />
			<input type="hidden" id="checkType" name="checkType" value="${checkType}" />
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="jspType" id="jspType" value="userList"/>
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
			<tr >
				<td>					
					<table class="table1">
						<tr>
							<td class="td2">系统用户代码：<input type="text" name="query_userCode"
								id="query_userCode" value="${query_userCode }"></td>
							<td class="td2">系统登录名：<input type="text" name="query_loginName"
								id="query_loginName" value="${query_loginName }"></td>
							<td class="td2" style="border-right:1px solid #ccc;">用户姓名：<input type="text" name="query_name"
								id="query_name" value="${query_name }">
							</td>
							<td class="td2" style="padding-left:10%"><input type="button"
								onclick="userSearch()" value="查询" class="cx"/>
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
					<table class="table2" cellspacing="0" cellpadding="0">
						<tr class="tr_title">
							<td width="40px">
								<input type="checkbox" id="checkall" name="checkall" onclick="selectCheckBoxs()">
							</td>
							<td align="center" >序号</td>
							<td align="center" >系统用户代码</td>
							<td align="center" >系统登录名</td>
							<td align="center" >用户姓名</td>
							<td align="center" >用户类型</td>
							<td align="center" >到期时间</td>
							<td align="center" >操作</td>
						</tr>
						<c:forEach items="${userList}" var="user" varStatus="index">
							<tr id='bg' >
								<td>
									<input type="checkbox" name="check1" id="checkbox" value="${user.uuid}" onclick="changeCheckBoxs(this)"/>
								</td>
								<td >${index.index+1 }</td>
								<td >${user.userCode }</td>
								<td >${user.loginName }</td>
								<td >${user.name }</td>
								<td >
								<c:forEach var="map" items="${USERTYPESMAP }">
									<c:if test="${map.key==user.userType}">
										${map.value}
									</c:if>
								</c:forEach>
								</td>
								<td ><fmt:formatDate value="${user.endTime}" pattern="yyyy-MM-dd"/></td>
								<td >
									<a class="img_button2"
									onclick="return editUser('${user.uuid}')" >编辑</a>
									&nbsp;
									<a class="img_button2"
									onclick="return deleteUser('${user.uuid}')" >删除</a>&nbsp;
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
