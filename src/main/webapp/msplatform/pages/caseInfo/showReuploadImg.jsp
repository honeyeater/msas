<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<%

String uuid = (String)request.getParameter("uuid");
String caseUuid = (String)request.getParameter("caseUuid");
request.setAttribute("uuid",uuid);
request.setAttribute("caseUuid",caseUuid);



%>

<html>
<head>
	<title>photo</title>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/caseInfo/showReuploadImg.js"></script>	
</head>


<body onload="init('${uuid }','${caseUuid }')">
	<table cellpadding="0" cellspacing="0" border="0" align="center"
		width="100%">
		<tr align="center">
			<td align="center" height="610">
				<img alt="照片" width="600" height="450" id="pic"
					name="img" align="middle"	src="">
			</td>
		</tr>
		<tr align="center">
			<td>
				<input type="button" value="左旋" onclick="rotateImage_shun()">
				<input type="button" value="上一页" onclick="pageChange(0)">
				<span id="pager"></span>/
				<span id="totalPager"></span>
				<input type="button" value="下一页" onclick="pageChange(1)">
				<input type="button" value="右旋" onclick="rotateImage_ni()">
			</td>
		</tr>
	</table>
</body>
</html>
