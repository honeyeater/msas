/**查询结算案件信息*/
function caseSearch(){
	var exportcost_caseNo = $("#query_caseNo").val();
	$("#exportcost_caseNo").val(exportcost_caseNo);
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
}

function exportExcel(){
	var treeNodeId=$("#treeNodeId").val();
	var currentPage=$("#currentPage").val();
	var exportcost_caseNo = $("#exportcost_caseNo").val();
	location.href = contextRootPath + "/caseInfo/caseInfo_exportCostExcel?treeNodeId="+treeNodeId
	+"&currentPage="+currentPage+"&exportcost_caseNo="+exportcost_caseNo;
}