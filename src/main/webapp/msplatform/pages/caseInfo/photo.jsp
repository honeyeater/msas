<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@page import="java.util.Date"%>
<%@page import="com.sinosoft.msplatform.domain.PrpmUploadImg"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("date", new Date());	
%>
<html>
<head>
	<title>照片管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/msplatform/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery.ztree.core-3.5.js"></script>
	<script src="${ctx}/msplatfrom/ui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/msplatfrom/ui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/common/xmlhttp.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/My97DatePicker/WdatePicker.js"></script>	
	<script type="text/javascript" src="${ctx}/msplatform/js/caseInfo/photo.js"></script>
	<script type="text/javascript">
		function loadImg(){
			var ossUrl = "${ctx}/uploadImg/uploadImg_showPhotos?ossUuid=";
			$("input[name='imgOssUuid']").each(function(){
				$(this).siblings("img").attr("src", ossUrl+$(this).val());
			});
		}
	</script>
</head>

<body class="body1" onload="loadImg()">
	<form action="${ctx}/uploadImg/uploadImg_queryByTree" method="post" name="pageForm" id="pageForm">
		<table class="table">
			<!-- 隐藏域 -->
			<input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId }"/>
			<tr >
				<td>					
					<table class="table1" cellspacing="0px">
						<tr>
							<td class="td2">&nbsp;&nbsp;&thinsp;&thinsp;案件号：<input type="text" name="upload_caseNo"
								id="upload_caseNo" value="${upload_caseNo }"></td>
								
							<td class="td2">&nbsp;&nbsp;&thinsp;&thinsp;车牌号：<input type="text" name="upload_licenseNo"
								id="upload_licenseNo" value="${upload_licenseNo }"></td>
							<td class="td2" style="border-right:1px solid #ccc;">&nbsp;&nbsp;&nbsp;手机号：<input type="text" name="deviceNum"
								id="deviceNum" value="${deviceNum }" ></td>
						</tr>
						<tr>
							<td class="td2">开始时间：<input type="text" name="upload_createTime"
								id="upload_createTime" value="<fmt:formatDate value="${upload_createTime }" pattern="yyyy-MM-dd HH:mm:ss" />"
								onfocus="checkSelectValue()" ></td>
								
							<td class="td2">结束时间：<input type="text" name="upload_endTime"
								id="upload_endTime" value="<fmt:formatDate value="${upload_endTime }" pattern="yyyy-MM-dd HH:mm:ss" />" 
								onfocus="checkSelectValue()" ></td>
							<td class="td2" style="border-right:1px solid #ccc;"></td>
							<td class="td2" style="padding-left:10%"><input type="button"
								onclick="searchUpload();" value="查询" class="cx"/>
							</td>
						</tr>
						<tr>		
							<td height="10">&nbsp;</td>
						</tr>	
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<div align="left" style = "float: left; height: 24px; 
							width: 20% ;font-size: 12px;color: #646465">
					*双击缩略图预览原始图片  
					</div>
					<table class="table2" cellspacing="0" cellpadding="0">
						<tr class="tr_title">
							<td align="center" width="6%">序号</td>
							<td align="center" width="10%">缩略图</td>
							<td align="center" width="10%">上传时间</td>
							<td align="center" width="14%">案件号</td>
							<td align="center" width="10%">车牌号</td>
							<td align="center" width="10%">手机号</td>
							<td align="center" width="6%">下载</td>
							<td align="center" width="10%">转移图片</td>
							<td align="center" width="6%">删除</td>
							<td align="center" width="6%">锁定</td>
						</tr>
						<c:forEach items="${uploadImgList}" var="uploadImg" varStatus="index">
							<tr id='bg'   class="piceach">
								<td>${index.index+1 }</td>
								<td ><img alt="照片" src="${ctx}/msplatform/images/common/load.gif" name="img"
										 width="58" height="44" 
										 ondblclick="showPhoto('${uploadImg.ID }','${uploadImg.caseUuid }')">
										 <input type="hidden"  name="picId"    value="${uploadImg.ID }" />
									<input type="hidden" name="imgOssUuid" value="${uploadImg.ossUuid }">
								</td>
								<td ><fmt:formatDate value="${uploadImg.uploadTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td name="caseNoSpan">${uploadImg.caseNo }</td>
								<td name="licenseNoSpan">${uploadImg.licenseNo }</td>
								<td >${uploadImg.mobile }</td>
								<td ><a class="img_button2"
									onclick="download(${uploadImg.ID})" >下载</a></td>
								<td ><a class="img_button2"
									onclick="movePhoto('${uploadImg.mobile }',${uploadImg.ID},this)" >转移图片</a></td>
								<td ><a class="img_button2"
									onclick="deletePhoto(${uploadImg.ID},${index.index })" >删除</a></td>
								<td>
								<c:if test="${uploadImg.lockFlag==1}">
									<input type="checkbox" id="suoding"	name="suoding" checked="checked"
											 onclick="changeBox(this,${uploadImg.ID})" /></td>
								</c:if>
								<c:if test="${uploadImg.lockFlag!=1}">
									<input type="checkbox" id="suoding"	name="suoding" 
											 onclick="changeBox(this,${uploadImg.ID})" /></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
		 <br>
			<div>
					<c:if test="${fn:length(uploadImgList) > 0}">
						<input class="img_button2Link"  type="button" value="打包下载" onclick="someDownload()">
					</c:if>
			</div>
					
	</form>
	
	<%@include file="/msplatform/pages/common/pageInfo.jsp" %>,
</body>
</html>
