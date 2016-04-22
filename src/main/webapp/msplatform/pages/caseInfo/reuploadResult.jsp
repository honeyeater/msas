<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<html>
<head>
	<link href="${ctx}/msplatform/css/css.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${ctx}/msplatform/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="${ctx}/msplatform/css/caseInfo/caseCommon.css" type="text/css">
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery.ztree.core-3.5.js"></script>
	<script src="${ctx}/msplatfrom/ui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/msplatfrom/ui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/common/xmlhttp.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>	
	<script type="text/javascript" src="${ctx}/msplatform/js/caseInfo/reuploadResult.js"></script>	
</head>

<body >
<div class="div" id="main" class="main" >
		<div class="div1"></div>
		<form action="${ctx}/caseInfo/caseInfo_findReloadPic" method="post" name="pageForm" id="pageForm">
		<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
		<input type="hidden" name="hid" id="hid" value="${hid}">
			<table class="table2 table_ph" cellspacing="0" cellpadding="0">
				<tr class="tr1">
					<td width="10%" class="td_r">案件号：</td>
					<td width="20%" class="td_l" ><input type="text" id="case_caseNo"
						name="case_caseNo" class="input2" value="${case_caseNo}"></td>
					<td width="10%" class="td_r">案件状态：</td>
					<td width="20%" class="td_l" style="border-right:1px solid #ccc;">
					<s:select list="#request.REUPLODCASESTATUSMAP"   
								listValue="value"   listKey="key"  theme="simple"  headerKey="2" 
				 				name="case_reUploadFlag" id="case_reUploadFlag" class="input2" >
				 	</s:select>
						<%--<s:select list="#{1:'待补传',2:'已补传待审核',3:'审核不通过待补传',4:'审核通过'}"   
							listValue="value"   listKey="key"  theme="simple"  
			 				name="case_reUploadFlag" id="select_casestatus"  value="#request.case_reUploadFlag" >
		 				</s:select>--%>
		 				</td>
		 			<td width="40%" rowspan="3">&nbsp; <img alt="搜索"
						src="${ctx}/msplatform/images/common/search.gif" onclick="checkMsg()"
						class="img_serch">&nbsp;&nbsp;&nbsp;&nbsp;</td>						
				</tr>				
				<tr class="tr1">
					<td class="td_r">开始时间：</td>
					<td class="td_l"><input type="text" id="case_createTime" name="case_createTime"
						 class="input2"  onfocus="checkSelectValue()" 
						 value='<fmt:formatDate value="${case_createTime}" pattern="yyyy-MM-dd"/>'
						 /></td>
					<td class="td_r">结束时间：</td>
					<td class="td_l" style="border-right:1px solid #ccc;"><input type="text" id="case_endCaseTime"
						name="case_endCaseTime" class="input2"  onfocus="checkSelectValue()" 
						value='<fmt:formatDate value="${case_endCaseTime}" pattern="yyyy-MM-dd"/>'
						/></td>
				</tr>
			</table>
		</form>
		<div class="div2">
			<span style = "float: left; height: 24px; width: 20%">补传案件</span>
			<div style = "height: 24px; float: right;" >
				<span class="span1" >待补传：</span><span style = "width:20px;">${countReupload.reupload_num1 }</span>
				<span class="span2" >已补传待审核：</span><span style = "width:20px; color: red" >${countReupload.reupload_num2}</span>
				<span class="span3" >审核不通过待补传：</span><span style = "width:20px" >${countReupload.reupload_num3}</span>
				<span class="span4" >审核通过：</span><span style = "width:20px" >${countReupload.reupload_num4}</span>
			</div>
			<table id="msgTable1" cellspacing="0" cellpadding="0" >
				<tr class="tr2">
					<td width="2%">&nbsp;</td>
					<td width="7%">案件号</td>
					<td width="5%">车牌号</td>
					<td width="9%">手机号</td>
					<td width="10%">结案时间</td>
					<td width="8%">状态</td>
					<td width="8%">操作</td>
				</tr>
				<c:forEach items="${caseInfoList}" var="caseInfo" >
					<tr class="current" >
						<td> <input type = "radio" name="caseUuid" id="caseUuid" value="${caseInfo.uuid }" ></input> </td>
						<td ><input type ="hidden" value="${caseInfo.uuid }">${caseInfo.caseNo}</td>
						<td >${caseInfo.licenseNo}</td>
						<td >${caseInfo.contactPhone}</td>
						<td ><fmt:formatDate value="${caseInfo.endCaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
						<td >
						<c:forEach var="map" items="${REUPLODCASESTATUSMAP }">
							<c:if test="${map.key==caseInfo.reUploadFlag}">
								${map.value}
							</c:if>
						</c:forEach>
						</td>
						<td>
							<c:if test="${caseInfo.reUploadFlag==2 }">
								<input type = button value = "补传" style = "cursor: pointer;border:none; background-color:#fff; color:#0079ff;" onclick = "buchuan('${caseInfo.caseNo}','${caseInfo.uuid }')"/>
								<input type = button value = "通过审核" style = "cursor: pointer;border:none; background-color:#fff; color:#0079ff;" onclick = "checkPass('${caseInfo.uuid }')"/>
							</c:if>
							&nbsp;
						</td>
					</tr>
				</c:forEach>
				<tr class="td_Bor">
					<td colspan="7">
						<table id="msgTable1" class="ph_Table" cellspacing="0" cellpadding="0" style="border-right:none; border-bottom:none;">
						<thead>
							<tr class="tr2 tr_bg">
								<td width="8%">案件号</td>
								<td width="10%">操作时间</td>
								<td width="10%">操作人</td>
								<td width="10%" style="border-right:1px solid #ccc;">补传说明</td>
							</tr>
						</thead>
						<tbody id="content"> </tbody>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<%@include file="/msplatform/pages/common/pageInfo.jsp" %>
		</div>
		
	</div>
	
	
</body>
</html>
