<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ page import="com.sinosoft.msplatform.domain.PrpmUser"%>
<html>
<head>
	<title>操作</title>

	<link href="${ctx}/msplatform/ui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/frame.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/slider.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/control.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/css.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${ctx}/msplatform/css/caseInfo/caseCommon.css" type="text/css">
	<style type="text/css">
		#picture2{
			height:30px;
		}
		#picbody{
			height:206px;
			overflow-y:auto; 
		}
		#picfoot{
			width:100%;
			margin:0 auto;
			height:30px;
		}
		#picfoot .btnDiv1{
			float:left;
			width:90px;
			text-align:center;
		}
		#picfoot .btnDiv2{
			padding-left:5px;
			float:left;
			width:70px;
			text-align:center;
		}
		.title {
			width: 100%;
			height: 29px;
			border: none;
			font-size: 14px;
			color: #646465;
			text-align:center;
			background-color: #fff;
			jerry: expression(cellSpacing ="1");
			padd:expression(this.cellPadding="0");
			border-top:1px solid #ccc; border-left:1px solid #ccc;
		}
		.title tr td {border-bottom:1px solid #ccc; border-right:1px solid #ccc;}
		.tr_title td{
			border-bottom:#ccc 1px solid;
		}
		.tr_title td.td_box{
			width:30px;
		}
		.tr_title td.td_img{
			width:100px;
		}
		.table_img {
			width: 100%;
			height: 49px;
			border: none;
			font-size: 14px;
			color: #646465;
			text-align:center;
			background-color: #fff;
			jerry: expression(cellSpacing ="1");
			padd:expression(this.cellPadding="0");
			border-left:1px solid #ccc;
		}
		.table_img tr td {border-bottom:1px solid #ccc; border-right:1px solid #ccc;}
		.table_img .tr_photo1 td.td_box{
			width:30px;
		}
		.table_img .tr_photo1 td.td_img{
			padding:0px;
			width:100px;
		}
		.table_img .tr_photo1 td.td_img img{
			margin:0px;
			width:40px;
			height:38px;
		}
		#picfoot .btnDiv1 input{
			background:url(../../images/common/icon-2.png) no-repeat 0px -50px;
		}
		#picfoot .btnDiv2 input{
			background:url(../../images/common/icon-2.png) no-repeat 0px -100px;
		}
	</style>
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/map.js"></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/common/checkVideo.js" ></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/video/video_handle.js"></script>
</head>

<body  id="bodyHeight" onload="styleAdjust();">
<div position="right"  id="rightDemo" >
	
	<div id="right_div1" >
		<div id="PresetTitle" style="padding-top:2px;padding-bottom:2px; height:30px; background-color:#f6f6f6;">
			<span id="spanPic" style="width:40%; line-height:30px; padding-left:15px; display:block; float:left; color:#999;">
				&nbsp;图片信息&nbsp;&nbsp;&nbsp;<img style="width:12px;height:15px;" src="${ctx }/msplatform/images/video/refresh.png" onclick="refreshImg();"/>
			</span> 
			<!-- <span  id="spanSys" style="width:25%; background:url(../../images/common/right_jt.jpg) no-repeat right center; display:block; float:right;  margin-right:10px; color:#0079ff; height:30px; line-height:30px; cursor:pointer;" class="spanInfo">				
				系统信息 </span> <span id="spanImg"
				style="display:none"> &nbsp;&nbsp; </span> -->
		</div>
		<div id="PicDiv">
			<div id="picture2">
				<table class="title" cellspacing="0" cellpadding="0">
					<tr class="tr_title">
						<td class="td_box"><input type="checkbox" name="all_box" onclick="selectAll(this);"></td>
						<td class="td_img"><span class="spans">缩  略  图</span></td>
						<td class="td_time"><span class="spans">拍摄时间</span></td>				
					</tr>
				</table>
				<!-- ------------2015-09-17add from reuploadImg.jsp------------------------- -->
				<!-- ------------------------------------------------------------------ -->
			</div>
			<div id="picbody">
				
			</div>
			<div id="picfoot" style="padding-left:20px;">
				<div class="btnDiv1" style="display:none"><input type="button" value="图片下载" class="img_button2" /></div>
				<div class="btnDiv1" style="margin-right:20px;"><input type="button" value="打包下载" class="img_button2" onclick="downloadAllPicToZIP();"/></div>
				<div class="btnDiv1"><input type="button" value="删    除 " class="img_button2 del" onclick="deletePhoto();"/></div>
			</div>
		</div>
		<div id="SysDiv" style="overflow: hidden; display:none">
			<div id="tabDIV" style="overflow:auto;">
				<table width="100%" cellspacing="1" cellpadding="3"
					style="padding-top:2px;" id="SysPicList">
					<tr style="display:none">
						<td height="18"></td>
						<td align="right"></td>
					</tr>
				</table>
			</div>
			<div align="right" style="height:25; padding-top:2px">
				<input style="cursor:hand; padding-top:2" type="button" value="清除信息"
					id="EhomeStartButton" onmouseover="this.className='btn1_mouseover'"
					onmouseout="this.className='btn1_mouseout'" title="处理以上所有信息"
					class="btn1_mouseout" onclick="DealPic()" />&nbsp;&nbsp;
			</div>
		</div>
	</div>	
	<div >
		<div style="display:none">
		<OBJECT id="Player" classid="clsid:6BF52A52-394A-11d3-B153-00C04F79FAA6" width=0 height=0 > 
			<param name="URL" value="${ctx}/msplatform/My97DatePicker/music/20S.wav" /> 
			<param name="AutoStart" value="false" /> 
		</OBJECT>
		</div>
		<h3 style="background-color:#f6f6f6; height:30px; line-height:30px; color:#999; position:relative;">
		&nbsp;&nbsp;&nbsp;&nbsp;调度信息 <img id="alarms" style="cursor: pointer" alt="是否静音"
			src="${ctx}/msplatform/images/tb2/alarm.gif" onclick="controlMusic();" /><a
			style="text-decoration: none; background:url(../../images/common/right_jt.jpg) no-repeat right center; width:40px; line-height:30px; display:block; position:absolute;top:2px; right:10px; cursor:pointer;" class="More">更多</a>
		</h3>		
		<div class="controlInfo"  style="height:155px" >
		</div> 	
		<div id="right_div4"  style="border: #E3E3DB solid 0px; background: #fff ; padding: 2px auto; width: 100%;height: 26px;">
				<div align="center">
					<input style=" cursor:pointer; padding-top:2;background:white; color:#0079ff ;border:1px solid #0079ff"  type="button" value="  离开  "
						id="StatusButton2" 
						onclick="SetLeave()" />&nbsp;&nbsp; <input
						style="cursor:pointer;  padding-top:2;background:white; color:#0079ff ;border:1px solid #0079ff"  type="button" value="  有空  "
						id="StatusButton0" 
						onclick="Setfree()" />&nbsp;&nbsp; <input
						style="cursor:pointer;  padding-top:2;background:white; color:#0079ff ;border:1px solid #0079ff"   type="button" value="  繁忙  " 
						id="StatusButton1" />&nbsp;&nbsp;
				</div>
		</div> 
	</div>
</div>
<!-- -------调度信息弹层-------- -->
<div class="dd_info" style="display:none;">
	<h3>调度信息<a class="close"></a></h3>
	<div id="dd_content">
	</div>
	<div class="closeBtn"><input type="button" value="关闭窗口"></div>
</div>
<!-- ---------系统信息弹层------------ -->
<div class="sysInfo" style="display:none;">	
	<h3>系统信息<a class="close"></a></h3>
	<p style="padding-left:15px;">共10条信息</p>
	<p class="clockT">开启铃声时间</p>
	<ul class="ul_time">
		<li>2015-09-09&nbsp;&nbsp;&nbsp;11:05:54</li>
		<li>2015-09-09&nbsp;&nbsp;&nbsp;11:05:54</li>
		<li>2015-09-09&nbsp;&nbsp;&nbsp;11:05:54</li>
		<li>2015-09-09&nbsp;&nbsp;&nbsp;11:05:54</li>
		<li>2015-09-09&nbsp;&nbsp;&nbsp;11:05:54</li>
		<li>2015-09-09&nbsp;&nbsp;&nbsp;11:05:54</li>
		<li>2015-09-09&nbsp;&nbsp;&nbsp;11:05:54</li>
	</ul>
	<div class="closeBtn"><input type="button" value="清除信息"><input type="button" value="关闭窗口"></div>
</div>
<div style="display:none"><iframe id="blankFrame" name="blankFrame"></iframe></div>
</body>
<script>
	//页面布局
	function styleAdjust(){
		var frameHeight =  document.getElementById("rightDemo").offsetHeight;
		var right_div1 =  document.getElementById("right_div1").offsetHeight;
		var bodyHeight =  document.getElementById("bodyHeight").offsetHeight;
		if(($(window).height() - 90 - 4 - 195 - 25)>0){
			document.getElementById("picbody").style.height =  ($(window).height() - 90 - 4 - 195 - 25) + "px";
		}
	}

	$(".More").click(function(){
		var H=$(window).height();		
		if($(".dd_info").height()>H-10){
			$(".dd_info").css("overflow-y","auto");
		}
			$(".dd_info").height(H);
			$(".dd_info").show().animate({right:'0px'});
	});
	
	$(".closeBtn>input,.close").click(function(){
		$(".dd_info,.sysInfo").hide(0).animate({right:'-258px'});
		});
	
	$(".spanInfo").click(function(){
		var H=$(window).height();		
		if($(".sysInfo").height()>H-10){
			$(".sysInfo").css("overflow-y","auto");
		}
			$(".sysInfo").height(H-10);
			$(".sysInfo").show().animate({right:'0px'});
	});
</script>
</html>



