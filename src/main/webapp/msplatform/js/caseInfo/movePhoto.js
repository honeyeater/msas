
$(function(){
	initParams();
});

//初始化页面参数
function initParams(){
	var obj = window.dialogArguments;
	$("#ID").val(obj.ID);
	$("#mobile").val(obj.mobile);
	$("#caseNo").val(obj.caseNo);
	$("#licenseNo").val(obj.licenseNo);
}

//关闭当前页面
function closeThis() {
	window.close();
}
// AJAX返回函数,暂无具体操作
function return_msg(data) {
	var rsObj = {};
	if (data.indexOf("success") > -1) {
		alert("转移成功");
		rsObj["result"] = "success";
		try {
			rsObj["caseNo"] = data.split(",")[1];
			rsObj["licenseNo"] = data.split(",")[2];
		} catch (e){}
		window.returnValue = rsObj;
		window.close();
	} else if(data.indexOf("CASENOERROR") > -1) {
		rsObj["result"] = "CASENOERROR";
		alert("案件号不存在！");
	} else if(data.indexOf("CASENONULL") > -1) {
		rsObj["result"] = "CASENONULL";
		alert("案件号不能为空！");
	} else {
		alert("转移失败");
		rsObj["result"] = "fail";
	}
}

// 表单提交
function submitThisForm() {
	// 图片序号
	var ID = document.getElementById("ID").value;
	// 案件号
	var caseNo = document.getElementById("newCaseNo").value;
	// 车牌号
	var licenseNo = document.getElementById("newLicenseNo").value;
	// 去两端空格
	var newCaseNo = trim(caseNo);
	var newLicenseNo = trim(licenseNo);
	var oldCaseNo = trim(document.getElementById("caseNo").value);
	if(newCaseNo == oldCaseNo){
		alert("案件号与原案件号相同！");
		return;
	}
	if (newCaseNo.length > 0) {
		// 转移图片
		var moveUrl = contextRootPath
				+ "/uploadImg/uploadImg_updateFlag?ID=" + ID
				+ "&newCaseNo=" + newCaseNo;
		$.ajax({
			type : "POST",
			url : moveUrl,
			data:{newLicenseNo:newLicenseNo},
			async : false,
			success : function(data) {
				return_msg(data);
			}
		});
	} else {
		alert("案件号不能为空");
	}
}

// 删除左右两端的空格
function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}