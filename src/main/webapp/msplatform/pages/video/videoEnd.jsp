<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>

<%
	String caseType = (String)request.getParameter("caseType");
	request.setAttribute("caseType", caseType);
%>
<html>
<head>
	<title>结案</title>
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/video/videoEnd.js" ></script>
	<script type="text/javascript">
		$(function(){
			var params = window.dialogArguments;
			$("input[name='userName']").val(params.userName);
			$("input[name='DeviceN']").val(params.devideNo);
			$("#DeviceNSpan").html(params.devideNo);
			$("input[name='CaseNum']").val(params.caseNo);
			$("#CaseNumSpan").html(params.caseNo);
			$("input[name='CarNum']").val(params.licenseNo);
			$("#CarNumSpan").html(params.licenseNo);
		});
	</script>
	<style type="text/css">
		.container{
			height:400px;
			width:423px;
			margin-top:10px;
			margin-left:10px;
			padding:0px;
			font-size: 14px;
			scroll:auto;
			border-top:1px solid #ccc;
			font:12px "microsoft yahei",Tahoma, Geneva, sans-serif; font-weight:normal;
		}
		.content{
			height:340px;
			width:423px;
			margin:0;
			padding:0;
		}
		.foot{
			height:60px;
			width:423px;
			margin:0px;
			padding:20 0 0 0;
			text-align:center;
		}
		.trDiv{
			height:30px;
			width:423px;
			margin:0;
			padding:0;
		}
		.trTitle{
			height:30px;
			line-height:30px;
			width:421px;
			margin:0;
			padding:0;
			border-bottom:1px solid #ccc; 
			border-right:1px solid #ccc;
			border-left:1px solid #ccc;
		}
		.title{
			width:100px;
			height:29px;
			line-height:29px;
			margin:0px;
			padding-right:5px;
			border-bottom:1px solid #ccc; 
			border-right:1px solid #ccc;
			border-left:1px solid #ccc;
			text-align:right;
			float:left;
		}
		.data{
			width:310px;
			height:29px;
			line-height:29px;
			margin:0;
			padding-left:5px;
			border-bottom:1px solid #ccc; 
			border-right:1px solid #ccc;
			text-align:left;
			float:right;
		}
		.btn{
			
		}
	</style>
</head>

<body style="margin:0;padding:0">
	<form action="" method="post" id="theform">
	<input type="hidden" name="caseType" id="caseType" value="${caseType }" />
	<input type="hidden" name="userName" id="userName"  />
		<div class="container">
			<div class="content">
				<div class="trDiv">
					<div class="title"><span id="devName">当前设备:</span></div>
					<div class="data"><span id="DeviceNSpan"></span>
						<input type="hidden" name="DeviceN" id="DeviceN" />
						<input type="hidden" value='' name="DeviceId" id="DeviceId" />
					</div>
				</div>
				<div class="trDiv">
					<div class="title"><span>报案号:</span></div>
					<div class="data"><span id="CaseNumSpan"></span>&nbsp;
						<input type="hidden" name="CaseNum" id=CaseNum />
					</div>
				</div>
				<div class="trDiv">
					<div class="title"><span>车牌号:</span></div>
					<div class="data"><span id="CarNumSpan"></span>&nbsp;
						<input type="hidden" name="CarNum" id="CarNum" >
					</div>
				</div>
				<div class="trDiv">
					<div class="title"><span>案件状态:</span></div>
					<div class="data"><span>未结束</span>
						<input type="hidden" name="CaseState" id="CaseState" value="未结束" >
					</div>
				</div>
				<div class="trTitle">
					&nbsp;&nbsp;案件信息配置:
				</div>
				<div class="trDiv">
					<div class="title"><span>结束类型:</span></div>
					<div class="data" >
						<select id="EndType" name="EndType" style="width:100px;"
								onChange="AddEndTypeInfo()">
							<option value="0" selected="selected">正常结束</option>
							<option value="1">异常结束</option>
							<!--  <option value="2" >改派</option> -->
						</select>&nbsp;
					</div>
				</div>
				<div class="trDiv">
					<div class="title"><span>异常类型:</span></div>
					<div class="data" >
						<select name="AbnormEndType" style="COLOR: #000000;WIDTH: 100px;"
								id="AbnormEndType" disabled="disabled">
									<option value="2" selected="selected">等待</option>
									<option value="1">无信号</option>
									<option value="0">其他</option>
						</select>
						&nbsp;&nbsp;改派类型:&nbsp; 
						<select name='Reassign'
								style='COLOR: #000000;WIDTH: 100px;' id='Reassign'
								disabled="disabled" >
									<option value='0' selected="selected">请选择</option>
									<option value='1'>查勘定损改派</option>
									<option value='2'>定损改派</option>
									<c:if test="${caseType=='1' }">
										<option value='3'>转人工查勘</option>
									</c:if>
						</select>
					</div>
				</div>
				<div class="trDiv">
					<div class="title"><span>图片上传:</span></div>
					<div class="data" >
						<select name='picUpType' style='COLOR: #000000;WIDTH: 100px;' id='picUpType' disabled="disabled">
						<!--	<option value='1' selected='selected' >手动上传</option>  -->
								<option value='0' selected='selected'>立即上传</option>
						</select>&nbsp;&nbsp;
						<c:if test="${caseType=='1' }">
							<span id="IfReupload1">是否需要补传照片 <input
									type="checkbox" name="IfReupload" id="IfReupload" onclick="changeCheckBox(this)">
							</span>
						</c:if>
					</div>
				</div>
				<div id="AbnormEndInfoId"  style="height:60px;width:423px;display: none;">
					<div class="title" style="height:60px;line-height:60px;"><span>异常备注:</span></div>
					<div class="data" style="height:60px;">
						<textarea name="AbnormEndInfo" style="position:absolute;margin-top:2px;width:300px;height:50px;"
							id="AbnormEndInfo" ></textarea>
					</div>
				</div>
				<div id="ReuploadExplainId"  style="height:60px;width:423px;">
					<div class="title" style="height:60px;line-height:60px;"><span>补传说明:</span></div>
					<div class="data" style="height:60px;">
						<textarea name="AbnormEndInfo" style="position:absolute;margin-top:2px;width:300px;height:50px;"
							name="ReuploadExplain" id="ReuploadExplain" disabled="disabled"></textarea>
					</div>
				</div>
				<div id="uploadPicMessage" class="trTitle" style="display:none">正在上传文件，请稍后···
				</div>
			</div>
			<div class="foot">
				<input type="button" value="确  定" class="btn" onclick="EndCase()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="取  消" class="btn" onclick="Cancel()">
			</div>
		</div>
	</form>
</body>
</html>
