<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<html>
<head>
	<title>增加查勘员</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common2.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/common/jquery.form.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/checkUser/checkUserForm.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/map.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/formCheck.js"></script>
</head>

<body>
	<form id="surveyForm" action="${ctx}/checkUser/checkUser_save" method="post">
		<table class="table">
			<!-- 隐藏信息 -->
			<input type="hidden" id="id" name="checkUser.uuid" value="${checkUser.uuid }" />
			<input type="hidden" id="checkType" name="checkType" value="${checkType}" />
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
			<input type="hidden" name="flag" id="flag" value="${flag}"/>
			<tr class="td1">
				<td>&nbsp;<span>
					<c:if test="${checkType==1 and flag==1}">添加查勘员</c:if>
					<c:if test="${checkType==1 and flag==0}">修改查勘员</c:if>
					<c:if test="${checkType==2 and flag==1}">添加修理厂</c:if>
					<c:if test="${checkType==2 and flag==0}">修改修理厂</c:if>
				</span></td>
			</tr>
			<tr>
				<td>
					<table class="table1" id="info_base2">
						<tr class="tr_color">
							<td width="120px" class="td_name">公司</td>
							<td class="td_input">&nbsp;&nbsp;
								<c:choose>
									<c:when test="${editComName !=null }">
										${editComName }
									</c:when>
									<c:otherwise>
										${treeNodeName }
									</c:otherwise>
								</c:choose>
							</td>
						</tr>

						<tr class="tr_color">
						<c:if test="${checkType==1}">
							<td class="td_name">姓名</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="checkUser.name" id="name" onKeyDown="CheckKeyDown()"
								onblur="checkField(this)" description="姓名"
								checkKey="MAP_C0001,MAP_C0002" class="TextLength"
								value="${checkUser.name }" />&nbsp;&nbsp;
								<div id="nameError" name="nameError" style="display:inline">
									<font color='blue'>*</font>
								</div></td>
						</c:if>
						<c:if test="${checkType==2}">
							<td class="td_name">名称</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="checkUser.name" id="name" onKeyDown="CheckKeyDown()"
								onblur="checkField(this)" description="名称"
								checkKey="MAP_C0001,MAP_C0002" class="TextLength"
								value="${checkUser.name }" />&nbsp;&nbsp;
								<div id="nameError" name="nameError" style="display:inline">
									<font color='blue'>*</font>
								</div></td>
						</c:if>
						</tr>
						<tr class="tr_color">
							<td class="td_name">
								<c:if test="${checkType==1}">系统用户代码</c:if>
								<c:if test="${checkType==2}">修理厂代码</c:if>
							</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="checkUser.useCode" id="useCode" onKeyDown="CheckKeyDown()"
								onblur="checkField(this)" description="系统用户代码"
								checkKey="MAP_C0001,MAP_C0003" class="TextLength"
								value="${checkUser.useCode}" />&nbsp;&nbsp;
								<div id="useCodeError" name="useCodeError"
									style="display:inline">
									<font color='blue'>*</font>
								</div></td>
						</tr>
						<c:if test="${(checkType==1 or checkType==2) and flag==0}">
						<tr class="tr_color" >
							<td class="td_name">密码</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="checkUser.password" id="password" onKeyDown="CheckKeyDown()" onfocus="setTip(this,'MAP_C0003');" onblur="check_psw(this,'MAP_C0003');"
								description="密码" checkKey="MAP_C0003" class="TextLength"
								value="" />&nbsp;&nbsp;
								<div id="passwordError" name="passwordError"
									style="display:inline">
									<font color='blue'>不修改请留空</font>
								</div>
							</td>
						</tr>
						<tr class="tr_color" >
							<td class="td_name">密码确认</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="pswConfirm" id="pswConfirm" onKeyDown="CheckKeyDown()" onfocus="setTip(this,'MAP_C0003');" onblur="check_pswtwo(this,'MAP_C0003');"
								description="密码确认" checkKey="MAP_C0003,MAP_C0014" class="TextLength"
								value="" />&nbsp;&nbsp;
								<div id="pswConfirmError" name="pswConfirmError"
									style="display:inline">
									<font color='blue'>不修改请留空</font>
								</div>
							</td>
						</tr>
						 </c:if>
						<tr class="tr_color">
							<td class="td_name">电话</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="checkUser.mobile" id="mobile" onKeyDown="CheckKeyDown()"
								onblur="checkField(this)" description="电话" checkKey="MAP_C0001,MAP_C0013,MAP_C0015"
								class="TextLength" value="${checkUser.mobile}" />&nbsp;&nbsp;
								<div id="mobileError" name="mobileError" style="display:inline">
									<font color='blue'>*</font>
								</div></td>
						</tr>

						<tr class="tr_color">
							<td class="td_name">
								<c:if test="${checkType==1}">员工住址</c:if>
								<c:if test="${checkType==2}">修理厂地址</c:if>
							</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="checkUser.address" id="address"
								onKeyDown="CheckKeyDown()" onblur="check(this)"
								class="TextLength" value="${checkUser.address}" />&nbsp;&nbsp;
								<div id="addressError" name="addressError"
									style="display:inline">
									<font color='blue'></font>
								</div></td>
						</tr>

						<tr class="tr_color">
							<td class="td_name">备注</td>
							<td class="td_input">&nbsp;&nbsp; <textarea rows="5" class="TextLength" 
									cols="1" style="width: 218px" name="checkUser.remark"
									onblur="checkField(this)" checkKey="MAP_C0012" description="备注"
									onKeyDown="CheckKeyDown()" id="remark" >${checkUser.remark }</textarea>
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
