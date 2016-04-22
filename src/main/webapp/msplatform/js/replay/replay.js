var url;
var originHeight = 0;
//初始化播放控件大小
$(function() {
	$("#window").css("width", $("body").width() - 350);
	$("#TB_PlayBack1").css("width", $("body").width() - 350);
	originHeight = $("html").height();
	$("#TB_PlayBack1").css("height",$("html").height() - $("#middle_bottom").height());
	var frameHeight =  document.getElementById("largist").offsetHeight;
    var rightHeight =  document.getElementById("right").offsetHeight;
    $(".replayListFrame").height(frameHeight-rightHeight-40);
	setTimeout("styleAdjust()", 1000);
});

function styleAdjust(){
	var curHeight = $("html").height();
	if(originHeight != curHeight){
		$("#window").css("width", $("body").width() - 350);
		$("#TB_PlayBack1").css("width", $("body").width() - 350);
		$("#TB_PlayBack1").css("height",$("html").height() - $("#middle_bottom").height());
		var frameHeight =  document.getElementById("largist").offsetHeight;
	    var rightHeight =  document.getElementById("right").offsetHeight;
	    $(".replayListFrame").height(frameHeight-rightHeight-40);
	    var divHeight = $("#right_inner_div").height();
	    $("#search_img").css("margin-top", divHeight-35);
	}
}

// 窗口改变大小时
window.onresize = function() {
	$("#window").css("width", $("body").width() - 350);
	$("#TB_PlayBack1").width(document.body.clientWidth - 350);
}

var go_prev = function(t){
	$(t).prev().focus();
}

/**	查询*/
function search(){
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
	if(starttime == '' || endtime == ''){
		alert("请选择时间");
		return;
	}else{
		if (starttime >= endtime) {
			alert("开始时间不能大于或等于结束时间!");
			return;
		}
	}
	$("#video_startTime").val(starttime);
	$("#video_endTime").val(endtime);
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
}

function getUrl(url){
	TB_PlayBack1.url  = url;
}
