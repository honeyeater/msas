<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>用户管理</title>
<script type="text/javascript">
    var ieVersiuon;//定义全局变量
	getBrowserVersion();
	function getBrowserVersion() {//ie版本检测
		var userAgent = navigator.userAgent.toLowerCase();
		if (userAgent.match(/msie ([\d.]+)/) != null) {//ie6--ie9 
		
			uaMatch = userAgent.match(/msie ([\d.]+)/);
			return ieVersiuon ='IE' + uaMatch[1];
		} else if (userAgent.match(/(trident)\/([\w.]+)/)) {
			uaMatch = userAgent.match(/trident\/([\w.]+)/);
			switch (uaMatch[1]) {
			
			case "4.0":
				return ieVersiuon = "ie8.0";
				break;
			case "5.0":
				return ieVersiuon = "ie9.0";
				break;
			case "6.0":
				return ieVersiuon = "ie10";
				break;
			case "7.0":
				return ieVersiuon = "ie11";
				break;//ie11
			default:
				return "undefined";
			}
		}
	}
	function isIE11(ossUuid){//根据ie版本，调用不同的方法
		if (ieVersiuon == "ie11") {
		  openVideoIE11(ossUuid);
	    } else{
	      openVideo(ossUuid);
	    }
	
	}
</script>
<link rel="stylesheet" href="${ctx}/msplatform/css/common/common2.css"
	type="text/css" />
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${ctx}/msplatform/js/caseInfo/imageCaseDetail.js"></script>
<style type="text/css">
.labeltxt {
	font-size: 12;
	color: #646465;
}

.table1 {
	margin-left: 55px;
	width: 80%;
	border: 0;
	jerry: expression(cellSpacing = "0");
	padd: expression(this.cellPadding = "0");
}

td {
	text-align: center;
}

.td2 {
	text-align: left;
	font-size: 12px;
	color: #646465;
	width: 250px;
}

.td2 input {
	width: 148px;
	height: 30px;
	line-height: 28px;
	border: 1px solid #ccc;
}
</style>
</head>

<body>
	<form action="" method="post" name="pageForm" id="pageForm">
		<input type="hidden" id="imgCheck_recontent" name="imgCheck_recontent"
			value="">
		<table class="table1" style="height:30%;">
			<tr class="tr_color">
				<td class="td2">&emsp;&emsp; 案件号&nbsp;:&emsp;<input type="text"
					class="msgInput" value="${imgCheck_caseNo }" readonly="readonly"></td>
				<td class="td2">车牌号&nbsp;:&emsp;<input type="text"
					class="msgInput" value="${imgCheck_licenseNo }" readonly="readonly"></td>
				<td class="td2">被保险人&nbsp;:&emsp;<input type="text"
					class="msgInput" value="${imgCheck_userName }" readonly="readonly"></td>
			</tr>
			<tr class="tr_color">
				<td class="td2">&emsp; 出险时间&nbsp;:&emsp;<input type="text"
					class="msgInput"
					value='<fmt:formatDate value="${imgCheck_dmgDate }" pattern="yyyy-MM-dd HH:mm:ss"/>'
					readonly="readonly"></td>
				<td class="td2">联系人&nbsp;:&emsp;<input type="text"
					class="msgInput" value="${imgCheck_operatorName }"
					readonly="readonly"></td>
				<td class="td2">联系电话&nbsp;:&emsp;<input type="text"
					class="msgInput" value="${imgCheck_contactPhone }"
					readonly="readonly"></td>
				<td class="td2">案件类型&nbsp;:&emsp; <c:forEach var="map"
						items="${CASETYPESMAP }">
						<c:if test="${map.key==imgCheck_caseType}">
							<input type="text" class="msgInput" value="${map.value }"
								readonly="readonly"></td>
				</c:if>
				</c:forEach>
			</tr>
		</table>
		<div style="font-size: 14px;color: #646465;">影像信息</div>
		<c:forEach items="${imgChecklistMap}" var="imgChecklist">

			<div id="pic"
				style="height:10%;align:center;font-size:14px;display:block;clear:both">
				<div
					style="float:left;width:5%;font-size: 12px;color: #646465;margin-top:55px;">
					<c:out value="${UPLOADIMGTYPEMAP[imgChecklist.key]}" />
				</div>
				<c:forEach items="${imgChecklist.value}" var="imgCheck"
					varStatus="index">
					<c:if test="${index.index<7}">
						<c:choose>
							<c:when test="${imgCheck.imgType =='999' }">
								<div style="float:left;width:12%;margin-top:15px;">
									<input type="button" value="点击查看"
										style="width:128px;height:100px;"
										onclick="isIE11('${imgCheck.ossUuid }') ">
									<div class="labeltxt">视频${index.index+1 }</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="piceach"
									style="float:left;width:12%;margin-top:15px;">
									<img alt="照片" src="${imgCheck.ossUuid }" name="img"
										width="128px" height="100px"
										ondblclick="showPhoto('${imgCheck.ID }','${imgCheck_caseUuid }',${imgChecklist.key}) ">
									<input type="hidden" name="picId" value="${imgCheck.ID }" />
									<input type="hidden"  name="picType"  value="${UPLOADIMGTYPEMAP[imgChecklist.key]}" />
									<div class="labeltxt">图片${index.index+1 }</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${imgCheck.imgType !='999' }">
					<c:if test="${index.index>=7}">
					    <div  class="piceach" style="display:none;">
					 		 <img alt="照片" src="${imgCheck.ossUuid }" name="img">
							 <input type="hidden"  name="picId"    value="${imgCheck.ID }" />
							 <input type="hidden"  name="picType"  value="${UPLOADIMGTYPEMAP[imgChecklist.key]}" />
						</div>
					</c:if>
					</c:if>
					<c:if test="${imgCheck.imgType !='999' }">
						<c:if test="${index.index==6 }">
							<div style="float:left;width:9%;text-align:center;">
								<div class="labeltxt" style="margin-top:55px;color:red;">查看更多图片，请双击图片</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>

		</c:forEach>
		<table class="table1" style="margin-left:5%;margin-top:5%;">
			<tr style="height:85px;">
				<td><input type="button" value="打包下载"
					style="font-size:12px;margin-right:5%"
					onclick="downLoadDetails('${imgCheck_caseUuid}','${imgCheck_caseNo }');"
					class="canHandle"> <c:choose>
						<c:when
							test="${imgCheck_dealFlag=='0' and imgCheck_caseStatus==8 }">
							<input type="button" value="处理"
								onclick="handleImgCase('${imgCheck_caseUuid}');"
								class="canHandle">
						</c:when>
						<c:otherwise>
							<input type="button" value="处理" class="canotHandle">
						</c:otherwise>
					</c:choose>&emsp; <c:choose>
						<c:when
							test="${imgCheck_caseStatus == 2 or imgCheck_dealFlag=='1'}">
							<input type="button" value="重派" class="canotHandle">
						</c:when>
						<c:otherwise>
							<input type="button" value="重派"
								onclick="dispatchImgCase('${imgCheck_caseNo }','${imgCheck_caseUuid}');"
								class="canHandle">
						</c:otherwise>
					</c:choose>&emsp; <input type="button" value="返回" onclick="history.back();"
					class="canHandle"></td>
			</tr>
		</table>
	</form>
</body>
</html>

