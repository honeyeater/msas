<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>


<html>
<head>
<base target="_self">

<title>转移照片</title>
	<link href="${ctx}/msplatform/css/frame.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/css.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/caseInfo/movePhoto.js" type="text/javascript"></script>
</head>


<body leftmargin="0" topmargin="0">
	<form action="" method="post" id="form1">
	<input type="hidden" value="" name="ID" id="ID">
		<table width="420" height="300" border="0" cellspacing="0"
			cellpadding="0"  >
			<tr>
				<td bgcolor="#f3f3f3" valign="top" align="center"
					style="padding-top:20;">
					<table width="400" height="100" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="ListFont" height="30" width="100" >&nbsp;手机号:</td>
							<td class="ListFont" height="30" >&nbsp;<input type="text"
								id="mobile" maxlength="32" readonly="readonly"
								style="FONT-SIZE: 13px; COLOR: #666161;WIDTH: 235px;height:24px;">
							</td>
							</td>
						</tr>
					
						<tr>
							<td colspan="2" class="ListFont" height="40" style="font-size: 14px" >&nbsp;原案件信息:</td>
						</tr>
						<tr>
							<td class="ListFont" height="30" width="100" >&nbsp;案件号:</td>
							<td class="ListFont" height="30" >&nbsp;<input type="text"
								id="caseNo" maxlength="32" readonly="readonly"
								style="FONT-SIZE: 13px; COLOR: #666161;WIDTH: 235px;height:24px;">
							</td>
						</tr>
						<tr>
							<td class="ListFont" height="30" width="100" >&nbsp;车牌号:</td>
							<td class="ListFont" height="30">&nbsp;<input type="text"
								id="licenseNo" maxlength="32" readonly="readonly"
								style="FONT-SIZE: 13px; COLOR: #666161;WIDTH: 235px;height:24px;">
							</td>
						</tr>
						
						<tr>
							<td colspan="2" class="ListFont" height="40" style="font-size: 14px">&nbsp;转移至案件信息:</td>
						</tr>	
						<tr>
							<td class="ListFont" height="30" width="100" >&nbsp;案件号:</td>
							<td class="ListFont" height="30">&nbsp;<input type="text"
								name="newCaseNo" id="newCaseNo" maxlength="32"
								style="FONT-SIZE: 13px; COLOR: #666161;WIDTH: 235px;height:24px;">
							</td>
						</tr>
						<tr>
							<td class="ListFont" height="30" width="100" >&nbsp;车牌号:</td>
							<td class="ListFont" height="30">&nbsp;<input type="text"
								name="newLicenseNo" id="newLicenseNo" maxlength="32"
								style="FONT-SIZE: 13px; COLOR: #666161;WIDTH: 235px;height:24px;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="118" height="40" bgcolor="#dadada" align="right">
				<table width="380" height="40" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>&nbsp;</td>
							<td width="118"><table width="118" height="40" border="0"
									cellspacing="0" cellpadding="0">
									<tr>
										<td width="57"
											style="cursor:hand;background-repeat:no-repeat;background-position:center;padding-top:2"
											background="${ctx}/msplatform/images/common/button.gif"
											onClick="submitThisForm()" align="center" class="ListFont">确定</td>
										<td width="4">&nbsp;</td>
										<td width="57"
											style="cursor:hand;background-repeat:no-repeat;background-position:center;padding-top:2"
											background="${ctx}/msplatform/images/common/button.gif"
											onClick="closeThis()" align="center" class="ListFont">取消</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>

</html>
