
var AINF = parent.topFrame.AINF;//获取控件
var checkCallTid;
var user_mobile="";
var user_caseNo="";

/**	初始化*/
$(function() {
//	initLayout();//页面布局
//	//unFinishedTask();//上次未处理完成的案子
//	handle.src = contextRootPath + "/msplatform/pages/video/video_handle.jsp";
//	handle.window.location.href = contextRootPath + "/msplatform/pages/video/video_handle.jsp";
});

function initLayout() {
	$("#layout1").ligerLayout({
		leftWidth : 200,
		allowLeftCollapse : false,
		allowRightCollapse : false,
		allowBottomResize : false,
		allowLeftResize : false,
		rightWidth : 250
	});

	var leftH = $("#layout1").outerHeight();
	$("#Menu").height(leftH - 300);
	var rightH = $(window).height();
	$(".iframe3").height(rightH);
}

//结束案件
function endVideo(obj,userName,devideNo,caseNo,licenseNo,caseType) {
	var paramObj = {
		userName:userName,	
		devideNo:devideNo,
		caseNo:caseNo,
		licenseNo:licenseNo
	};
	var win = window
			.showModalDialog(contextRootPath + "/msplatform/pages/video/videoEnd.jsp?random="+Math.random()+"&caseType="+caseType,paramObj,
					'dialogWidth:450px;dialogHeight:400px;scroll:no;status:no;center:yes');
	
	if(win==1){
		 $(obj).parent().remove();
		 handle.window.dispatchStatus_init();
	} else if(win==2){
		 $(obj).parent().remove();
		 var state = parent.topFrame.document.getElementById("state").value;
//		 if(state==200 || (state >= 300 && state < 318)){
//			 if(AINF.SetBusyEx(1,"cancelticket=1")==0){//取消预占
//				 parent.topFrame.document.getElementById("state").value = 105;
//			 } else {
//				 AINF.SetBusyEx(1,"cancelticket=1");
//			 }
//		 }
		 handle.window.dispatchStatus_init();
	}
	
}


//查勘员案件,用户自助案件的重派
function cancelCase(obj,caseNo,devideNo){
	var paramObj = {
			caseNo:caseNo,
			devideNo:devideNo,
		};
	var win = window
			.showModalDialog(contextRootPath + "/msplatform/pages/video/addCanelExplain.jsp", paramObj,
					'dialogWidth:420px;dialogHeight:210px;scroll:no;status:no;center:yes');
	if(win==1){
		 $(obj).parent().remove();
		 var state = parent.topFrame.document.getElementById("state").value;
//		 if(state==314){
//			 if(AINF.SetBusyEx(1,"cancelticket=1")==0){//取消预占
//				 parent.topFrame.document.getElementById("state").value = 105;
//			 } else {
//				 AINF.SetBusyEx(1,"cancelticket=1");
//			 }
//		 }
		 handle.window.dispatchStatus_init();
	}
}

//点击展示、收缩当前任务具体信息
function show(obj){
	$(obj).siblings(".dl_con").toggle();
}

/**
 * 坐席主动呼叫客户端
 * @param mobile 手机号
 */
function callUser(mobile,caseNo){
	if(handle.m_haveTask){
		alert("当前有任务，不可发起呼叫！");
		return;
	}
	var strstate = parent.topFrame.document.getElementById("state").value;
	if(strstate!=''){
		var state = parseInt(strstate, 10);
		if ((state >= 200 && state < 300) || state == 105 || state == 106
	            || state == 304 || state == 310 || (state >= 400 && state < 500))
	    {
			//根据手机号获取callid
			var url = contextRootPath + "/dispatch/dispatch_getCallId?random="+Math.random();
			$.ajax({
		    	type: "POST",
		        url: url,
		        data:{phoneNo:mobile},
		        success: function(data){
		        	if(data!=null && data!="" && data!="-1" && data.length>0){
		        		handle.callOutNo = mobile;
		        		var callid = parseInt(data, 10);
		        		if (isNaN(callid)) {
		        	        alert("通信系统异常，请联系管理员！");
		        	        return;
		        	    }
		        		$("#callee").val(callid);
		        	    // 设置预呼
		        		for(var k=0; k<3; k++){
		        			if (AINF.SetPreCall() == 0) {
		        				user_mobile= callid;
		        				user_caseNo= caseNo;
								//发起外呼
			        	    	if(AINF.CallOutsideEx(6, "",callid, "", 0, 0, "")!=0){
			        	    		continue;
			        	    	} else {
			        	    		//这段代码放在OnCallOutsideSuccTalk回调事件中触发
									/*var msg1 = "camera:back"; 
									var msg2 = "appdata:"+caseNo; 
									var sendmsgres = AINF.SndMsgToSipUsr(callid,msg1,"","");
									var maxcount = 0;
									while(sendmsgres != 0 && maxcount < 30){
										maxcount++;
										sleep(2000);
										sendmsgres = AINF.SndMsgToSipUsr(callid,msg1,"","");
									}
									AINF.SndMsgToSipUsr(callid,msg2,"","");*/
									
					    			break;
			        	    	}
			        	    } else {
			        	    	continue;
			        	    }
		        		}
		        		if(checkCallTid != null){
		        			clearTimeout(checkCallTid);
		        		}
		        		checkCallTid = setTimeout("checkCallResult()", 5000);//呼出之后5s，校验坐席的状态，防止一直处于107的状态
		        	}
		        	
				}
			});
	    } else {
	    	alert("坐席当前状态["+state+"]\n"+"不可发起呼叫！");
	    }
	}
}



function sleep(milliseconds) {
     setTimeout(function(){
         var start = new Date().getTime(); 
         while ((new Date().getTime() - start) < milliseconds){
             // Do nothing
         }
     },0);
}

function checkCallResult(){
	var state = parent.topFrame.document.getElementById("state").value;
	if(state == 107){
		var seatStatus = parent.topFrame.seatStatus;
		handle.resetSetStatus(seatStatus);
	}
	checkCallTid = null;
}

function getErrorMsg(){
	var errorCode = AINF.GetLastErrorCode();
    var errorMsg = AINF.GetPromptByErrorCode(errorCode);
    return "["+errorCode+":"+errorMsg+"]";
}

function getCaseType(){
	return $('#chulicase').find("input[name='caseType']").val();
}

function getCaseNo(){
	return $('#chulicase').find("input[name='caseNo']").val();
}

//创建一个StringBuffer类 ，此类有两个方法：一个是append方法一个是toString方法
function StringBuffer() {
  this.__strings__ = [];
};
StringBuffer.prototype.append = function(str) {
  this.__strings__.push(str);
};
StringBuffer.prototype.toString = function() {
  return this.__strings__.join('');
};