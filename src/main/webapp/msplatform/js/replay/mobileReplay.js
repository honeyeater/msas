var originHeight = 0;
//初始化播放控件大小
$(function() {
	$("#window").css("width", $("body").width());
	$("#TB_PlayBack1").css("width", $("body").width());
	originHeight = $("html").height();
	$("#TB_PlayBack1").css("height",$("html").height());
	setTimeout("styleAdjust()", 1000);
});

function styleAdjust(){
	var curHeight = $("html").height();
	if(originHeight != curHeight){
		$("#window").css("width", $("body").width());
		$("#TB_PlayBack1").css("width", $("body").width());
		$("#TB_PlayBack1").css("height",$("html").height());
	}
}
var go_prev = function(t){
	$(t).prev().focus();
}

