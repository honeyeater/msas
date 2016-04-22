$(function(){
	var params = window.dialogArguments;
	$("#caseNum").val(params.caseNo);
})

//案件重派确认
function ok() {
	var caseNum = $.trim($("#caseNum").val());
	var recontent = $.trim($("#recontent").val());
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
	
	var rsObj = {};
	rsObj["result"] = "success";
	rsObj["recontent"] = recontent;
	window.returnValue = rsObj;
   	window.close();
}

// 取消按钮
function Cancel() {
	window.close();
}