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
	<script type="text/javascript">
		function fileUpload(){
			$("#currentPage").val(0);//查询结果回到第一页
			pageForm.submit();
		}
		
		function deleteVersion(id){
			if(confirm("你确定要删除吗？")){
				var oldAction = pageForm.action;
				pageForm.action =contextRootPath + "/user/user_deleteVersion?id="+id;
				$("#currentPage").val(0);//查询结果回到第一页
				pageForm.submit();
				pageForm.action = oldAction;
			}
		}
		
		function editVersion(id){
			location.href = "${ctx}/user/user_versionEdit?id="+id;
		}
		
	</script>
</head>

<body class="body1" >
	<form action ="${ctx}/user/user_queryVersion" name="pageForm" id="pageForm"  method="post">
		<table class="table">
			<!-- 隐藏域 -->
			<input type="hidden" id="comType" name="comType" value="${comType}" />
			<input type="hidden" id="checkType" name="checkType" value="${checkType}" />
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="jspType" id="jspType" value="versionList"/>
			<tr >
				<td>					
					<table class="table1">
						<tr>
							<td class="td2">安装包类型： <s:select
								list="#request.APPTYPESMAP" listValue="value" listKey="key"
								headerKey="" headerValue="--请选择--" theme="simple" name="appType" id="appType">
							</s:select></td>
							<td class="td2">系统代码： <s:select list="#request.SYSTEMCODESMAP"
								listValue="value" listKey="key" theme="simple" name="systemCode"
								headerKey="" headerValue="--请选择--" id="systemCode">
							</s:select></td>
							<td class="td2" style="border-right: 1px solid #ccc;">安装包名称： <input
								type="text" name="packageName" id="packageName" value="${packageName }"></td>
							<td class="td2" style="padding-left: 5%"><input type="button"
								onclick="versionSearch()" value="查询" class="cx" /></td>
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
							<td align="center" width="5%" >序号</td>
							<td align="center" width="5%">版本号</td>
							<td align="center" width="5%">安装包类型</td>
							<td align="center" width="5%">系统代码</td>
							<td align="center" width="22%">安装包名称</td>
							<td align="center" width="38%">更新包下载URL</td>
							<td align="center" width="12%">生效日期</td>
							<td align="center" width="8%">操作</td>
						</tr>
						
						<c:set var="nowDate" value="<%=System.currentTimeMillis() %>" ></c:set>
						<c:forEach items="${versionList}" var="version" varStatus="index">
							<tr id='bg' >
								<td >${index.index+1 }</td>
								<td >${version.versionId }</td>
								<td >
								<c:forEach var="map" items="${APPTYPESMAP }">
									<c:if test="${map.key==version.appType}">
										${map.value}
									</c:if>
								</c:forEach>
								</td>
								<td >
								<c:forEach var="map" items="${SYSTEMCODESMAP }">
									<c:if test="${map.key==version.systemCode}">
										${map.value}
									</c:if>
								</c:forEach>
								</td>
								<td >${version.uptPkgFile }</td>
								<td >${version.downloadUrl }</td>
								<td ><fmt:formatDate value="${version.effectDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<td >
									<c:if test="${nowDate - version.effectDate.time <0 }">
										<a class="img_button2"
										onclick="return editVersion(${version.ID })" >编辑</a>
										&nbsp;
										<a class="img_button2"
										onclick="return deleteVersion(${version.ID })" >删除</a>&nbsp;
									</c:if>
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