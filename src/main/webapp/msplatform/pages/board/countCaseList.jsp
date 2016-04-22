<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%
	String linetype = (String)request.getParameter("linetype");
	request.setAttribute("linetype",linetype);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<c:if test="${linetype==1 }">
<title>核损员处理案件详情</title>
</c:if>
<c:if test="${linetype=='2' }">
<title>理算员状态详情</title>
</c:if>
<meta charset="utf-8">
<meta name="viewport"
	content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />

<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>

<script>
	function myrefresh() {
		window.location.reload();
	}
	setTimeout('myrefresh()', 120000); //指定2分钟刷新一次
	function caseSearch(){
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
	}
</script>
<style type="text/css">
body {
	margin: 30px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>


</head>
<body>
<c:if test="${linetype==1 }">
<h1 id="companyName" style="text-align: center;font-size:16px" >核损员处理案件详情</h1>
</c:if>
<c:if test="${linetype=='2' }">
<h1 id="companyName" style="text-align: center;font-size:16px" >理算员状态详情</h1>
</c:if>
<form action ="${ctx}/board/board_countCaseList" name="pageForm" id="pageForm"  method="post">
		<table class="table">
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="linetype" id="linetype" value="${linetype }"/>
			
			<tr >
				<td>
					<table class="table1">
						<c:if test="${linetype==1 }">
						<tr>
							<td class="td2">
							案件号：<input type="text" name="board_caseNo"
								id="board_caseNo" value="${board_caseNo }"></td>
							<td class="td2">
							车牌号：<input type="text" name="board_licenseNo"
								id="board_licenseNo" value="${board_licenseNo }"></td>
							<td class="td2">
							手机号：<input type="text" name="board_contactPhone"
								id="board_contactPhone" value="${board_contactPhone }"></td>
							<td class="td2" style="padding-left:0%"><input type="button"
								onclick="caseSearch()" value="查询" class="cx"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${linetype=='2' }">
						<tr>
							<td width="40%"></td>
							<td class="td2">
							状态：
							<s:select list="#request.LISUANSTATUSMAP"    
								listValue="value"   listKey="key"  theme="simple"  headerKey="" headerValue="--请选择--"
				 				name="board_status" id="board_status" value="#request.board_status" >
				 				</s:select>
							<td class="td2" style="padding-left:0%"><input type="button"
								onclick="caseSearch()" value="查询" class="cx"/>
							</td>
						</tr>
						</c:if>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table2">
						<c:if test="${linetype==1 }">
						<tr class="tr_title">
							<td >核损员</td>
							<td >案件号</td>
							<td >案件状态</td>
							<td >车牌号</td>
							<td >开始时间</td>
							<td >手机号</td>
							<td >分公司归属</td>
						</tr>
						<c:forEach items="${HesunDetailList }" var="HesunDetail" varStatus="index">
							<tr id='bg'>
								<td>${HesunDetail.name} </td>
								<td>${HesunDetail.caseNo} </td>
								<td> 
								<c:forEach var="map" items="${CASESTATUSMAP }">
									<c:if test="${map.key==HesunDetail.caseStatus}">
										${map.value}
									</c:if>
								</c:forEach>
								</td>
								<td>${HesunDetail.licenseNo} </td>
								<td><fmt:formatDate value="${HesunDetail.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<td>${HesunDetail.mobile} </td>
								<td>${HesunDetail.companyName} </td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${linetype=='2' }">
						<tr class="tr_title">
							<td width="50%">理算员</td>
							<td width="50%">状态</td>
						</tr>
						<c:forEach items="${calUserDetailList }" var="calUserDetail" varStatus="index">
							<tr id='bg'>
								<td>${calUserDetail.loginName}(${calUserDetail.name})</td>
								<td>
								<c:forEach var="map" items="${LISUANSTATUSMAP }">
									<c:if test="${map.key==calUserDetail.status}">
										${map.value}
									</c:if>
								</c:forEach>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</table>
				</td>
			</tr>
		</table>
	</form>
<%@include file="/msplatform/pages/common/pageInfo.jsp" %>

</body>

</html>

