
/**新增公司信息*/
function addCompany(){
	var oldAction = pageForm.action;
	pageForm.action = contextRootPath + "/company/company_beforeAdd";
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
	pageForm.action = oldAction;
}

/**获取需要修改的公司信息*/
function editCompany(companyId){
	var treeNodeId = $("#treeNodeId").val();
	var treeNodeName = $("#treeNodeName").val();
	var treeFlag = $("#treeFlag").val();
	location.href = contextRootPath + "/company/company_edit?companyId="+companyId+"&treeNodeId="+treeNodeId+"&treeNodeName="+treeNodeName+"&treeFlag="+treeFlag;
}

/**删除公司信息*/
function deleteCompany(companyId){
	var treeNodeId = $("#treeNodeId").val();
	var treeNodeName = $("#treeNodeName").val();
	var treeFlag = $("#treeFlag").val();
	
	//判断分公司下是否存在用户，若存在不能删除并提示
	var exitsUser = false;//默认不存在
	var usetype = "";
	var checkURL = contextRootPath + "/company/company_checkExitsUser?companyId="+companyId;
	$.ajax({
		type : "POST",
		url : checkURL,
		async : false,
		success : function(data) {
			if(data.indexOf("存在")>-1){
				exitsUser = true;
				usetype = (data.split("\,"))[1];
			}
		}
	});
	if(confirm("你确定删除这个公司吗？")){
		if(exitsUser){
			alert("公司下有"+usetype+"不能进行删除，请先删除"+usetype+"！");
		}else {
			location.href = contextRootPath + "/company/company_delete?companyId="+companyId+"&treeNodeId="+treeNodeId+"&treeNodeName="+treeNodeName+"&treeFlag="+treeFlag;
		}
	}
}
