<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>视频失败处理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/xmlhttp.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/msplatform/ui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		function videoFailCheck(){
			$("#currentPage").val(0);//查询结果回到第一页
			pageForm.submit();
		}
	</script>
</head>

<body class="body1" >
	<form action="${ctx}/replay/replay_queryVideoFail" method="post" name="pageForm" id="pageForm">
		<table class="table">
			<!-- 隐藏域 -->
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<tr >
				<td>					
					<table class="table1" cellspacing="0px">
						<tr>
							<td class="td2"></td>
							<td class="td2">用户：<input type="text" name="videoFail_UserName"
								id="videoFail_UserName" value="${videoFail_UserName }"></td> 
							
							<td class="td2" style="border-right:1px solid #ccc;">案件号：<input type="text" name="videoFail_CaseNo"
								id="videoFail_CaseNo" value="${videoFail_CaseNo }"></td>
								
							<td class="td2" style="padding-left:10%"><input type="button"
								onclick="videoFailCheck();" value="查询" class="cx"/>
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
							<td align="center" width="10%">用户</td>
							<td align="center" width="14%">创建时间</td>
							<td align="center" width="8%">手机号</td>
						</tr>
						<c:forEach items="${videoList}" var="video" >
						<tr id='bg' >
							<td>${video.caseNo}</td>
							<td>${video.remark}</td>
							<td><fmt:formatDate value="${video.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${video.mobile}</td>
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
