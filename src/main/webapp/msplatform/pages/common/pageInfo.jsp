<%@ page language="java" pageEncoding="UTF-8"%>
<%--  
分页使用说明：
1.action中要有一个属性，名字为pageInfo，pageInfo是com.github.pagehelper.PageInfo
2.传给action的页码的name是currentPage。
3.使用的页面form的id 和name要为pageForm。
4.使用的页面要有一个隐藏域，如下：
   <input type="hidden" name="currentPage" id="currentPage" value="${pageInfo.pageNum }"/>
   
5.使用的地方使用静态包含，如下：
  <%@include file="/msplatform/pages/common/pageInfo.jsp" %>   
 --%>
 <html>
<head>
	<title>用户管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
</head>
<script type="text/javascript">
	  $(function(){
	  	//翻页事件
	  	$("#changePage a").each(function(){
	  		$(this).click(function(){
	  			var currentPage = $(this).attr("href");
	  			$("#currentPage").val(currentPage);
	  			var a = document.getElementById("pageForm");
	  			$("#pageForm").submit();
	  			return false;
	  		});
	  	});
	  	
	  	//增加、批量删除按钮显示
	  	//得到页面类别
		var jspType = $("#jspType").val();
	  	if(null != jspType){
	  		if(jspType.indexOf("companyList")>-1 || jspType.indexOf("versionList")>-1){
		  		$(".btu_del").css("display", "none");
		  	}
	  		if(jspType.indexOf("locationList")>-1 && "1"!=$("#treeFlag").val()){
	  			$(".two_btu").css("display", "none");
	  		}
	  	}else {
	  		$(".two_btu").css("display", "none");
	  	}
	  	
	  });
	  
/**添加对象信息*/
function addObj(){
	//得到页面类别
	var jspType = $("#jspType").val();
	//根据不同的页面提供不同的增加操作
	if(jspType.indexOf("userList")>-1){
		addUser();
	}else if(jspType.indexOf("checkUserList")>-1){
		addCheckUser();
	}else if(jspType.indexOf("companyList")>-1){
		addCompany();
	}else if(jspType.indexOf("locationList")>-1){
		addLocation();
	}else if(jspType.indexOf("versionList")>-1){
		addVersion();
	}
}
	  
/**	根据checkBox勾选项，删除信息*/
function deleteCheckBoxsObj(){
	//得到页面类别	
	var jspType = $("#jspType").val();
	if(jspType.indexOf("userList")>-1){
		deleteSelectCheckBoxs();
	}else if(jspType.indexOf("checkUserList")>-1){
		deleteSelectCheckUser();
	}else if(jspType.indexOf("locationList")>-1){
		deleteSelectCheckBoxs();
	}
}
	  
</script>
<div style="position:relative;">
<table width="535"  height="30"
	border="0" cellspacing="0" cellpadding="0" class="page_tab">
	<tr id="changePage" align="right">
		<td width="220"></td>
		<td width="180">
		<!--判断是否有上一页，如果有就显示连接-->
		<c:if test="${pageInfo.hasPreviousPage == true}">
			<a href="1" style="color:#0079ff;">首页</a>&nbsp;&nbsp;&nbsp;
			<a href="${pageInfo.pageNum-1}" style="color:#0079ff;">上一页</a>
		</c:if>

		<!--判断是否有上一页，如果没有就显示文字-->
		<c:if test="${pageInfo.hasPreviousPage == false}">
			首页&nbsp;&nbsp;&nbsp;
			上一页&nbsp;&nbsp;&nbsp;
		</c:if>

		<!--判断是否有下一页，如果有就显示连接-->
		<c:if test="${pageInfo.hasNextPage == true}">
			<a href="${pageInfo.pageNum+1}" style="color:#0079ff;">下一页</a>&nbsp;&nbsp;&nbsp;
			<a href="${pageInfo.total}" style="color:#0079ff;">尾页</a>
		</c:if>

		<!--判断是否有下一页，如果没有就显示文字-->
		<c:if test="${pageInfo.hasNextPage == false}">
			下一页&nbsp;&nbsp;&nbsp;
			末页
		</c:if>
		</td>
		<td>第${pageInfo.pageNum}页/共${pageInfo.pages}页</td>
	</tr>
</table>
<div class="two_btu"><input type="button" value="增加" onClick="addObj()">
		<input type="button" id="pageInfoButDel" value="删除" class="btu_del" onClick="deleteCheckBoxsObj()"></div>
</div>
