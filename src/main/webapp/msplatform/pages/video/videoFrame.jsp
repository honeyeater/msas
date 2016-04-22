<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>

	<link href="${ctx}/msplatform/ui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/video/videoFrame.js" type="text/javascript"></script>
	
</head>

<body style="padding:2px; position:relative;" onload="initView();">
	<div id="layout1"  class="layout1">
		<!-- 左侧树型 -->
	    <div position="left" title="组织机构" >
          	<table width="185" height="70%" border="0" cellspacing="0" cellpadding="0"  style="background-color: #fff;">
              	<tr><td>
              	<iframe src="${ctx}/msplatform/pages/caseInfo/videoTree.jsp?type=video"
                 	border="0"   frameborder="0"   width="200"  style="display:block;" scrolling="auto" name="Menu" id = "Menu"></iframe></td>
              	</tr>
            </table>
    		<div style=" width:100%; height:100%; background-color:#fff;" class="div_task">
				<h3 color="#666161" style="font-size: 12px;padding-left:5px;">当前任务：</h3>
				<div id="chulicase" class="task_con">
				</div>
			</div>
        </div>
         <!-- 中间播放 -->
		<%@ include file="/msplatform/pages/video/middle.jsp"%>
	    <div position="right" title="操作" class="rightH">
			<table height="100%">
				<tr>
					<td><iframe frameborder="0" src=""
						class="iframe3" id="handle" name="handle" scrolling="no"></iframe>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
	<script type="text/javascript">
		function initView(){
			$("#layout1").ligerLayout({ leftWidth: 200 ,allowLeftCollapse:false,allowRightCollapse:false,allowBottomResize: false, allowLeftResize: false,rightWidth:250});
			var frameHeight =  document.getElementById("layout1").offsetHeight;
			$(".iframe3").height(frameHeight-30);
			
			initLayout();//页面布局
			//unFinishedTask();//上次未处理完成的案子
			handle.src = contextRootPath + "/msplatform/pages/video/video_handle.jsp";
			handle.window.location.href = contextRootPath + "/msplatform/pages/video/video_handle.jsp";
			
			//设置视频模式
			setVideoMode();
			//设置视频窗口句柄
			initalVideo();
			initViewHW();
		}
	
       	//页面布局
       	/**
		$(function (){
			$("#layout1").ligerLayout({ leftWidth: 200 ,allowLeftCollapse:false,allowRightCollapse:false,allowBottomResize: false, allowLeftResize: false,rightWidth:250});
			var frameHeight =  document.getElementById("layout1").offsetHeight;
			$(".iframe3").height(frameHeight-30);
		});
		**/
    </script>
    <script for="destView" event="ScreenCaptured(result,cx,cy,width,height)" language="JavaScript">
		     OncreenCaptured(result,cx,cy,width,height);  			
	</script>
</html>

