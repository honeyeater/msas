
$(function(){
	var params = window.dialogArguments;
	$("#devideNo").val(params.devideNo);
	$("#caseNum").val(params.caseNo);
})

//案件重派确认
function ok() {
	var devideNo = $.trim($("#devideNo").val());
	var caseNum = $.trim($("#caseNum").val());
	var recontent = $.trim($("#recontent").val());
	if (!checkCaseStatus(caseNum)) {
		return;
	}
	if (caseNum == "") {
		alert("案件号为空！");
		return;
	}
	
	var re = /['"#@$%&>()+\\^*]/;
	
	if (re.test(recontent)) {
		alert("补传说明不能有特殊字符！");
		return;
	}
	
	if (recontent.length > 50) {
		alert("说明大于50个字符！");
		return;
	}
	
	$.ajax({
			type: "POST",
			url: contextRootPath + "/dispatch/dispatch_cancelCase",
			async: false,
			data :{
				caseNum : caseNum,
				recontent : recontent,
				devideNo : devideNo,
			},
		success:function(data){
			if(data==1){
				window.returnValue=1;
			   	window.close();
			}else{
				alert("重派失败");
			}
		}
	});
	
}

// 检查案件状态，拦截不能结案或改派的案件
function checkCaseStatus(caseNum) {
	var status = getCaseStatus(caseNum);
	if (status == "") {
		alert("获取案件状态失败，请稍后再试");
	} else if (status == "4" || status == "5" || status == "6") {
		alert("该案件" + caseNum + "已经改派或注销，即将结束案件。");
		window.returnValue = 1;
		window.close();
	} else {
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
		data : {
			caseNum : caseNum
		},
		url : url,
		async : false,
		success : function(data) {
			status = data;
		},
		error : function() {
		}
	});
	return status;
}

// 取消按钮
function Cancel() {
	window.close();
}