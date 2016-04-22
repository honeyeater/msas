$(function() {
	init_other();
	//初始化案件状态
	var hid = $("#hid").val();
	if(hid != ""){
		$("#case_reUploadFlag").val(hid);
	}
});

// 初始化一些页面状态
var init_other = function() {
	// 案件选中特效及点击事件
	$(".current").each(function() {
		$(this).mouseover(function() {
			$(this).css("background", "#eeeeee");
		}).mouseout(function() {
			$(this).css("background", "white");
		}).click(function() {
			changeContent(this);
		});
	});
}

var changeContent = function(t){
	$(t).children(":first").children(":first").attr("checked", "checked");
	var caseUuid =	$("input[name='caseUuid']:checked").attr("value");
	var url = contextRootPath + "/caseInfo/caseInfo_findUploadMark";
	$.ajax({
		type : "POST",
		url : url,
		async : true,
		data : {
			"caseUuid" : caseUuid
		},
		success : function(data) {
			data = $.parseJSON(data);
			$("#content").html("");
			var innerHtml = "";
			if(data != ''){
				for(var i=0;i<data.length;i++){
					var caseNo = data[i].caseNo;
					var useCode = data[i].useCode;
					var remark = data[i].remark;
					var time = data[i].operateTime.time;
					var operateTime = new Date(time).format("yyyy-MM-dd HH:mm:ss");
//					alert("案件号："+caseNo+",用户代码："+useCode+",说明："+remark+",时间"+operateTime);
					
					innerHtml+=	"<tr id =\"norecord\" height=\"27px\" align=\"center\" style=\"background: white\">";
					innerHtml+= "<td>"+caseNo+"</td>";
					innerHtml+= "<td>"+operateTime+"</td>";
					innerHtml+= "<td>"+useCode+"</td>";
					innerHtml+= "<td>"+remark+"</td>";
					innerHtml+=	"</tr>";
				}
			}else{
				innerHtml+=	"<tr id =\"norecord\" height=\"27px\" align=\"center\" style=\"background: white\">";
				innerHtml+= "<td colspan = '4'>"+'无记录'+"</td>"
				innerHtml+=	"</tr>";
			}
			$("#content").append(innerHtml);
		}
	});
	
	parent.document.getElementById("picture").src = contextRootPath +"/caseInfo/caseInfo_findReuploadImg?caseUuid="+caseUuid;
}


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
	if (createTime != '' && endCaseTime != '') {
		if (createTime >= endCaseTime) {
			alert("开始时间不能大于或等于结束时间!");
			return false;
		}
	}
	
	//保存案件状态信息
	$("#hid").val($("#case_reUploadFlag").val());
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
	$(parent.frames["picture"].document).find("#picbody").html("");
}

/** 补传操作 */
function buchuan(casenumber,caseuuid) {
	var win = window
			.showModalDialog(
					contextRootPath
							+ "/msplatform/pages/caseInfo/addUploadExplain.jsp?casenumber="
							+ casenumber + "&caseuuid=" + caseuuid, window,
					'dialogWidth:440px;dialogHeight:230px;scroll:no;status:no;center:yes');
	if (win == 1) { // 返回值 .可以修改.如果有值
		var tableobj = document.getElementById(casenumber);
		//添加补传说明成功后，刷新页面
		location.href = contextRootPath + "/caseInfo/caseInfo_findReloadPic";
	}
}

/**	审核通过*/
function checkPass(uuid){
	var case_caseNo = $("#case_caseNo").val();
	var case_reUploadFlag = $("#case_reUploadFlag").val();
	var case_createTime = $("#case_createTime").val();
	var case_endCaseTime = $("#case_endCaseTime").val();
	location.href = contextRootPath + "/caseInfo/caseInfo_checkPass?uuid="+uuid+"&case_caseNo="+case_caseNo+
					"&case_reUploadFlag="+case_reUploadFlag+"&case_createTime="+case_createTime+
					"&case_endCaseTime="+case_endCaseTime;
}


/**
 * 时间对象的格式化;
 */
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, //month
		"d+" : this.getDate(), //day
		"H+" : this.getHours(), //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth() + 3) / 3), //quarter
		"S" : this.getMilliseconds()
	}

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}

	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
}