function imageCheck(){
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
}

function changeDealFlag(){
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
}

function caseDetail(caseUuid, dealFlag){
	location.href = contextRootPath + "/caseInfo/caseInfo_imageCaseDetail?imgCheck_caseUuid="+caseUuid+"&imgCheck_dealFlag="+dealFlag;
}