<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<html>
<head>
	<title>组织信息添加</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common2.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/common/jquery.form.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/location/locationForm.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/map.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/formCheck.js"></script>
</head>

<body>
	<form id="locationForm" action="${ctx}/location/location_save" method="post">
		<table class="table">
			<!-- 隐藏信息 -->
			<input type="hidden" id="locationUuid" name="location.uuid" value="${location.uuid}" />
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
			<input type="hidden" name="comType" id="comType" value="${comType}"/>
			<input type="hidden" name="flag" id="flag" value="${flag}"/>
			<tr class="td1">
				<td>&nbsp;<span> 
				<c:if test="${flag==0}">组织信息修改 </c:if>
				<c:if test="${flag==1}">组织信息添加</c:if> </span></td>
			</tr>
			<tr>
				<td>
					<table class="table1" id="info_base2">
						<tr class="tr_color">
							<td width="120px" class="td_name">上级组织:</td>
							<td class="td_input">&nbsp;&nbsp; 
								<c:choose>
									<c:when test="${editComName !=null }">
										${editComName }
									</c:when>
									<c:otherwise>
										${treeNodeName }
									</c:otherwise>
								</c:choose></td>
						</tr>
						
						<tr class="tr_color">
							<td width="120px" class="td_name">组织类型:</td>
							<td class="td_input" >&nbsp;&nbsp; 
								<select name="location.locatLevel" class="TextLength">
									<option value="2">区域</option>
								</select>
							</td>
								
						<tr class="tr_color">
							<td width="120px" class="td_name">组织名称:</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="location.name" id="name" onKeyDown="CheckKeyDown()"
								onblur="checkField(this)" description="组织名称"
								checkKey="MAP_C0001,MAP_C0002,MAP_C0017,MAP_C0018" class="TextLength"
								value="${location.name }" />&nbsp;&nbsp;
								<div id="nameError" name="nameError" style="display:inline">
									<font color='blue'>*</font>
								</div></td>
						</tr>
						
						<tr class="tr_color">
							<td width="120px" class="td_name">创建日期:</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="location.createTime" id="createTime" readonly="readonly" class="TextLength"
								value='<fmt:formatDate value="${location.createTime}" pattern="yyyy-MM-dd"/>'/>
							</td>
						</tr>

						<tr class="tr_color">
							<td width="120px" class="td_name">备注</td>
							<td class="td_input">&nbsp;&nbsp; <textarea rows="5" class="TextLength"
									cols="1" style="width: 218px" name="location.remark"
									onblur="checkField(this)" checkKey="MAP_C0012" description="备注"
									onKeyDown="CheckKeyDown()" id="remark" >${location.remark }</textarea>
								<div id="remarkError" name="remarkError" style="display:inline">
									<font color='blue'>不超过256个字符</font>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr align="center">
				<td><img src="${ctx}/msplatform/images/common/save.gif"
					onclick="send();" class="img_button" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
					src="${ctx}/msplatform/images/common/back.gif"
					onclick="history.back()" class="img_button" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
