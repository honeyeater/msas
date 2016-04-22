﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<%
	String treeNodeId = (String)request.getParameter("treeNodeId");
	request.setAttribute("treeNodeId", treeNodeId);
	request.setAttribute("date", new Date());	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<link href = "${ctx }/msplatform/css/css.css" rel = "stylesheet" type = "text/css" />
	<link rel = "stylesheet" href = "${ctx }/msplatform/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
	<link rel = "stylesheet" href = "${ctx }/msplatform/css/replay/replay.css" type="text/css"/>
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/replay/replay.js"></script>
  </head>
  <body >
    <div id = "largist">
			<div id = "window"  style="float:left">
				<object id="TB_PlayBack1"    classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
						<param NAME="AutoStart" VALUE="-1">
						<!--是否自动播放-->
						<param NAME="Balance" VALUE="0">
						<!--调整左右声道平衡,同上面旧播放器代码-->
						<param name="enabled" value="-1">
						<!--播放器是否可人为控制-->
						<param NAME="EnableContextMenu" VALUE="-1">
						<!--是否启用上下文菜单-->
						 <param NAME="url" VALUE=""> 
						<!--播放的文件地址-->
						<param NAME="PlayCount" VALUE="1">
						<!--播放次数控制,为整数-->
						<param name="rate" value="1">
						<!--播放速率控制,1为正常,允许小数,1.0-2.0-->
						<param name="currentPosition" value="0">
						<!--控件设置:当前位置-->
						<param name="currentMarker" value="0">
						<!--控件设置:当前标记-->
						<param name="defaultFrame" value="0">
						<!--显示默认框架-->
						<param name="invokeURLs" value="0">
						<!--脚本命令设置:是否调用URL-->
						<param name="baseURL" value="">
						<!--脚本命令设置:被调用的URL-->
						<param name="stretchToFit" value="0">
						<!--是否按比例伸展-->
						<param name="volume" value="50">
						<!--默认声音大小0%-100%,50则为50%-->
						<param name="mute" value="0">
						<!--是否静音-->
						<param name="uiMode" value="Full">
						<!--播放器显示模式:Full显示全部;mini最简化;None不显示播放控制,只显示视频窗口;invisible全部不显示-->
						<param name="windowlessVideo" value="0">
						<!--如果是0可以允许全屏,否则只能在窗口中查看-->
						<param name="fullScreen" value="0">
						<!--开始播放是否自动全屏-->
						<param name="enableErrorDialogs" value="-1">
						<!--是否启用错误提示报告-->
						<param name="SAMIStyle" value>
						<!--SAMI样式-->
						<param name="SAMILang" value>
						<!--SAMI语言-->
						<param name="SAMIFilename" value>
						<!--字幕ID-->
						
				</object>
				<div id = "middle_bottom">
				</div>
			</div>
			<!-- 右边查询部分 -->
			<div id = "html_right">
				<form  action="${ctx}/replay/replay_queryByTree" method="post" name="pageForm" id="pageForm" target="replaylist">
			    <input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			    <input type="hidden" name="video_startTime" id="video_startTime" value="${video_startTime}"/>
			    <input type="hidden" name="video_endTime" id="video_endTime" value="${video_endTime}"/>
			    
			    <div id = "right" >
			    	<div id = "right_inner_div" style="margin-right:30px">
			          	<div class = "search" id = "search_first">
							<span>&emsp;&emsp;案件号&nbsp;:&nbsp;</span>
							<input id = "caseNo" name="case_caseNo" value = "${case_caseNo }"  maxlength="50">
						</div> 
						<div class = "search" id="videotype">
			          		<span>&emsp;&emsp;车牌号&nbsp;:&nbsp;</span>
							<input id = "licenseNo" name="case_licenseNo" value = "${case_licenseNo }"  maxlength="50">
						</div> 
						<div class = "search" >
			          		<span>&emsp;&emsp;手机号&nbsp;:&nbsp;</span>
							<input id = "deviceNum" name="video_deviceNum" value = "${video_deviceNum }"  maxlength="50">
						</div> 
			          	<div class = "search">
			          		<span>&emsp;开始时间&nbsp;:&nbsp;</span>
			          		<input readonly = "readonly" id = "starttime"  name="starttime" 
			          		 value="<fmt:formatDate value="${date }" pattern="yyyy-MM-dd 00:00:00" />"
			          		 maxlength = "32" onfocus = "WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
						</div> 
			          	<div class = "search">
			          		<span>&emsp;结束时间&nbsp;:&nbsp;</span>
							<input readonly = "readonly" id = "endtime"  name="endtime" 
							 value="<fmt:formatDate value="${date }" pattern="yyyy-MM-dd 23:59:59" />"
							 maxlength = "32"  onfocus = "WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
						</div> 
					</div>	
					<div>
						<img id = "search_img" src="${ctx}/msplatform/images/common/search.gif" onclick = "search()"/>
					</div>
		    	</div>
		    	</form>
		    	<div id = "replaylist_div">
		    		<div style = "margin: 0px; background: #CBD4E2; width: 100%; height: 20px; border: 1px solid #B7C1CE"></div>
		    		<iframe name="replaylist"  class="replayListFrame"  id = "replaylist" src="${ctx}/replay/replay_queryByTree?treeNodeId=${treeNodeId}"  width = 100%  framespacing = "0" framepadding = "0" border = "0" frameborder = "0" scrolling = "yes"></iframe>
				</div>
			</div>
	</div>
  </body>
</html>






