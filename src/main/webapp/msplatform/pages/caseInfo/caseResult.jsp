<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>跟踪案件管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/xmlhttp.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>	
	<script type="text/javascript" src="${ctx}/msplatform/js/caseInfo/caseResult.js"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
</head>

<body class="body1" >
	<form action="${ctx}/caseInfo/caseInfo_queryResult" method="post" name="pageForm" id="pageForm">
		<table class="table">
			<!-- 隐藏域 -->
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="hid" id="hid" value="${hid }" />
			<tr >
				<td>					
					<table class="table1" cellspacing="0px">
						<tr>
							<td class="td2">&nbsp;&nbsp;&thinsp;&thinsp;案件号：<input type="text" name="case_caseNo"
								id="case_caseNo" value="${case_caseNo }"></td>
							<td class="td2">&nbsp;&nbsp;&nbsp;车牌号：<input type="text" name="case_licenseNo"
								id="case_licenseNo" value="${case_licenseNo }"></td>
							<td class="td2" style="border-right:1px solid #ccc;">&nbsp;&nbsp;&nbsp;手机号：<input type="text" name="case_contactPhone"
								id="case_contactPhone" value="${case_contactPhone }"></td>
						</tr>
						<tr>
							<td class="td2" >开始时间：<input type="text" name="case_createTime"
								id="case_createTime" onfocus="checkSelectValue()" 
							 	value='<fmt:formatDate value="${case_createTime}" pattern="yyyy-MM-dd"/>'></td>
							<td class="td2">结束时间：<input type="text" name="case_endCaseTime"
								id="case_endCaseTime" onfocus="checkSelectValue()" 
								value='<fmt:formatDate value="${case_endCaseTime}" pattern="yyyy-MM-dd"/>'></td>
							<td class="td1" style="font-size: 12px; border-right:1px solid #ccc;" >&nbsp;&emsp;状态&emsp;:
								<input type="checkbox" name="caseStatusBox" id="box1"value="1"> 定损完成待确认
								<input type="checkbox" name="caseStatusBox" id="box2" value="2"> 客户拒绝
								<br/>&emsp;&emsp;&emsp;&emsp;&nbsp;&thinsp;	
								<input type="checkbox" name="caseStatusBox" id="box3" value="3"> 客户同意
								<input type="checkbox" name="caseStatusBox" id="box4" value="4"> 协调同意
								<input type="checkbox" name="caseStatusBox" id="box5" value="5"> 最终拒绝
							</td>	
							<td class="td2" style="padding-left:10%"><input type="button"
								onclick="checkMsg();" value="查询" class="cx"/>
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
							<td align="center" width="8%">案件号</td>
							<td align="center" width="5%">车牌号</td>
							<td align="center" width="10%">手机号</td>
							<td align="center" width="10%">结案时间</td>
							<td align="center" width="8%">状态</td>
							<td align="center" width="8%">未反馈时长</td>
							<td align="center" width="15%">操作</td>
						</tr>
						<c:forEach items="${caseInfoDtoList}" var="caseInfoDto" >
							<tr id='bg' >
								<td >${caseInfoDto.prpmCaseinfo.caseNo}</td>
								<td >${caseInfoDto.prpmCaseinfo.licenseNo}</td>
								<td >${caseInfoDto.prpmCaseinfo.contactPhone}</td>
								<td ><fmt:formatDate value="${caseInfoDto.prpmCaseinfo.endCaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td >
									<c:if test="${caseInfoDto.prpmCaseinfo.lossStatus==1 }">定损完成待确认</c:if>
									<c:if test="${caseInfoDto.prpmCaseinfo.lossStatus==2 }">客户拒绝</c:if>
									<c:if test="${caseInfoDto.prpmCaseinfo.lossStatus==3 }">客户同意</c:if>
									<c:if test="${caseInfoDto.prpmCaseinfo.lossStatus==4 }">协商同意</c:if>
									<c:if test="${caseInfoDto.prpmCaseinfo.lossStatus==5 }">最终拒绝</c:if>
								</td>
								<td >${caseInfoDto.timeDiff }</td>
								<td >
									<c:if test="${caseInfoDto.prpmCaseinfo.lossStatus==2 }">
										<a class="img_button2"
												onclick="userFeedback('${caseInfoDto.prpmCaseinfo.uuid}',4)" >同意变更</a>
										<a class="img_button2"
												onclick="userFeedback('${caseInfoDto.prpmCaseinfo.uuid}',5)" >仍然拒绝</a>
									</c:if></td>
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
