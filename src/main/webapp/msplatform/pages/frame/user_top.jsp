<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@page import="com.sinosoft.msplatform.util.SysConst"%>
<%@ page import="java.util.*" language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp" %>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ page import="com.sinosoft.msplatform.domain.PrpmUser" %>
<%
PrpmUser prpmUser = (PrpmUser)session.getAttribute("user");
String loginName = prpmUser.getLoginName(); 
String userName = prpmUser.getName();
String userTypeName = (String) session.getAttribute("userTypeName");

String userType = (String)prpmUser.getUserType();
request.setAttribute("userType",userType);
request.setAttribute("loginName",loginName);

//获取页面类型1-管理中心  2-客户端
String manageType = (String)request.getParameter("manageType");
request.setAttribute("manage", manageType);

//获取座席LoadConfig调用的WAS零配置地址
String videoUrl = (String)SysConst.getProperty("VIDEO_CONFIGURL");
request.setAttribute("videoUrl", videoUrl);

%>
<html>
<head>
<title>网络视频</title>

<meta http-equiv=Content-Type content=text/html;charset=utf-8>
<base target="main">
<link href="${ctx}/msplatform/ui/skin.css" rel="stylesheet" type="text/css">
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/msplatform/js/common/map.js"></script>
<script type="text/javascript" src="${ctx}/msplatform/js/common/md5.js"></script>
<script type="text/javascript"  src="${ctx}/msplatform/js/common/checkVideo.js" ></script>
<script type="text/javascript"  src="${ctx}/msplatform/js/frame/user_top.js" ></script>

</head>
<style>
	font{
		margin:0 10px;
	}
	.hidediv0  {float:right;width: auto;height:20px; line-height:20px;}
	.hidediv1{float:right;width: auto;height:30px; margin-top:6px;}
	.hidediv2{width: auto;height:20px; line-height:20px; float:right;}
	.nummsg{float:left;font-size:17px;margin-left:58%;color:red;font-weight:bold}
</style>
<body leftmargin="0" topmargin="0" >
	<c:if test="${manage==2 and (userType=='1' or userType=='2' or userType=='3')}">
		<div style="width: 1px; height: 1px; overflow: hidden;">
			<object id="AINF" classid="clsid:8FF79F70-3314-4B99-A5FF-A6D2FB2D8A5B"></object>
		</div>
	</c:if>
	<input type="hidden" id="userType" name="userType" value="${userType}" />
	<input type="hidden" id="manage" name="manage" value="${manage}" />
	<input type="hidden" id="videoUrl" name="videoUrl" value="${videoUrl}" />
	<input type="hidden" id="vcid" name="vcid" value="${sessionScope.prpmVideoUser.vcid }" />
	<input type="hidden" id="operatorId" name="operatorId" value="${sessionScope.prpmVideoUser.agtID }" />
	<input type="hidden" id="password" name="password" value="${sessionScope.prpmVideoUser.videoPass }" />
	<input type="hidden" id="callType" name="callType" value="" />
	<input type="hidden" id="state" name="state" value="" />
	
	<div class="admin_topbg">
		 <div class="head_top">			
			<div class="hidediv2">
				<font style="font-size: 12px;"><a onclick="modifypassword()"
					style="cursor:pointer;">修改密码</a>
				</font>| <font style="font-size: 12px;"><a
					href="${ctx}/login_plat/login_logoff" target="_top"
					style="cursor:pointer;" onclick="return logout()"
					style="cursor:pointer;">退出</a>
				</font>
			</div>
			<div class="hidediv0">
				<font style="font-size: 12px; color:#999;"><span style="cursor: hand"
					onclick="showDetail('<%=""%>')"><%=loginName%></span>(<%=userTypeName%>:<%=userName%>)</font>|
			</div>
		</div>
		<div class="topBg">
			<div class="topbg1"></div>	
			<c:if test="${manage==2 and (userType=='1' or userType=='2' or userType=='3')}">
				<div style="font-size:12px;padding-top:10px; float:right; width:700px;text-align:right;margin-right:1%">&nbsp;&nbsp;&emsp;
					自助拍照待处理数:&nbsp;<SPAN style="COLOR: #ff0000; margin-right:10px;" id="selfImgCaseNum">0</SPAN>|
					查勘拍照待处理数:&nbsp;<SPAN style="COLOR: #ff0000; margin-right:10px;" id="surveyImgCaseNum">0</SPAN>|
					查勘请求数:&nbsp;<SPAN style="COLOR: #ff0000; margin-right:10px;" id="surveyCaseNum">0</SPAN>|
					自助请求数:&nbsp;<SPAN style="COLOR: #ff0000 ; margin-right:10px;" id="selfCaseNum">0</SPAN>|					
					在线:&nbsp;<SPAN style="COLOR: #ff0000 ; margin-right:10px;" id="onlineNum">0</SPAN>|
					空闲:&nbsp;<SPAN style="COLOR: #ff0000; margin-right:10px;" id="freeNum">0</SPAN>|
					暂离:&nbsp;<SPAN style="COLOR: #ff0000" id="busyNum">0</SPAN>
				</div>
			</c:if>			
		</div>
		<c:if test="${manage==2 and (userType=='1' or userType=='2')}">
		<div class="nummsg">
		<span style="display:none;" id="imgCaseNumMsg" >有图片查勘任务，请处理！&emsp;</span>
		<span style="display:none;" id="caseNumMsg">有视频查勘任务，请处理！</span></div>
		</c:if>
		<div class="topbg2">
				<c:if test="${manage==1 and userType=='1'}">
					<a href="${ctx}/msplatform/pages/frame/main.jsp" target="_top"
						onclick="return warn1()">进入客户端</a>
				</c:if>
			 	<c:if test="${manage==2 and userType=='1'}">
					
					<a href="${ctx}/msplatform/pages/frame/admin_manage.jsp" target="_top"
						onclick="return warn2()">进入管理中心</a>
				</c:if>			
			</div>
		<div class="topbg3" >
		<div style="width:80%; float:left;">	
			<table width="100%" height="34" border="0" cellpadding="0"
				cellspacing="0" class="admin_topbg1">
				<tr>					
					<td width="80%" height="30" align="center" id="menus">
						<c:if test="${manage==1 and userType=='1'}">
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/company/companyFrame.jsp"
							target="mainframe" class="active">公司管理</a> 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/location/locationFrame.jsp"
							target="mainframe" >区域管理</a> 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/user/userFrame.jsp"
							target="mainframe" >用户管理</a> 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/checkUser/surveyFrame.jsp"
							target="mainframe" >查勘员管理</a> 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/checkUser/garageFrame.jsp"
							target="mainframe" >修理厂管理</a> 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/caseInfoFrame.jsp"
							target="mainframe" >案件管理</a> 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/caseCostFrame.jsp"
							target="mainframe" >结算案件管理</a>
							<c:if test="${loginName=='root'}"> 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/user/versionFrame.jsp"
							target="mainframe" >版本控制管理</a> 
							</c:if>
						</c:if>
<!--						 管理员，核损员可见 -->
						<c:if test="${manage==2 and (userType=='1' or userType=='2')}">
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/video/videoFrame.jsp" 
							target="main1" class="active">实时监控</a>
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/replay/replayFrame.jsp" 
							target="main1" >录像回放</a>
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/photoFrame.jsp" 
							target="main1" >照片管理</a>
<!--							 <a onclick="return localconfig(this)" style="cursor:pointer;">本地配置</a>   -->
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/caseResultFrame.jsp" 
							target="main1" >自助案件跟踪</a>
							
							<!-- 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/reupload.jsp" 
							target="main1" >自助补传照片</a>
							 -->
							 
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/imageCheckFrame.jsp" 
							target="main1" >拍照查勘处理</a>
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/video/videoFailFrame.jsp" 
							target="main1" >视频失败处理</a>
						</c:if>
<!--						 理算员可见 -->
						<c:if test="${manage==2 and userType=='3'}">
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/caseResultFrame.jsp" 
							target="main1" class="active">自助案件跟踪</a>
							<a onclick="return add_effect(this)" href="${ctx}/msplatform/pages/caseInfo/reupload.jsp" 
							target="main1" >自助补传照片</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div class="hidediv1">
			<c:if test="${userType=='1'}">
				<font style="font-size: 12px;"><a
					href="${ctx}/msplatform/pages/board/userPie.jsp" target="_blank">人员看板</a>
				</font>| <font style="font-size: 12px;"><a
					href="${ctx}/msplatform/pages/board/companyPie.jsp" target="_blank">案件看板</a>
				</font>
			</c:if>	
		</div>
	</div>
</div>	
</body>
</html>
