<%@page import="com.sinosoft.msplatform.domain.PrpmUser"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<head>
	<title>补全照片</title>
	<link href="${ctx}/msplatform/ui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/frame.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/slider.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/control.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/msplatform/css/css.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${ctx}/msplatform/css/caseInfo/caseCommon.css" type="text/css">
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/upload.css" type="text/css">
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/caseInfo/reuploadImg.js"></script>
	<script type="text/javascript"  src="${ctx}/msplatform/js/common/checkBox.js" ></script>
	<script type="text/javascript">
		$(function(){
			var winH= $("html").height();
			$("#picbody").height(winH-60);
			setTimeout("styleAdjust()", 1000);
		});
		function styleAdjust(){
			var winH= $("html").height();
			$("#picbody").height(winH-60);
		}
	</script>
</head>

<body >
	<div id="PicDiv">
		<div id="picture2">
			<table class="title" cellspacing="0" cellpadding="0">
				<tr class="tr_title">
					<td class="td_box"><input type="checkbox" name="all_box" onclick="selectAll(this);"></td>
					<td class="td_img"><span class="spans">缩  略  图</span></td>
					<td class="td_time"><span class="spans">拍摄时间</span></td>				
				</tr>
			</table>
		</div>
		<div id="picbody">
			<table class="table_img">
				<c:forEach items="${reUploadImgList }" var="reUpload">
					<tr class="tr_photo1">
						<td class="td_box"><input type="checkbox" name="index_box"
							onclick="checkAllBox(this);" value="${reUpload.uuid }" /> </td>
						<td class="td_img"><img name="img" src="${ctx}/uploadImg/uploadImg_showPhotos?ossUuid=${reUpload.ossUuid }"
							ondblclick="showPhoto('${reUpload.uuid }','${reUpload.caseUuid }')"
							style="vertical-align:middle;width: 80px;height: 65px "
							title="图片名称：&#10;${reUpload.imgName }&#10;，图片拍摄时间：<fmt:formatDate value="${reUpload.shotTime }" pattern="yyyy-MM-dd HH:mm:ss"/>" />
						</td>
						<td class="td_time"><fmt:formatDate
								value="${reUpload.shotTime }" pattern="yyyy-MM-dd" /><br /> <fmt:formatDate
								value="${reUpload.shotTime }" pattern="HH:mm:ss" />
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="picfoot" style="padding-left:20px;">
			<div class="btnDiv1" style="display:none"><input type="button" value="图片下载" class="img_button2" /></div>
			<div class="btnDiv1" style="margin-right:20px;"><input type="button" value="打包下载" class="img_button2" onclick="downloadAllPicToZIP();"/></div>
			<div class="btnDiv1"><input type="button" value="删    除 " class="img_button2 del" onclick="deletePhoto();"/></div>
		</div>
	</div>
</body>


