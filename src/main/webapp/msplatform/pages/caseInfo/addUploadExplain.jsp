<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加补传说明</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/js/caseInfo/addUploadExplain.js"></script>
<style type="text/css">
		table {
			font:12px "microsoft yahei",Tahoma, Geneva, sans-serif; font-weight:normal;
		}
</style>

</head>
<body>
		<table width="420" height="208" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td bgcolor="#ffffff" valign="top" align="center"
				style="padding-top:20;"><table width="400" height="90"
					border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" class="ListFont" height="30">&nbsp;添加补传说明:<object
								id="foo" CLASSID="CLSID:81D3C6F2-D9B3-4AAF-8616-7B3BCF9BAD49"
								WIDTH=1 HEIGHT=1> </object>
						</td>
						<input type="hidden" name="caseuuid" id="caseuuid"
							value="<%=request.getParameter("caseuuid")%>">
					</tr>
					<tr>
						<td class="ListFont" width="75" align="center">案件号&nbsp;&nbsp;
						</td>
						<td class="ListFont" height="42">&nbsp;<input
							name="casenumber" id="casenumber"
							style="FONT-SIZE: 14px; COLOR: #666161;WIDTH: 253px;height:20px;"
							value="<%=request.getParameter("casenumber")%>" maxlength="32"
							disabled="disabled"></td>
					</tr>
					<tr>
						<td class="ListFont" width="75" align="center">补传说明</td>
						<td class="ListFont">&nbsp;<textarea name="recontent"
								id="recontent" cols="29" rows="3"
								onpropertychange="check_special(this);if(value.length>512) value=value.substr(0,512)"></textarea>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="400" height="40" bgcolor="#ffffff" align="right">
				<table width="380" height="40" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td>&nbsp;</td>
						<td width="400"><table width="200" height="40" border="0"
								cellspacing="0" cellpadding="0" style="margin:20px 0 0 23px;">
								<tr>
									<td width="47"
										style="cursor:hand;background-repeat:no-repeat;background-position:center;padding-top:2"
										background="${ctx }/msplatform/images/common/button.gif"
										onClick="ok()" align="center" class="ListFont" id="SetPreset">确定</td>
									<td width="4">&nbsp;</td>
									<td width="47"
										style="cursor:hand;background-repeat:no-repeat;background-position:center;padding-top:2"
										background="${ctx }/msplatform/images/common/button.gif"
										onClick="Cancel()" align="center" class="ListFont"
										id="SetPreset">取消</td>
								</tr>
							</table></td>
					</tr>
				</table>
</body>


</html>
