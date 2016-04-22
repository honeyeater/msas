var reassignIfSuccess = -1;//改派是否成功标示 1-成功

$(function(){
	checkCaseType();
});

/** 正常、异常结束页面效果切换 */
function AddEndTypeInfo() {
	$("#AbnormEndInfoId").toggle();
	$("#ReuploadExplainId").toggle();
	if ($("#EndType").val() == 1) {
		$("#ReuploadExplain").attr("disabled", true);
		$("#Reassign").attr("disabled", false);
		$("#IfReupload").attr("checked", false);
		$("#IfReupload").attr("disabled", true);
		$("#AbnormEndType").attr("disabled", false);
		$("#Reassign option[value='3']").remove();
	} else {
		$("#ReuploadExplain").attr("disabled", true);
		$("#Reassign option[value='0']").attr("selected", true);
		$("#AbnormEndType option[value='2']").attr("selected", true);
		$("#Reassign").attr("disabled", true);
		$("#IfReupload").attr("disabled", false);
		$("#AbnormEndType").attr("disabled", true);
		$("#select_id").append("<option value='3'>转人工查勘</option>");
		checkCaseType();
	}
}

function checkCaseType(){
	if($("#caseType").val()!='1'){
		$("#Reassign option[value='3']").remove();
	}
}

/**	是否需要补传照片*/
function changeCheckBox(obj){
	if($(obj).prop("checked")){
		$("#ReuploadExplain").attr("disabled",false);
	}else {
    	$("#ReuploadExplain").attr("disabled",true);
    }
}

/** 结束案件 */
function EndCase() {
	var userName = $("#userName").val();
	var EndType = $("#EndType").val();
	var Reassign = $("#Reassign").val();
	var AbnormEndType = $("#AbnormEndType").val();
	var AbnormEndInfo = $("#AbnormEndInfo").val();
	var ReuploadExplain = $("#ReuploadExplain").val();
	var caseid = $("#DeviceId").val();
	var CaseNum = $("#CaseNum").val();
	var DeviceN = $("#DeviceN").val();
	var CarNum = $("#CarNum").val();
	var picUpType = $("#picUpType").val();
	var caseType = $("#caseType").val();
	if (!checkCaseStatus(CaseNum)) {
		return;
	}
	var content = ReuploadExplain.replace(/(^\s*)|(\s*$)/g, "");
	var re = /['"#@$%&>()+\\^*]/;
	if ($("#ReuploadExplain").attr("disabled") != "disabled") {
		if (content == "" || null == content) {
			alert("补传说明不能没有内容！");
			return;
		}
		if (ReuploadExplain.length > 200) {
			alert("字数不能超过200！");
			return;
		}
		if (re.test(content)) {
			alert("补传说明不能有特殊字符！");
			return;
		}
	}
	var abnormend = AbnormEndInfo.replace(/(^\s*)|(\s*$)/g, "");
	var res = /[>'()+]/;
	if (res.test(abnormend)) {
		alert("异常备注不能有特殊字符！");
		return;
	}
	
	/**	异常结束*/
	if(EndType==1){
		if(Reassign == 0){
			alert("改派类型未选！");
			return;
		}else if(Reassign == 3){
			var url = contextRootPath + "/dispatch/dispatch_reassign";
			$.ajax({
				type: "POST",
				url: url,
				async: false,
				data :{
					caseNum : CaseNum,
					Reassign: Reassign,
					AbnormEndInfo : AbnormEndInfo,
					AbnormEndType : AbnormEndType,
					picUpType : picUpType,
					DeviceN : DeviceN,
					caseType : caseType,
				},
				success:function(data){
					if(data==1){
						alert("转人工查勘成功");
						if(caseType == '1'){
							window.returnValue = 2;//自助
						}else{
							window.returnValue = 1;
						}
						
						window.close();
					}else{
						alert("转人工查勘失败");
					}
				}
			});
			return;
		}else{
			var url = contextRootPath + "/dispatch/dispatch_reassign";
			$.ajax({
				type: "POST",
				url: url,
				data :{
						caseNum : CaseNum,
						Reassign: Reassign,
						AbnormEndInfo : AbnormEndInfo,
						AbnormEndType : AbnormEndType,
						picUpType : picUpType,
						DeviceN : DeviceN,
						userName : userName,
						caseType : caseType,
				},
				async: false,
				success:function(data){
					if(data=="1"){
						reassignIfSuccess = 1;
						alert("改派成功");
						if(caseType == '1'){
							window.returnValue = 2;//自助
						}else{
							window.returnValue = 1;
						}
						window.close();
					}else{
						reassignIfSuccess = 0;
						alert("改派失败");
					}
				},
				error:function(){
					alert("调用改派接口失败");
					reassignIfSuccess = 0;
				}
			});		
		}
	}else{
		var url = contextRootPath + "/dispatch/dispatch_nomarlEnd";
		$.ajax({
			type: "POST",
			url: url,
			data :{
				caseNum : CaseNum,
				ReuploadExplain :ReuploadExplain,
				DeviceN : DeviceN,
				picUpType : picUpType,
				caseType : caseType,
			},
			async: false,
			success:function(data){
				if(data=="1"){
					alert("案件正常结束");
					window.returnValue = 1;
					window.close();
				}
			},
			error:function(){
				alert("调用接口失败");
				reassignIfSuccess = 0;
			}
		});		
	}
	
	if(reassignIfSuccess == 0){
		return false;
	}
}

//检查案件状态，拦截不能结案或改派的案件
function checkCaseStatus(caseNum){
	var status = getCaseStatus(caseNum);
	if(status==""){
		alert("获取案件状态失败，请稍后再试");
	}else if(status=="4" ||status=="5" || status=="6"){
		alert("该案件"+caseNum+"已经改派或注销，即将结束案件。");
		window.returnValue = 1;
		window.close();
	}else{
		return true;
	}
	return false;
}


/** 获取案件状态 */
function getCaseStatus(caseNum) {
	var status = "";
	var url = contextRootPath + "/dispatch/dispatch_getCaseStatus";
	$.ajax({
		type : "POST",
		data : {caseNum:caseNum},
		url : url,
		async: false,
		success : function(data) {
			status = data;
		},
		error : function() {
		}
	});
	return status;
}

function Cancel(){
	window.close();
}