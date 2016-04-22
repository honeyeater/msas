
/** 调用时间插件 */
function checkSelectValue() {
	WdatePicker({
		dateFmt : 'yyyy-MM-dd HH:mm:ss'
	});
}

/** 根据查询条件，查询信息 */
function searchUpload() {
	var upload_createTime = $("#upload_createTime").val();
	var upload_endTime = $("#upload_endTime").val();
	if(checkConEmpty()){
		//必须有时间
		if(checkTimeNotEmpty()&&(upload_createTime >= upload_endTime)){
			//校验时间
			alert("开始时间不能大于或等于结束时间!");
			return;
		}
		if(!checkTimeNotEmpty()){
			alert("请选择时间");
			return;
		}
	}else {
		//时间必须满足条件
		if(checkTimeNotEmpty()&&(upload_createTime >= upload_endTime)){
			//校验时间
			alert("开始时间不能大于或等于结束时间!");
			return;
		}
		if(!checkTimeNotEmpty()&&(upload_createTime !='' || upload_endTime != '')){
			alert("请选择时间");
			return;
		}
	}
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();

}

function checkTimeNotEmpty(){
	var allEmpty=false;
	var upload_createTime = $("#upload_createTime").val();
	var upload_endTime = $("#upload_endTime").val();
	if(upload_createTime != '' && upload_endTime != '' ){
		allEmpty = true;
	}
	return allEmpty;
}

function checkConEmpty(){
	var allEmpty=false;
	var upload_caseNo = $("#upload_caseNo").val();
	var upload_licenseNo = $("#upload_licenseNo").val();
	var deviceNum = $("#deviceNum").val();
	if(upload_caseNo == '' && upload_licenseNo == '' && deviceNum == ''){
		allEmpty = true;
	}
	return allEmpty;
}

/** 删除上传图片信息 */
function deletePhoto(ID, index) {
	var currentPage = $("#currentPage").val();
	var treeNodeId = $("#treeNodeId").val();
	var upload_caseNo = $("#upload_caseNo").val();
	var upload_licenseNo = $("#upload_licenseNo").val();
	var upload_createTime = $("#upload_createTime").val();
	var upload_endTime = $("#upload_endTime").val();
	// 得到复选框
	var suodingCheck = document.getElementsByName("suoding");
	if (suodingCheck[index].checked) {
		alert("照片已锁定，不能删除！");
	} else if (confirm("确定要删除吗？")) {
		location.href = contextRootPath + "/uploadImg/uploadImg_delete?ID="
				+ ID + "&currentPage=" + currentPage + "&treeNodeId="
				+ treeNodeId + "&upload_caseNo=" + upload_caseNo
				+ "&upload_licenseNo=" + upload_licenseNo
				+ "&upload_createTime=" + upload_createTime
				+ "&upload_endTime=" + upload_endTime;
	}
}
/** 改变复选框 */
function changeBox(obj, ID) {
	// 判断复选框是否被选择
	var updateUrl = "";
	if (obj.checked) {
		// 锁定图片
		updateUrl = contextRootPath + "/uploadImg/uploadImg_updatelockFlag?ID="
				+ ID + "&lockFlag=1";
	} else {
		// 解除锁定
		updateUrl = contextRootPath + "/uploadImg/uploadImg_updatelockFlag?ID="
				+ ID + "&lockFlag=0";
	}
	$.ajax({
		type : "POST",
		url : updateUrl,
		async : false,
		success : function(data) {
		}
	});

}
/** 转移图片 */
function movePhoto(mobile, ID, obj) {
	var caseNo = $.trim($(obj).parent().siblings("td[name='caseNoSpan']").text());
	var licenseNo = $.trim($(obj).parent().siblings("td[name='licenseNoSpan']").text());
	var paramObj = {
			mobile:mobile,
			caseNo:caseNo,
			licenseNo:licenseNo,
			ID:ID
		};
	var rtnObj = window
			.showModalDialog(contextRootPath + "/msplatform/pages/caseInfo/movePhoto.jsp",paramObj,
					'dialogWidth:420px;dialogHeight:300px;scroll:no;status:no;center:yes');
	if(rtnObj != null){
		var rs = rtnObj["result"];
		if(rs == "success"){
			//更新页面信息
			$(obj).parent().siblings("td[name='caseNoSpan']").html(rtnObj["caseNo"]);
			$(obj).parent().siblings("td[name='licenseNoSpan']").html(rtnObj["licenseNo"]);
		}
		/*document.pageForm.submit();*/
	}
}
/** 下载图片 */
function download(ID) {
	location.href = contextRootPath + "/uploadImg/uploadImg_downLoadPics?ID="
			+ ID;
}

/** 批量下载图片 */
function someDownload() {
	var upload_caseNo = $("#upload_caseNo").val();
	var deviceNum = $("#deviceNum").val();
	var treeNodeId = $("#treeNodeId").val();
	var upload_licenseNo = $("#upload_licenseNo").val();
	var upload_createTime = $("#upload_createTime").val();
	var upload_endTime = $("#upload_endTime").val();
	var someDownloadUrl = contextRootPath + "/uploadImg/uploadImg_downLoadPics";

	var form = $("<form>");// 定义一个form表单
	form.attr("style", "display:none");
	form.attr("method", "post");
	form.attr("action", someDownloadUrl);
	var input1 = $("<input>");
	input1.attr("type", "hidden");
	input1.attr("name", "upload_caseNo");
	input1.attr("value", upload_caseNo);
	var input2 = $("<input>");
	input2.attr("type", "hidden");
	input2.attr("name", "deviceNum");
	input2.attr("value", deviceNum);
	var input3 = $("<input>");
	input3.attr("type", "hidden");
	input3.attr("name", "treeNodeId");
	input3.attr("value", treeNodeId);
	var input4 = $("<input>");
	input4.attr("type", "hidden");
	input4.attr("name", "upload_licenseNo");
	input4.attr("value", upload_licenseNo);
	var input5 = $("<input>");
	input5.attr("type", "hidden");
	input5.attr("name", "upload_createTime");
	input5.attr("value", upload_createTime);
	var input6 = $("<input>");
	input6.attr("type", "hidden");
	input6.attr("name", "upload_endTime");
	input6.attr("value", upload_endTime);
	$("body").append(form);// 将表单放置在web中
	form.append(input1);
	form.append(input2);
	form.append(input3);
	form.append(input4);
	form.append(input5);
	form.append(input6);

	form.submit();// 表单提交
}

/** 点击照片弹出新窗口 */
function showPhoto(uuid, caseUuid) {
	var picAry = [];
	var picIdAry = [];
	$(".piceach").each(function(){
		picIdAry[picIdAry.length] = $(this).find("input[name='picId']").val();
		picAry[picAry.length] = $(this).find("img[name='img']").attr("src");
	});
	var paramObj = {
			pWindow:window,
			picIdAry:picIdAry,
			picAry:picAry,
			curPicId:uuid
		};
		var url = contextRootPath + "/msplatform/pages/video/showImg.jsp?random="+ Math.random();
		window.showModalDialog(url, paramObj, 'dialogWidth:650px;dialogHeight:800px;scroll:no;status:no;center:yes');
}


//自定义日期转换方法
Date.prototype.format = function(format){        
	var o = {        
		"M+" : this.getMonth()+1, //month        
		"d+" : this.getDate(), //day        
		"H+" : this.getHours(), //hour        
		"m+" : this.getMinutes(), //minute        
		"s+" : this.getSeconds(), //second        
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter        
		"S" : this.getMilliseconds() //millisecond        
	}        
	if(/(y+)/.test(format)) format = format.replace(RegExp.$1,        
		(this.getFullYear()+"").substr(4 - RegExp.$1.length));        
	for(var k in o)if(new RegExp("(" + k + ")").test(format))        
	format = format.replace(RegExp.$1,        
			RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));        
	return format;       
}

