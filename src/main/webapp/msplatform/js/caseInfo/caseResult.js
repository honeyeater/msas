/** 调用时间插件 */
function checkSelectValue() {
	WdatePicker({
		dateFmt : 'yyyy-MM-dd'
	});
}

/** 根据查询条件，查询信息 */
function checkMsg() {
	var createTime = $("#case_createTime").val();
	var endCaseTime = $("#case_endCaseTime").val();
	if(createTime != '' && endCaseTime != ''){
		if(createTime>=endCaseTime){
			alert("开始时间不能大于或等于结束时间!");
			return false;
		}		
	}

	//记录选中的checkbox状态
	var chks = '';
	$("input[type=checkbox]:checked").each(function() {
		chks += $(this).val() + ",";
	});
	$("#hid").val(chks.substring(0, chks.length - 1));
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
	
}

/** 同意拒绝 */
function userFeedback(uuid,status){
	var content ="";
	
	var case_caseNo = $("#case_caseNo").val();
	var case_contactPhone = $("#case_contactPhone").val();
	var case_licenseNo = $("#case_licenseNo").val();
	var case_createTime = $("#case_createTime").val();
	var case_endCaseTime = $("#case_endCaseTime").val();
	var caseStatusBox = $("#hid").val();
	if(status==4){
		content = "确定要同意变更操作么？";
	}
	if(status==5){
		content = "确定要仍然拒绝操作么？";
	}
	if(confirm(content)){
		location.href = contextRootPath + "/caseInfo/caseInfo_userFeedback?uuid=" + uuid + "&status=" + status+
						"&case_caseNo="+case_caseNo+"&case_contactPhone="+case_contactPhone+"&case_licenseNo="+
						case_licenseNo+"&case_createTime="+case_createTime+"&case_endCaseTime="+case_endCaseTime
						+"&caseStatusBox="+caseStatusBox;
	}
	
}

/** 初始化显示状态信息*/
$(function(){
	var hid = $("#hid").val();
	if(hid != ""){
		var boxarr = hid.split(",");
		for(var i =0;i<boxarr.length;i++){
			if(boxarr[i]=='1'){
				$("#box1").attr("checked",true);
			}
			if(boxarr[i]=='2'){
				$("#box2").attr("checked",true);
			}
			if(boxarr[i]=='3'){
				$("#box3").attr("checked",true);
			}
			if(boxarr[i]=='4'){
				$("#box4").attr("checked",true);
			}
			if(boxarr[i]=='5'){
				$("#box5").attr("checked",true);
			}
		}
		
	}
})
