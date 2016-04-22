var trim = function(str) {
	return str.replace(/^\s+|\s+$/g, '');
}

/**
 * 补传说明:案件号、案件uuid、补传说明内容
 */
function ok() {
	var casenumber = $("#casenumber").val();
	var recontent = $("#recontent").val();
	var caseuuid =$("#caseuuid").val();
	if (trim(recontent) == "") {
		$("#recontent").val("");
		$("#recontent").focus();
		alert("请输入补传内容");
		return;
	}

	var url = contextRootPath + "/caseInfo/caseInfo_addUploadExplain";
	
	var data = "casenumber=" + casenumber + "&recontent=" + recontent +"&caseuuid=" + caseuuid;
	$.ajax({
		type : "POST",
		url : url,
		async : false,
		data : {
			"casenumber" : casenumber,
			"recontent" : escape(recontent).replace(/\+/g, "%2B"),
			"caseuuid"	: caseuuid
		},
		success : function(data) {
				alert("添加成功");
				window.returnValue = 1;
				window.close();
		}

	});

}

var check_special = function(t) {

	var regs = /["#@$%&>()+\\^*>']/g;
	var re = regs.test(t.value);
	var c = t.value;
	if (re)
		t.value = c.substring(0, c.length - 1);

}
// 取消按钮
function Cancel() {
	window.close();
}