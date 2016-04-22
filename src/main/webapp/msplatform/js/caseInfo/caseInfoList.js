
/**查询案件信息*/
function caseSearch(){
	var query_caseNo = $("#query_caseNo").val();
	$("#export_caseNo").val(query_caseNo);
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
}

function changeStatus(){
	var caseStatus = $("#caseStatus").val();
	var query_caseNo = $("#query_caseNo").val();
	$("#export_caseNo").val(query_caseNo);
	$("#export_caseStatus").val(caseStatus);
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
}

function exportExcel(){
	var export_caseNo = $("#export_caseNo").val();
	var export_caseStatus = $("#export_caseStatus").val();
	var treeNodeId=$("#treeNodeId").val();
	var currentPage=$("#currentPage").val();
	location.href = contextRootPath + "/caseInfo/caseInfo_exportInfoExcel?treeNodeId="+treeNodeId+"&currentPage="+currentPage
	+"&export_caseNo="+export_caseNo+"&export_caseStatus="+export_caseStatus;
}