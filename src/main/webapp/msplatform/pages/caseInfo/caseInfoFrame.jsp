<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="${ctx}/msplatform/ui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${ctx}/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
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
				 $(".iframe1").height($(window).height());
			});
        </script> 
    </head>
    
     <body style="padding:2px">  
      <div id="layout1">
      		<!-- 左侧树型 -->
            <div position="left" title="组织机构">
          <table width="185" height="100%" border="0" cellspacing="0" cellpadding="0" style="">
              <tr>
                <td><iframe  src="${ctx}/msplatform/pages/company/companyTree.jsp?type=caseInfo&comType=1&locationId=0002"
                 frameborder="0" class="iframe1" name="Menu" id="Menu"></iframe></td>
              </tr>
            </table>
            </div>
            <!-- 区域管理 -->
            <div position="center" title="案件管理" >
            <iframe  src="${ctx}/caseInfo/caseInfo_queryByTree"  
            	 frameborder="0" class="iframe2" name="Main" id="FrameInfo"></iframe>
            </div>
        </div> 
    </body>
</html>

