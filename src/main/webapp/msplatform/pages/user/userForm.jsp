<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>用户管理</title>
<link rel="stylesheet" href="${ctx}/msplatform/css/common/common2.css"
	type="text/css" />
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/jquery.form.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/msplatform/js/common/map.js"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/js/user/userForm.js"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/js/common/formCheck.js"></script>
</head>

<body>
<form id="userForm" action="${ctx}/user/user_save" method="post">
<table class="table">
	<input type="hidden" name="user.uuid" id="uuid" value="${user.uuid}" />
	<input type="hidden" name="userFlag" id="userFlag" value="${userFlag}" />
	<input type="hidden" name="treeNodeId" id="treeNodeId"
		value="${treeNodeId}" />
	<input type="hidden" name="treeNodeName" id="treeNodeName"
		value="${treeNodeName}" />
	<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}" />
	<input type="hidden" name="check_loginName" id="check_loginName"
		value="${user.loginName}" />
	<c:if test="${userFlag=='0'}">
		<input type="hidden" name="videoUserCode" id="videoUserCode" value="${user.userCode }" />
	</c:if>
	<tr class="td1">
		<td>&nbsp;<span> <c:if test="${userFlag=='1'}">增加用户</c:if>
		<c:if test="${userFlag=='0'}">修改用户</c:if> </span></td>
	</tr>
	<tr>
		<td>
			<table class="table1" id="info_base2">
				<tr class="tr_color">
					<td width="120px" class="td_name">所在区域:</td>
					<td class="td_input">&nbsp;&nbsp; 
						<c:if test="${userFlag=='1'}">${treeNodeName}</c:if> 
						<c:if test="${userFlag=='0'}">${userLocationName }</c:if></td>
				</tr>
	
				<tr class="tr_color">
					<td width="120px" class="td_name">公司代码:</td>
					<td class="td_input">&nbsp;&nbsp; 
						<c:if test="${userFlag=='1'}">${userCompanyNo }</c:if> 
						<c:if test="${userFlag=='0'}">${userCompanyNo }</c:if></td>
				</tr>
	
				<tr class="tr_color">
					<td class="td_name">用户类型:</td>
					<td class="td_input">&nbsp;&nbsp; <s:select
						list="prpmUserTypes" listValue="TypeName" listKey="TypeCode"
						theme="simple" name="user.userType" cssClass="TextLength"
						id="userType" onblur="checkField(this)"
						onChange="changeForm(this)" checkKey="MAP_C0001"
						description="用户类型" value="#request.user.userType">
					</s:select> &nbsp;&nbsp;
					<div id="userTypeError" name="userTypeError" style="display: inline">
					<font color='blue'>*</font></div>
					</td>
				</tr>
	
				<tr class="tr_color">
					<td width="120px" class="td_name">姓名:</td>
					<td class="td_input">&nbsp;&nbsp; <input type="text"
						name="user.name" id="name" onKeyDown="CheckKeyDown()"
						onblur="checkField(this)" checkKey="MAP_C0001,MAP_C0002"
						description="姓名" class="TextLength" value="${user.name }" />&nbsp;&nbsp;
	
					<div id="nameError" name="nameError" style="display: inline">
					<font color='blue'>*</font></div>
					</td>
				</tr>
	
				<tr class="tr_color">
					<td width="120px" class="td_name">系统登录名:</td>
					<td class="td_input">&nbsp;&nbsp; <input type="text"
						name="user.loginName" id="loginName" onKeyDown="CheckKeyDown()"
						onblur="checkField(this)" checkKey="MAP_C0001,MAP_C0003,MAP_C0009"
						description="系统登录名" class="TextLength" value="${user.loginName }" />&nbsp;&nbsp;
					<div id="loginNameError" name="loginNameError"
						style="display: inline"><font color='blue'>*</font></div>
					</td>
				</tr>
	
				<tr class="tr_color">
					<td width="120px" class="td_name">系统用户代码:</td>
					<td class="td_input">&nbsp;&nbsp; <input type="text"
						name="user.userCode" id="userCode" onKeyDown="CheckKeyDown()"
						onblur="checkField(this)" checkKey="MAP_C0001,MAP_C0005"
						description="系统用户代码" class="TextLength" value="${user.userCode }" />&nbsp;&nbsp;
					<div id="userCodeError" name="userCodeError" style="display: inline">
					<font color='blue'>*</font></div>
					</td>
				</tr>

					<tr class="tr_color" id="lisuan_NoID">
						<td width="120px" class="td_name">坐席代码:</td>
						<td class="td_input">&nbsp;&nbsp; <input type="text"
							name="agtID" id="agtID"
							onKeyDown="CheckKeyDown()" 
							class="TextLength" value="${agtID}" />&nbsp;&nbsp;
							<div id="agtIDError" name="agtIDError"
								style="display:inline">
								<font color='blue'></font>
							</div>
						</td>
					</tr>
					<tr class="tr_color" id="lisuan_NoPass">
						<td width="120px" class="td_name">坐席密码:</td>
						<td class="td_input">&nbsp;&nbsp; <input type="text"
							name="videoPass" id="videoPass"   onKeyDown="CheckKeyDown()" 
							description="坐席密码" checkKey="MAP_C0003"
							class="TextLength" value="${videoPass}" />&nbsp;&nbsp;
							<div id="videoPassError" name="videoPassError"
								style="display:inline">
								<font color='blue'></font>
							</div>
						</td>
					</tr>
					
					<c:if test="${userFlag=='0'}">
					<tr class="tr_color">
						<td width="120px" class="td_name">用户登陆密码:</td>
						<td class="td_input">&nbsp;&nbsp; <input type="text"
							name="user.password" id="password" onfocus="setTip(this,'MAP_C0003');" onblur="check_psw(this,'MAP_C0003');"
							onKeyDown="CheckKeyDown()" description="用户登陆密码" checkKey="MAP_C0003"
							class="TextLength" value="${vcid}" />&nbsp;&nbsp;
							<div id="passwordError" name="passwordError"
								style="display:inline">
								<font color='blue'>不修改请留空</font>
							</div>
						</td>
					</tr>
					
					<tr class="tr_color">
						<td width="120px" class="td_name">用户登陆密码确认:</td>
						<td class="td_input">&nbsp;&nbsp; <input type="text"
							name="pswConfirm" id="pswConfirm" onfocus="setTip(this,'MAP_C0003');" onblur="check_pswtwo(this,'MAP_C0003');"
							onKeyDown="CheckKeyDown()" description="用户登陆密码确认" checkKey="MAP_C0003,MAP_C0014"
							class="TextLength"   />&nbsp;&nbsp;
							<div id="pswConfirmError" name="pswConfirmError"
								style="display:inline">
								<font color='blue'>不修改请留空</font>
							</div>
						</td>
					</tr>
					</c:if>
					
				<tr class="tr_color" id="num1">
					<td width="120px" class="td_name">手机号码:</td>
					<td class="td_input">&nbsp;&nbsp; <input type="text"
						name="user.mobilePhone" id="mobilePhone" onKeyDown="CheckKeyDown()"
						onblur="checkField(this)" checkKey="" description="手机号码"
						class="TextLength" value="${user.mobilePhone}" />&nbsp;&nbsp;
					<!--
					<div id="mobilePhoneError" name="mobilePhoneError"
						style="display: inline"><font color='blue'>*</font></div>  -->
					</td>
				</tr>
	
				<tr class="tr_color" id="num2">
					<td width="120px" class="td_name">座机号码:</td>
					<td class="td_input">&nbsp;&nbsp; <input type="text"
						name="user.telePhone" id="telePhone" onKeyDown="CheckKeyDown()"
						onblur="checkField(this)" checkKey="" description="座机号码"
						class="TextLength" value="${user.telePhone }" />&nbsp;&nbsp;
					<!-- 
					<div id="telePhoneError" name="telePhoneError"
						style="display: inline"><font color='blue'>*</font></div> -->
					</td>
				</tr>
	
				<tr class="tr_color" id="num3">
					<td width="120px" class="td_name">分机号码:</td>
					<td class="td_input">&nbsp;&nbsp; <input type="text"
						name="user.extensionnNum" id="extensionnNum"
						onKeyDown="CheckKeyDown()" onblur="checkField(this)"
						checkKey="" description="分机号码" class="TextLength"
						value="${user.extensionnNum }" />&nbsp;&nbsp;
					<!--
					<div id="extensionnNumError" name="extensionnNumError"
						style="display: inline"><font color='blue'>*</font></div>  -->
					</td>
				</tr>
	
				<tr class="tr_color">
					<td width="120px" class="td_name">到期时间:</td>
					<td class="td_input">&nbsp;&nbsp; <input type="text"
						name="user.endTime" id="endTime" onKeyDown="CheckKeyDown()"
						value='<fmt:formatDate value="${user.endTime}" pattern="yyyy-MM-dd"/>'
						onblur="checkField(this)" checkKey="MAP_C0006"
						onfocus="checkSelectValue()" description="到期时间" class="TextLength"
						value="${user.endTime }" />&nbsp;&nbsp;
					<div id="endTimeError" name="endTimeError" style="display: inline">
					<font color='blue'>*</font></div>
					</td>
				</tr>
	
				<tr class="tr_color">
					<td width="120px" class="td_name">备注:</td>
					<td class="td_input">&nbsp;&nbsp; <textarea rows="5" cols="1" class="TextLength"
						style="width: 218px" name="user.remark" id="remark"
						onblur="checkField(this)" checkKey="MAP_C0012" description="备注"
						onKeyDown="CheckKeyDown()">${user.remark }</textarea>&nbsp;&nbsp;
					<div id="remarkError" name="remarkError" style="display: inline">
					<font color='blue'>不超过256个字符</font></div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr align="center">
		<td><img src="${ctx}/msplatform/images/common/save.gif"
			onclick="sendUser();" class="img_button" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
			src="${ctx}/msplatform/images/common/back.gif"
			onclick="history.back()" class="img_button" /></td>
	</tr>
</table>
</form>
</body>
</html>
