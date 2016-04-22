<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>案件处理详情</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />

<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>

<script>
	$(function() {
		$(".dataTables_length label").hide();
		//var content1 = "每页显示记录数"; 
		var content2 = "可根据手机号、案件号等任意单一条件进行查询";
		$(".dataTables_length").eq(0).append(
				"<p style = 'width: 300px; display: inline-block; margin-left: 5px'>"
						+ content2 + "</p>");
		//$(".dataTables_filter label").append();
	});
	function myrefresh() {
		window.location.reload();
	}
	setTimeout('myrefresh()', 120000); //指定2分钟刷新一次
	function caseSearch(){
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
	}
	function changeCaseStatus(){
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
	}
	
</script>

<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
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

<h1 id="companyName" style="text-align: center;font-size:16px" >案件处理详情</h1>

<form action ="${ctx}/board/board_queryCaseInfo" name="pageForm" id="pageForm"  method="post">
		<table class="table">
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<tr >
				<td>
					<table class="table1">
						<tr>
							<td class="td2">
								案件类型：
								<s:select list="#request.CASEDETAILSTATUSMAP"   
								listValue="value"   listKey="key"  theme="simple"  headerKey="" 
				 				name="list_caseStatus" id="list_caseStatus" onChange="changeCaseStatus()"  value="#request.list_caseStatus" >
				 				</s:select>
							</td>
							<td class="td2">
							案件号：<input type="text" name="query_caseNo"
								id="caseNo" value="${query_caseNo }"></td>
							<td class="td2">
							车牌号：<input type="text" name="query_licenseNo"
								id="licenseNo" value="${query_licenseNo }"></td>
							<td class="td2">
							手机号：<input type="text" name="query_contactPhone"
								id="contactPhone" value="${query_contactPhone }"></td>
							<td class="td2" style="padding-left:0%"><input type="button"
								onclick="caseSearch()" value="查询" class="cx"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table2">
						<tr class="tr_title">
							<td width="8%">案件类型</td>
							<td width="14%">案件号</td>
							<td width="10%">车牌号</td>
							<td width="10%">手机号</td>
							<td width="10%">查勘员</td>
							<td width="10%">分公司</td>
							<td width="14%">出险时间</td>	
						</tr>
						<c:forEach items="${boardCaseInfoDtoList}" var="boardCaseInfoDto"
							varStatus="index">
							<tr id='bg'>
								<td>
   								<c:forEach var="map" items="${CASETYPESMAP }">
									<c:if test="${map.key==boardCaseInfoDto.caseType}">
										${map.value}
									</c:if>
								</c:forEach>
								</td>
								<td>${boardCaseInfoDto.caseNo }</td>
								<td>${boardCaseInfoDto.licenseNo }</td>
								<td>${boardCaseInfoDto.mobile }</td>
								<td>${boardCaseInfoDto.surveyorName }</td>
								<td>${boardCaseInfoDto.name }</td>
								<td><fmt:formatDate
									value="${boardCaseInfoDto.damageDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
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

