<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>

	<link href="${ctx}/msplatform/ui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${ctx}/msplatform/css/zTreeStyle/zTreeStyle.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/ui/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript">
       	//页面布局
		$(function (){
				$("#layout1").ligerLayout({ leftWidth: 200 ,allowLeftCollapse:false,allowRightCollapse:false,allowBottomResize: false, allowLeftResize: false,rightWidth:250}); 
				var frameHeight =  document.getElementById("layout1").offsetHeight;
				$("#picture").height(frameHeight-30);
		});
    </script>

</head>

<body style="padding:2px; class="body_Bg">
	<div id="layout1">
		<!--案件跟踪 -->
		<div position="center" title="补全案件">
			<iframe src="${ctx}/caseInfo/caseInfo_findReloadPic" frameborder="0"
				class="iframe2" name="Main" id="FrameInfo"></iframe>
		</div>
		<div position="right" title="补传照片">
			<table height="100%">
				<tr>
					<td><iframe src="${ctx}/msplatform/pages/caseInfo/reuploadImg.jsp" frameborder="0"
						class="iframe3" id="picture" name="picture" scrolling="no"></iframe>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

