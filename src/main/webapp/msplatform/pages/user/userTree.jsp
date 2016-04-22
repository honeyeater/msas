<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<link rel="stylesheet"
	href="${ctx}/msplatform/zTreeStyle/zTreeStyle.css" type="text/css" />
<link rel="stylesheet"
	href="${ctx}/msplatform/zTreeStyle/zTreeMain.css" type="text/css" />
	
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/jquery.ztree.core-3.5.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/zTreeStyle/zTreeMain.js"
	type="text/javascript"></script>

<table>
	<tr>
		<td>
			<div class="searchDiv">
				<input type="text" id="key" value="" class="searchKey" onkeydown="keydown(event)" /> 
				<input type="button" value="查询" onclick="search()" class="searchButton" >
			</div>
			<div>
				<table id="TreeTable">
					<tr>
						<td>
							<ul id="treeBody" class="ztree">
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>


