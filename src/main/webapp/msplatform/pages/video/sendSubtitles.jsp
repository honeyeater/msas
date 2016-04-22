<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>

<head>
	<title>发送消息到手机端</title>
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		//回车触发事件
		$(function(){
			$("#msg").bind("keydown",function(event){
				if(event.keyCode == "13"||event.which == "13"){
					event.preventDefault();
					sendMsg();
				}
			});
			$("#msg").focus();
		});
		function  begin()
		{
			var msg =  document.getElementById("msg").value;
			var rst = window.opener.sendSubtitles(msg);
			if(rst==0){
				document.getElementById("msg").value = "";
			} else {
				alert("数据发送失败，请重试！");
			}
		}
		//发送消息
  		function sendMsg(){
  			var str = $.trim($("#msg").val());
  	  		if (str == "") {
				return;
  	  	  	}
  			/* if (/[\#\+\&\=\%\']/.test(str)) {
				alert("请不要输入 # + & = % ' 等特殊字符");
				return;
			} */
			var pWindow = window.dialogArguments;
			if(pWindow!=null){
				var rst = pWindow.sendSubtitles(str);
				if(rst==0){
					$("#warner").html("&nbsp;&nbsp;");
					var sendTime = new Date().toLocaleString();//发送当前时间
					var str0 ="消息发送时间："+sendTime;
					$("#msg1").append(str0);
					$("#msg1").append("<li>"+str+"</li>");
					//scrop高度
					var scrollH = $("#msg1")[0].scrollHeight;
					//将下拉框始终保持到最底端
					$("#msg1").scrollTop(scrollH);
					$("#msg")[0].value = "";
					$("#msg").focus();
				} else {
					$("#warner").html("消息发送失败，请重试！");
				}
			}
  		}
	</script>
	<style type="text/css">
		div {
			font:12px "microsoft yahei",Tahoma, Geneva, sans-serif; font-weight:normal;
		}
</style>
</head>
<body>
	<div style="margin-left:10px;margin-top:10px;">
		<span>历史消息：</span>
  		<textarea id="msg1" style="width:380px;height:150px;" readonly="readonly"></textarea>
  		<hr>
  		<span>请输入消息内容：</span>
	    <textarea style="width:380px;height:90px;" id="msg" value = "" onpaste = "return false;" onpropertychange="if(value.length>10) {value=value.substr(0,10);}" ></textarea>&nbsp;&nbsp;<span style="font-size:12px;color:red" id="warner">&nbsp;&nbsp;</span>
    </div>
    <br>
	<div style="text-align: right;">
		<input type="button"  onclick="javascript:window.close();" value="关&nbsp;&nbsp;闭" />&nbsp;&nbsp;
		<input type="button"  onclick="sendMsg()" value="发&nbsp;&nbsp;送" /><span style="font-size: 10px;">(按回车)</span>
	</div>
</body>