<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page import="java.util.List"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>图片查勘处理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/xmlhttp.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/js/caseInfo/imageCheckList.js"></script>
<script src="${ctx}/msplatform/ui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
</head>

<body class="body1" >
	<form action="${ctx}/caseInfo/caseInfo_queryImageCheck" method="post" name="pageForm" id="pageForm">
		<table class="table">
			<!-- 隐藏域 -->
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<tr >
				<td>					
					<table class="table1" cellspacing="0px">
						<tr>
							<td class="td2"></td> 
							<td class="td2">
							处理状态：
								<s:select list="#{'0':'未处理','1':'已处理','':'--请选择--'}"   
								listValue="value"   listKey="key"  theme="simple"  headerKey="0" 
				 				name="imgCheck_dealFlag" id="imgCheck_dealFlag" onChange="changeDealFlag()"  value="#request.imgCheck_dealFlag" >
				 				</s:select>
							</td>	
							<td class="td2" style="border-right:1px solid #ccc;">案件号：<input type="text" name="imgCheck_caseNo"
								id="imgCheck_caseNo" value="${imgCheck_caseNo }"></td>
								
							<td class="td2" style="padding-left:10%"><input type="button"
								onclick="imageCheck();" value="查询" class="cx"/>
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
							<td align="center" width="10%">查勘员</td>
							<td align="center" width="14%">创建时间</td>
							<td align="center" width="8%">处理状态</td>
							<td align="center" width="8%">案件类型</td>
						</tr>
						<c:forEach items="${imageCheckList}" var="imageCheck" >
						<tr id='bg' >
							<td><a class="img_button2"
								onclick="caseDetail('${imageCheck.caseUuid }',${imageCheck.dealFlag });" >
								<c:if test="${imageCheck.remark != null}">${imageCheck.caseNo }</c:if>
								<c:if test="${imageCheck.remark == null}"><strong style="color:red">${imageCheck.caseNo }</strong></c:if>
								</a></td>
							<td>
							<c:if test="${imageCheck.remark != null}">${imageCheck.remark }</c:if>
							<c:if test="${imageCheck.remark == null}">${imageCheck.checkUserUuid }</c:if>
							</td>
							<td><fmt:formatDate value="${imageCheck.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:if test="${imageCheck.dealFlag=='0' }">未处理</c:if>
								<c:if test="${imageCheck.dealFlag=='1' }">已处理</c:if>
							</td>
							<td>
								<c:if test="${imageCheck.remark != null}">查勘</c:if>
								<c:if test="${imageCheck.remark == null}">自助</c:if>
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
