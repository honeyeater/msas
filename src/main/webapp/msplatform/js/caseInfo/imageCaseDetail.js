/** 点击照片弹出新窗口 */
function showPhoto(uuid, caseUuid, imgType) {
	/*var win = window
			.showModalDialog(contextRootPath
					+ "/msplatform/pages/caseInfo/showUploadImg.jsp?uuid="
					+ uuid + "&caseUuid=" + caseUuid + "&imgType=" + imgType+"&random="+ Math.random(), window,
					'dialogWidth:650px;dialogHeight:800px;scroll:no;status:no;center:yes');*/
	var picAry = [];
	var picTypeAry = [];
	var picIdAry = [];
	$(".piceach").each(function(){
		picIdAry[picIdAry.length] = $(this).find("input[name='picId']").val();
		picTypeAry[picTypeAry.length] = $(this).find("input[name='picType']").val();
		picAry[picAry.length] = $(this).find("img[name='img']").attr("src");
	});
	var paramObj = {
			pWindow:window,
			picIdAry:picIdAry,
			picTypeAry:picTypeAry,
			picAry:picAry,
			curPicId:uuid
		};
		var url = contextRootPath + "/msplatform/pages/video/showImg.jsp?random="+ Math.random();
		window.showModalDialog(url, paramObj, 'dialogWidth:650px;dialogHeight:800px;scroll:no;status:no;center:yes');
		
		
}

function handleImgCase(caseUuid){
	location.href = contextRootPath + "/caseInfo/caseInfo_handleImgCase?caseUuid="+caseUuid;
}

function dispatchImgCase(caseNo,caseUuid){
	var paramObj = {
			caseNo:caseNo
		};
	var rtnObj  = window
	.showModalDialog(contextRootPath + "/msplatform/pages/caseInfo/imageCanelExplain.jsp", paramObj,
			'dialogWidth:420px;dialogHeight:210px;scroll:no;status:no;center:yes');
	if (rtnObj["result"]=="success") { 
	    $("#imgCheck_recontent").val(rtnObj["recontent"]);
		var oldAction = pageForm.action;
		pageForm.action = contextRootPath + "/caseInfo/caseInfo_dispatchImgCase?caseUuid="+caseUuid;
		pageForm.submit();
		pageForm.action = oldAction;
	}
}

function openVideo(ossUuid){
	var paramObj = {
			ossUuid : ossUuid
		};
	var rtnObj  = window
	.showModalDialog(contextRootPath + "/msplatform/pages/video/mobileVideoFrame.jsp", paramObj,
			'dialogWidth:800px;dialogHeight:600px;scroll:no;status:no;center:yes');
}

function downLoadDetails(imgCheck_caseUuid,imgCheck_caseNo){
	/** 批量下载图片,视频 */
	var someDownloadUrl = contextRootPath + "/uploadImg/uploadImg_downLoadPicsAndVideo";
	var form = $("<form>");// 定义一个form表单
	form.attr("style", "display:none");
	form.attr("method", "post");
	form.attr("action", someDownloadUrl);
	var input1 = $("<input>");
	input1.attr("type", "hidden");
	input1.attr("name", "imgCheck_caseUuid");
	input1.attr("value", imgCheck_caseUuid);
	var input2 = $("<input>");
	input2.attr("type", "hidden");
	input2.attr("name", "imgCheck_caseNo");
	input2.attr("value", imgCheck_caseNo);
	$("body").append(form);// 将表单放置在web中
	form.append(input1);
	form.append(input2);
	form.submit();// 表单提交
}
function openVideoIE11(ossUuid){
	var paramObj = {
			ossUuid : ossUuid
		};
	var rtnObj  = window
	.showModalDialog(contextRootPath + "/msplatform/pages/video/mobileVideoFrameIE11.jsp", paramObj,
			'dialogWidth:800px;dialogHeight:600px;scroll:no;status:no;center:yes');
}