<%@page import="com.sinosoft.msplatform.fileupload.OssManage"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx }/msplatform/js/common/jquery.ui.core.js"></script>
	<script type="text/javascript" src="${ctx }/msplatform/js/common/jquery.ui.widget.js"></script>
	<script type="text/javascript">
		//回放
		function replay(remark){
			window.parent.getUrl(remark);
		}
		
		//下载
		function download(dataPath,videoName){
			location.href = "${ctx}/replay/replay_replayDownload?dataPath="+dataPath+"&videoName="+videoName;
		}
	
		$(function(){
			var case_caseNo = $("#caseNo",parent.document).val();
			var case_licenseNo = $("#licenseNo",parent.document).val();
			var video_deviceNum = $("#deviceNum",parent.document).val();
			var video_startTime = $("#starttime",parent.document).val();
			var video_endTime = $("#endtime",parent.document).val();
			$("#case_caseNo").val(case_caseNo);
			$("#case_licenseNo").val(case_licenseNo);
			$("#video_deviceNum").val(video_deviceNum);
			$("#video_startTime").val(video_startTime);
			$("#video_endTime").val(video_endTime);
		})
	</script>
  </head>
  
  <body>      
  	  <div id = "out_div" style = "position: absolute; z-index: 100; left: 0px; top: 0px; margin: 0px; padding: 0px; width: 330; ">
   		  	<form  action="${ctx}/replay/replay_queryByTree" method="post" name="pageForm" id="pageForm" >
   		  	<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
   		  	<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
	  		<input type="hidden" name="case_caseNo" id="case_caseNo" value=""/>
   		  	<input type="hidden" name="case_licenseNo" id="case_licenseNo" value=""/>
   		  	<input type="hidden" name="video_deviceNum" id="video_deviceNum" value=""/>
   		  	<input type="hidden" name="video_startTime" id="video_startTime" value=""/>
			<input type="hidden" name="video_endTime" id="video_endTime" value=""/>
   		  	<table  class="table2" cellspacing="0" cellpadding="0" style = "width: 810px;" >
   				<tr class="tr_title">
   					<td width = "50px" height = "15px" align="center">序号</td>
   					<td width = "50px">&nbsp;播放</td>
   					<td width = "50px">&nbsp;下载</td>
   					<td align="center">案件号</td>
   					<td align="center">车牌号</td>
   					<td align="center">开始时间</td>
   					<td align="center">结束时间</td>
   					<td align="center">文件的类型</td>
   					<!-- <td align="center">文件的大小</td> -->
   				</tr>
   				<c:forEach items="${replayDtos}" var="replayDto" varStatus="index">
					<tr>
	   					<td >${((pageInfo.pageNum-1)*pageInfo.pageSize)+index.index+1 }</td>
	   					<td nowrap="nowrap"><a class="img_button2" onclick="replay('${replayDto.remotePath }')" >播放</a></td>
	   					<td nowrap="nowrap"><a class="img_button2" onclick="download('${replayDto.dataPath }','${replayDto.videoName }')" >下载</a></td>
	   					<td >${replayDto.caseNo }</td>
	   					<td >${replayDto.licenseNo }</td>
	   					<td ><fmt:formatDate value="${replayDto.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	   					<td ><fmt:formatDate value="${replayDto.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	   					<td >${replayDto.fileType }</td>
	   					<!-- <td >
	   						<c:if test="${replayDto.videoSize < 1024}">
	   							<fmt:formatNumber value="${replayDto.videoSize }"  pattern="0"/>KB
	   						</c:if>
	   						<c:if test="${replayDto.videoSize >= 1024}">
	   							<fmt:formatNumber value="${replayDto.videoSize/1024 }"  pattern="0.0"/>MB
	   						</c:if>
	   					</td> -->
					</tr>	   				
   				</c:forEach>
	      	</table>
	      	</form>
	      	<%@include file="/msplatform/pages/common/pageInfo.jsp" %>
	      </div>
</FORM>	
  </body>
</html>


