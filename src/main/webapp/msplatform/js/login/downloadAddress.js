var ios1;// 查勘
var ios2;// 自助
$(function() {
	initVersion();//获取ios版本信息
	initWeixin();//初始化二维码
});
function initVersion() {
	$.ajax({
		type : "POST",
		url : contextRootPath + "/user/user_queryIOSVersion",
		async : false,
		success : function(data) {
			data = $.parseJSON(data);
			if (data != '') {
				ios1 = data[0];
				ios2 = data[1]
			}
		}
	});
}

function initWeixin() {
	var url1 = $("#url1").val();
	var url3 = $("#url3").val();
	/**$("#qrcodeCanvas1").qrcode({
		render : "canvas", // 设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
		text : url1, // 扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
		width : "200", // 二维码的宽度
		height : "200", // 二维码的高度
		background : "#ffffff", // 二维码的后景色
		foreground : "#000000", // 二维码的前景色
		src : contextRootPath + "/msplatform/images/login/weixin.png" // 二维码中间的图片
	});
	$("#qrcodeCanvas2").qrcode({
		render : "canvas", // 设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
		text : ios2, // 扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
		width : "200", // 二维码的宽度
		height : "200", // 二维码的高度
		background : "#ffffff", // 二维码的后景色
		foreground : "#000000", // 二维码的前景色
		src : contextRootPath + "/msplatform/images/login/weixin.png" // 二维码中间的图片
	});*/
	$("#qr3").qrcode({
		render : document.createElement('canvas').getContext ? 'canvas' : 'table', // 设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
		text : url3, // 扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
		width : "200", // 二维码的宽度
		height : "200", // 二维码的高度
		background : "#ffffff", // 二维码的后景色
		foreground : "#000000", // 二维码的前景色
		src : contextRootPath + "/msplatform/images/login/weixin.png" // 二维码中间的图片
	});
	$("#qr4").qrcode({
		render : document.createElement('canvas').getContext ? 'canvas' : 'table', // 设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
		text : ios1, // 扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
		width : "200", // 二维码的宽度
		height : "200", // 二维码的高度
		background : "#ffffff", // 二维码的后景色
		foreground : "#000000", // 二维码的前景色
		src : contextRootPath + "/msplatform/images/login/weixin.png" // 二维码中间的图片
	});
}
function copyText(id) {
	var data = $("#" + id).text();
	window.clipboardData.setData("text", data);
	alert("复制成功");
}

function downloadVersion(appType, systemCode) {
	var url = contextRootPath + "/user/user_versionDownload";
	var form = $("<form>");// 定义一个form表单
	form.attr("style", "display:none");
	form.attr("method", "post");
	form.attr("target", "_self");
	form.attr("action", url);
	$("body").append(form);// 将表单放置在web中
	var input1 = $("<input>");
	input1.attr("type", "hidden");
	input1.attr("name", "appType");
	input1.attr("value", appType);
	var input2 = $("<input>");
	input2.attr("type", "hidden");
	input2.attr("name", "systemCode");
	input2.attr("value", systemCode);
	form.append(input1);
	form.append(input2);
	form.submit();// 表单提交
}
