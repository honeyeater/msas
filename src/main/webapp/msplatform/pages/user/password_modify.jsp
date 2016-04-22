<%@ page import="java.util.*" language="java"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page import="com.sinosoft.msplatform.domain.PrpmUser" %>
<%
PrpmUser prpmUser = (PrpmUser)session.getAttribute("user");
String userLgname = prpmUser.getLoginName();
String userPsd = prpmUser.getPassword();
request.setAttribute("userLgname", userLgname);
request.setAttribute("userPsd", userPsd);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登录密码修改</title>
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctx}/msplatform/js/user/password_modify.js" type="text/javascript"></script>
<script type="text/ecmascript" src="${ctx}/msplatform/js/common/md5.js"></script>
</head>

<body leftmargin="0" topmargin="0" bgcolor="#f5f5f5">
<table width="300" height="150" border="0" style="font-size: 12px;"
	cellspacing="0" cellpadding="0">
	<input type="hidden" id="userLgname" name="userLgname" value="${userLgname}" />
	<input type="hidden" id="userPsd" name="userPsd" value="${userPsd}" />
	<tr>
		<td width="120" height="38" style="color: #656060;"
			background="msplatform/images/common/framebg.gif" valign="top">
		<table width="100" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="23"
					style="font-size: 12px; padding-top: 4; color: #2b2424;">&nbsp;&nbsp;登录密码修改</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		</td>
		<td background="<%=request.getContextPath()%>/msplatform/images/common/framebg.gif"><span
			id="message" style="font-size: 12px; padding-top: 4; color: #2b2424;"></span></td>
	</tr>
	<tr>
		<td width="100" height="36" style="color: #656060;" align="right">旧&nbsp;密&nbsp;码:</td>
		<td><input name="oldpsw" id="oldpsw" type="password"
			style="FONT-SIZE: 13px; COLOR: #0052a4; WIDTH: 140px; height: 18px;"
			value='' maxlength="64"></td>
	</tr>

	<tr>
		<td width="100" height="8"></td>
		<td></td>
	</tr>

	<tr>
		<td width="100" height="36" style="color: #656060; padding-top: 5;"
			align="right" valign="top">新&nbsp;密&nbsp;码:</td>
		<td valign="top"><input name="newpsw" id="newpsw" type="password"
			style="FONT-SIZE: 13px; COLOR: #0052a4; WIDTH: 140px; height: 18px;"
			value='' maxlength="64"></td>
	</tr>

	<tr>
		<td width="100" height="36" style="color: #656060; padding-top: 5;"
			align="right" valign="top">确认密码:</td>
		<td valign="top"><input name="confirmpsw" id="confirmpsw"
			type="password"
			style="FONT-SIZE: 13px; COLOR: #0052a4; WIDTH: 140px; height: 18px;"
			value='' maxlength="64"></td>
	</tr>


</table>
<table width="300" height="46" border="0" cellspacing="0"
	cellpadding="0" bgcolor="#c6c6c6">
	<tr>
		<td align="right" style="padding-top: 1"><img
			src="<%=request.getContextPath()%>/msplatform/images/common/Confirm.gif" width="78"
			height="26" alt=""
			onMouseOver="this.src='<%=request.getContextPath()%>/msplatform/images/common/Confirmhover.gif'"
			onMouseOut="this.src='<%=request.getContextPath()%>/msplatform/images/common/Confirm.gif'"
			style="cursor: hand" onClick="return OnBtnOK()" type="button"></td>
		<td width="20">&nbsp;</td>
		<td style="padding-top: 1"><img
			src="<%=request.getContextPath()%>/msplatform/images/common/Cancel.gif" width="78"
			height="26" alt=""
			onMouseOver="this.src='<%=request.getContextPath()%>/msplatform/images/common/Cancelhover.gif	'"
			onMouseOut="this.src='<%=request.getContextPath()%>/msplatform/images/common/Cancel.gif'"
			style="cursor: hand" onClick="OnBtnCancel()" type="button"
			align="absmiddle"></td>
	</tr>
</table>
<table width="300" height="50" border="0" cellspacing="0"
	cellpadding="0" bgcolor="#c6c6c6">
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</body>
</html>