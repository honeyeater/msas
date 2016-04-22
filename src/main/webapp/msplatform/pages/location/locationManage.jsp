<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>区域管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/location/locationManage.js" ></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/common/checkBox.js" ></script>
</head>

<body class="body1" >
	<form  action="${ctx}/location/location_queryByTree" method="post" name="pageForm" id="pageForm" >
	<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
	<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
	<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
	<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
	<input type="hidden" name="comType" id="comType" value="${comType}"/>
	<input type="hidden" name="jspType" id="jspType" value="locationList"/>
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
							<c:if test="${treeFlag==1 }">
							    <td width="5%">
							   		<input type="checkbox" id="checkall" name="checkall" onclick="selectCheckBoxs()">
								</td>
							</c:if>
								<td width="10%">序号</td>
								<td width="20%">组织名称</td>
								<td width="35%">组织类型</td>
							<c:if test="${treeFlag==1 }">
								<td width="30%">操作</td>
							</c:if>
						</tr>
						<c:forEach items="${locationList}" var="location" varStatus="index">
							<tr id='bg' >
								<c:if test="${treeFlag==1 }">
									<td>
										<input type="checkbox" name="check1" id="check1" value="${location.uuid}" onclick="changeCheckBoxs(this)"/>
									</td>
								</c:if>	
									<td>${((pageInfo.pageNum-1)*pageInfo.pageSize)+index.index+1 }</td>
									<td>${location.name }</td>
									<td>
										<c:if test="${location.locatLevel==0 }">总公司</c:if>
										<c:if test="${location.locatLevel==1 }">分公司</c:if>
										<c:if test="${location.locatLevel==2 }">区域</c:if>
									</td>
								<c:if test="${treeFlag==1 }">	
									<td >
										<a class="img_button2"
										onclick="return editLocation('${location.uuid}')" >编辑</a>
										&nbsp;
										<a class="img_button2"
										onclick="return deleteLocation('${location.uuid}')" >删除</a>&nbsp;
									</td>
								</c:if>		
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