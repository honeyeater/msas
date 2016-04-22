<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
 	Calendar calendar = Calendar.getInstance();
	calendar.add(Calendar.HOUR, 2);
%>
<html>
<head>
<title>上传安装包</title>
<link rel="stylesheet" href="${ctx}/msplatform/css/common/common2.css"
	type="text/css" />
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/jquery.form.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/msplatform/js/common/map.js"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/js/common/formCheck.js"></script>
<script type="text/javascript">
	
	function sendVersion(){
		var successFlag = "1";  //默认成功 
		 $("input").each(function(){
			 if(typeof($(this).attr("checkKey"))=="undefined"){
			 }else{
				 if(!checkField(this)){	
					 successFlag = "0";
				 }
			 }
		 } );
		 $("textarea").each(function(){
			 if(typeof($(this).attr("checkKey"))=="undefined"){
			 }else{
				 if(!checkField(this)){	
					 successFlag = "0";
				 }
			 }
		 } );
		 //所有校验通过 提交表单
		 if(successFlag == 1){
			 versionForm.submit();
		 }
		
	}
</script>
</head>

<body>
<form id="versionForm" action="${ctx}/user/user_saveVersion2" method="post" >
	<table class="table">
		<input type="hidden" name="version.ID" value="${version.ID }" />
		<tr class="td1">
			<td>&nbsp;<span>修改安装包</span></td>
		</tr>
		<tr>
			<td>
				<table class="table1" id="info_base2">
					
					<tr class="tr_color">
						<td width="120px" class="td_name">安装包类型:</td>
						<td class="td_input">&nbsp;&nbsp; 
							<input type="radio" name="version.appType" value="1"  ${(version.appType=='1')?'checked':'' } disabled="disabled" />iOS
	      					<input type="radio" name="version.appType" value="2"  ${(version.appType=='2')?'checked':'' } disabled="disabled"/>Android</td>
					</tr>
					
					<tr class="tr_color">
						<td width="120px" class="td_name">系统代码:</td>
						<td class="td_input">&nbsp;&nbsp; 
							<input type="radio" name="version.systemCode" value="1"  ${(version.systemCode=='1')?'checked':'' } disabled="disabled"/>移动查勘
	      					<input type="radio" name="version.systemCode" value="2"  ${(version.systemCode=='2')?'checked':'' } disabled="disabled"/>自助查勘</td>
					</tr>
					
					<tr class="tr_color">
						<td width="120px" class="td_name">版本号:</td>
						<td class="td_input">&nbsp;&nbsp; <input type="text"
							name="version.versionId" id="version_Id" value="${version.versionId }"
							description="版本号" disabled="disabled" />&nbsp;&nbsp;
						</td>
					</tr>
					<tr class="tr_color">
						<td width="120px" class="td_name">版本更新内容:</td>
						<td class="td_input">&nbsp;&nbsp; <textarea type="text"
							name="version.versionConten" id="versionConten" onKeyDown="CheckKeyDown()"
							onblur="checkField(this)" checkKey="MAP_C0001" 
							description="版本更新内容" class="TextLength" >${version.versionConten }</textarea>&nbsp;&nbsp;
						<div id="versionContenError" name="versionContenError" style="display: inline">
						<font color='blue'>*</font></div>
						</td>
					</tr>
					<tr class="tr_color">
						<td width="120px" class="td_name">生效时间:</td>
						<td class="td_input">&nbsp;&nbsp; <input type="text"
							name="version.effectDate" id="effectDate" onKeyDown="CheckKeyDown()"
							onblur="checkField(this)" onfocus="MorecheckSelectValue()" checkKey="MAP_C0001"
							value='<fmt:formatDate value="${version.effectDate }" pattern="yyyy-MM-dd HH:mm:ss"/>'
							description="生效时间" class="TextLength"/>&nbsp;&nbsp;
						<div id="effectDateError" name="effectDateError" style="display: inline">
						<font color='blue'>*</font></div>
						</td>
					</tr>
					
					<tr class="tr_color">
						<td width="120px" class="td_name">安装包名称:</td>
						<td class="td_input">&nbsp;&nbsp; <input type="text" disabled="disabled"
							name="version.uptPkgFile" id="packageName" value="${version.uptPkgFile }"
							description="安装包名称" class="TextLength" />&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr align="center">
			<td><img src="${ctx}/msplatform/images/common/save.gif"
				onclick="sendVersion();" class="img_button" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
				src="${ctx}/msplatform/images/common/back.gif"
				onclick="history.back()" class="img_button" /></td>
		</tr>
	</table>
</form>
</body>
</html>
