var m_iTaskId = -1;//页面左侧当前任务是否为空 1-有任务
var m_haveTask = false; //推送任务到结束任务才能重置为false（注：点击'有空'置为false）
var AINF = parent.parent.topFrame.AINF;//获取控件
var timeoutId;
var phoneNo = "";//与当前坐席处理的案件对应的设备号或手机号
var curCaseNo = "";//当前坐席处理的案件号
var callOutNo = "";//坐席主动发起呼叫的设备号
var tryNum = 0; //方法调用尝试次数
var callout_caseNo="";//视频监控页面左下角案件号（外呼判断用）
var callout_phoneNo="";//视频监控页面左下角手机号（外呼判断用）
var receive_caseNo="";//坐席点击接受任务获取案件号
var data_curtask=new Map();//当前任务信息

$(function(){	
	//获取坐席当日的调度信息
	getHisDispatchInfo();
	callinListen();
	if(!checkHistoryCase()){
		unFinishedTask();
	}
});

function dispatchStatus_init(){
	m_iTaskId = -1;
	m_haveTask = false;
	curCaseNo = "";
	callOutNo = "";
	callout_caseNo="";
	callout_phoneNo="";
	$("#StatusButton0").attr("disabled",false);//有空按钮可点击
	$("#StatusButton2").attr("disabled",false);//离开按钮可点击
	//初始化座席设置示闲
	parent.parent.topFrame.seatStatus = 2;
	var state = parent.parent.topFrame.document.getElementById("state").value;
	if(state >= 300 && state < 313){
		AINF.ReleaseCall(6);
	}
	if(state!=200){
		if (setToFree(2) == 0) {
			$("#StatusButton0").attr("disabled",true);//有空按钮不可点击
			$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：空闲！</div>");
		} else {
			$(".controlInfo").html("<div align='center' style='color:red;'>您当前的状态为：异常！</div>");
		}
	} else {
		$("#StatusButton0").attr("disabled",true);//有空按钮可点击
	}
	//清除照片
	$("#picbody").html("");
}

/**
 * 初始化未完成任务页面显示
 * @param param1 当前案件号
 * @param param2 手机号或查勘员工号
 */
function unFinishedTaskInit(param1, param2){
	$(".controlInfo").html("<div align='center' style='color:#0000CC'>您当前有任务正在处理，见左下角！</div>");
	m_iTaskId = 1;
	m_haveTask = false;
	setVariableValue(param1, param2);
	document.getElementById("StatusButton0").disabled = false;
	document.getElementById("StatusButton2").disabled = false;
	parent.parent.topFrame.seatStatus = 3;
	if (setToBusy(3) != 0)
	{
	}
}

//展示未处理完成案件
function unFinishedTask(){
	$.ajax({
		type : "POST",
		url  :	contextRootPath + "/dispatch/dispatch_unFinishedTask",
		async : true,
		success : function(data){
			data = $.parseJSON(data);
			if(data != ''){
				alert("你上次有异常结束的案件，具体信息在左下角案件信息列表");
				var strPhoneNo="",strCaseNo="";
				for(var i =0;i<data.length;i++){
					var caseType = data[i].caseType;
					var userNum = data[i].userNum;
					var userName = data[i].userName;
					var caseNo = data[i].caseNo;
					var licenseNo = data[i].licenseNo;
					var time = data[i].acceptTime;
					
					var caseTypeName = "";
	        		if(caseType=='1'){
	        			caseTypeName = "客户";
	        		} else if(caseType=='2'){
	        			caseTypeName = "查勘员";
	        		} else if(caseType=='3'){
	        			caseTypeName = "修理厂";
	        		}
	        		
	        		//添加信息到当前任务中
	        		var dlBuffer = new StringBuffer();
		        	dlBuffer.append("<div class=\"twoBtu\"><a href=\"javascript:;\" onclick=\"show(this)\" >"+caseTypeName+":"+userNum+"</a><input type=\"button\" value=\"结束\" onclick=\"endVideo(this,'"+userName+"','"+userNum+"','"+caseNo+"','"+licenseNo+"','"+caseType+"')\"><input type=\"button\" value=\"重派\" class=\"marR0\" onclick=\"cancelCase(this,'"+caseNo+"','"+userNum+"')\" />");
	        		dlBuffer.append("<dl class=\"dl_con\" style=\"display:none;\" >");
		        	dlBuffer.append("<dt>案件号：</dt><dd>"+caseNo+"<input type='hidden' name='caseNo' value='"+caseNo+"' /><input type='hidden' name='caseType' value='"+caseType+"' /><input type='hidden' name='mobileNo' value='"+userNum+"' /></dd>");
		        	dlBuffer.append("<dt>车牌号：</dt><dd>"+licenseNo+"</dd>");
            		if(caseType=='1'){
            			dlBuffer.append("<dt>案件类型：</dt><dd>自助案件</dd>");
            			dlBuffer.append("<dt>客户：</dt><dd style='cursor:pointer;color:#196ec8' ondblclick=\"callUser('"+userNum+"','"+caseNo+"')\">"+userNum+"</dd>");
            		} else if(caseType=='2'){
            			dlBuffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
            			dlBuffer.append("<dt>查勘员：</dt><dd>"+userName+"</dd>");
            			dlBuffer.append("<dt>设备名：</dt><dd style='cursor:pointer;color:#196ec8' ondblclick=\"callUser('"+userNum+"','"+caseNo+"')\">"+userNum+"</dd>");
            		} else if(caseType=='3'){
            			dlBuffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
            			dlBuffer.append("<dt>修理厂：</dt><dd style='cursor:pointer;color:#196ec8' ondblclick=\"callUser('"+userNum+"','"+caseNo+"')\">"+userNum+"</dd>");
            		}
            		callout_phoneNo=userNum;
        			callout_caseNo=caseNo;
            		
		        	dlBuffer.append("<dt>接受时间：</dt><dd>"+time+"</dd>");
		        	dlBuffer.append("</dl>");
		        	dlBuffer.append("</div>");
		        	$('#chulicase', window.parent.document).append(dlBuffer.toString());
		        	strPhoneNo = userNum;
		        	strCaseNo = caseNo;
				}
				unFinishedTaskInit(strCaseNo, strPhoneNo);//初始化右侧调度页面
				refreshImg();
			} else {
				dispatchStatus_init();
			}
		}
	});
}

function checkHistoryCase(){
	if($('#chulicase', window.parent.document).find("input[name='caseNo']").is("input") && (curCaseNo==null || curCaseNo=="")){//表示有案件
		phoneNo = $('#chulicase', window.parent.document).find("input[name='mobileNo']").val();
		curCaseNo = $('#chulicase', window.parent.document).find("input[name='caseNo']").val();
		m_iTaskId = 1;
		m_haveTask = false;
		$("#StatusButton0").attr("disabled",false);//有空按钮不可点击
		$("#StatusButton2").attr("disabled",false);//离开按钮可点击
		$(".controlInfo").html("<div align='center' style='color:#0000CC'>您当前有任务正在处理，见左下角！</div>");
		refreshImg();
		parent.parent.topFrame.seatStatus = 3;//有 任务，繁忙状态
		var state = parent.parent.topFrame.document.getElementById("state").value;
		if(state==200){
			if (AINF.AgentEnterWrapUp() != 0)
			{
				AINF.AgentEnterWrapUp();
			}
		}
		return true;
	}
	return false;
}

//为防止在请求呼入过程中刷新页面，需在页面加载过程中判断是否有呼入的请求 有则将进行释放
function callinListen(){
	var state = parent.parent.topFrame.document.getElementById("state").value;
	if(state=='312'){
		AINF.ReleaseCall(6);//客户自助的请求由于ticketid丢失，故忽略
	}
	if(state==200 && $("#StatusButton0").attr("disabled")!='disabled'){
		$("#StatusButton0").attr("disabled",true);//有空按钮不可点击
		$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：空闲！</div>");
	}
	if(state==105 && $("#StatusButton2").attr("disabled")!='disabled'){
		$("#StatusButton2").attr("disabled",true);//有空按钮不可点击
		$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：离开！</div>");
	}
}

/**
 * 获取坐席当天的调度信息
 */
function getHisDispatchInfo(){
	var url = contextRootPath + "/dispatch/dispatch_getSeatDispatchInfoList?random="+Math.random();
	$.ajax({
    	type: "POST",
        url: url,
        success: function(jsonData){
        	if(jsonData != null && jsonData != ''){
        		var obj = $.parseJSON(jsonData);
        		$("#dd_content").html("");
        		for(var i=0; i<obj.length; i++){
        			var data = obj[i];
        			var buffer = new StringBuffer();
        			buffer.append("<dl class='info_con'>");
            		buffer.append("<dt>案件号：</dt><dd>" +data.caseNo+ "</dd>");
            		if(data.caseType=='1'){
            			buffer.append("<dt>案件类型：</dt><dd>自助案件</dd>");
            			buffer.append("<dt>车牌号：</dt><dd class=\"ddBg\">"+data.licenseNo+"</dd>");
                		buffer.append("<dt>客户：</dt><dd class=\"ddBg\">"+data.userNum+"</dd>");
            		} else if(data.caseType=='2'){
            			buffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
            			buffer.append("<dt>车牌号：</dt><dd class=\"ddBg\">"+data.licenseNo+"</dd>");
                		buffer.append("<dt>查勘员：</dt><dd class=\"ddBg\">"+data.userNum+"&nbsp;"+data.userName+"</dd>");
            		} else if(data.caseType=='3'){
            			buffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
            			buffer.append("<dt>车牌号：</dt><dd class=\"ddBg\">"+data.licenseNo+"</dd>");
                		buffer.append("<dt>修理厂：</dt><dd class=\"ddBg\">"+data.userNum+"&nbsp;"+data.userName+"</dd>");
            		}
            		buffer.append("<dt>接受时间：</dt><dd>" +data.acceptTime+"</dd>");
            		buffer.append("</dl>");
    				//将调度信息存放至调度信息div中
    				$("#dd_content").append(buffer.toString());
        		}
        	}
		}
	});
}

/**
 * 获取调度案件信息
 * @param caseNo 案件号
 * @param callType 调度类型 1手机呼叫 2后台呼叫
 * @param ticketid 视频组件识别码
 * @param curPhoneNo 当前呼叫的手机号码
 */
function dispatchCaseInfo(caseNo, callType, ticketid, curPhoneNo){
	m_haveTask = true;//先占用，防止此时有任务又触发该方法
	phoneNo = curPhoneNo;
	curCaseNo = caseNo;
	var url = contextRootPath + "/dispatch/dispatch_dispatchCaseInfo?random="+Math.random();
	$.ajax({
    	type: "POST",
        url: url,
        data:{caseNo:caseNo},
        success: function(data){
        	if(data=='timeout'){
        		alert("登录系统超时，请重新登录！");
        		if(callType==2){
        			AINF.TicketDeal(0,ticketid,"");
        		} else {
        			AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
        		}
        		AINF.SignOut();
			    AINF.Uninitial();
        		top.location.href = contextRootPath+"/login_plat/login_logoff";
        	} else if(data!=null && data!='') {
        		data = $.parseJSON(data);
            	if(data != ''){
            		var date = data.acceptTime.split(" ");
            		var buffer = new StringBuffer();
            		var buffer1 = new StringBuffer();
            		buffer1.append("<dl class='info_con'>");
            		buffer.append("<dt>案件号：</dt><dd>" +data.caseNo+ "<input type='hidden' name='caseNo' value='"+data.caseNo+"' /><input type='hidden' name='caseType' value='"+data.caseType+"' /></dd>");
            		buffer1.append("<dt>案件号：</dt><dd>" +data.caseNo+ "</dd>");
            		buffer.append("<dt>车牌号：</dt><dd>" +data.licenseNo+ "</dd>");
            		if(phoneNo==null){
            			phoneNo = data.userNum;
            		}
            		if(data.caseType=='1'){
            			buffer.append("<dt>案件类型：</dt><dd>自助案件</dd>");
                		buffer.append("<dt>客户：</dt><dd class=\"ddBg\">"+data.userNum+"<input name='acceptBtn' type=\"button\" value=\"接受\" class=\"recieve\" onclick=receiveCase(this,'"+data.userCode+"','"+data.caseUuid+"','"+data.caseNo+"','"+data.caseType+"','"+data.licenseNo+"','"+data.userNum+"','"+data.userName+"','"+date[0]+"','"+date[1]+"','"+callType+"','"+ticketid+"') ></dd>");
                		buffer1.append("<dt>案件类型：</dt><dd>自助案件</dd>");
                		buffer1.append("<dt>车牌号：</dt><dd class=\"ddBg\">"+data.licenseNo+"</dd>");
                		buffer1.append("<dt>客户：</dt><dd class=\"ddBg\">"+data.userNum+"</dd>");
            		} else if(data.caseType=='2'){
            			buffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
                		buffer.append("<dt>查勘员：</dt><dd class=\"ddBg\">"+data.userNum+"<input name='acceptBtn' type=\"button\" value=\"接受\" class=\"recieve\" onclick=receiveCase(this,'"+data.userCode+"','"+data.caseUuid+"','"+data.caseNo+"','"+data.caseType+"','"+data.licenseNo+"','"+data.userNum+"','"+data.userName+"','"+date[0]+"','"+date[1]+"','"+callType+"','"+ticketid+"') ></dd>");
                		buffer1.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
                		buffer1.append("<dt>车牌号：</dt><dd class=\"ddBg\">"+data.licenseNo+"</dd>");
                		buffer1.append("<dt>查勘员：</dt><dd class=\"ddBg\">"+data.userNum+"&nbsp;"+data.userName+"</dd>");
            		} else if(data.caseType=='3'){
            			buffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
                		buffer.append("<dt>修理厂：</dt><dd class=\"ddBg\">"+data.userNum+"<input name='acceptBtn' type=\"button\" value=\"接受\" class=\"recieve\" onclick=receiveCase(this,'"+data.userCode+"','"+data.caseUuid+"','"+data.caseNo+"','"+data.caseType+"','"+data.licenseNo+"','"+data.userNum+"','"+data.userName+"','"+date[0]+"','"+date[1]+"','"+callType+"','"+ticketid+"') ></dd>");
                		buffer1.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
                		buffer1.append("<dt>车牌号：</dt><dd class=\"ddBg\">"+data.licenseNo+"</dd>");
                		buffer1.append("<dt>查勘员：</dt><dd class=\"ddBg\">"+data.userNum+"&nbsp;"+data.userName+"</dd>");
            		}
            		buffer.append("<dt>接受时间：</dt><dd>" +data.acceptTime+"</dd>");
            		buffer1.append("<dt>接受时间：</dt><dd>" +data.acceptTime+"</dd>");
            		//将调度信息存放至调度信息div中
            		buffer1.append("</dl>");
    				$("#dd_content").append(buffer1.toString());
            		buffer.append("<div name='curCaseInfoDiv' style='margin-top:4px;width:100%;height:26px;text-align:center;'></div>");
            		insertDispatsh(buffer.toString());
    				play_music();
    				timeoutId = setTimeout("checkCaseInfo('"+data.caseNo+"','"+callType+"','"+ticketid+"')", 20000);//20秒后校验是否已确认
            	} else {
            		m_haveTask = false;//系统出现异常，表明任务推送失败，释放掉任务
            		if(callType==2){
            			AINF.TicketDeal(0,ticketid,"");
            		} else {
            			AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
            		}
            	}
        	}
		}
	});
}

//空闲按钮显示设置
function setIdleBtn(rs){
	$("#StatusButton0").attr("disabled",rs);
	if(rs==true){
		$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：空闲！</div>");
	}
}
//离开按钮显示设置
function setLeaveBtn(rs){
	$("#StatusButton2").attr("disabled",rs);
	if(rs==true){
		$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：离开！</div>");
	}
}

function clearInfo(){//清空显示消息
	$(".controlInfo").html("");
}

function setFreeIfNoTask(){
	if (m_iTaskId<=0 && !m_haveTask) {
		AINF.SetIdle();
	}
}

function resetSetStatus(originStatus){
	if(originStatus==0 || originStatus==2){
		//判断当前是否有振铃事件
		if($(".controlInfo").find("input[name='acceptBtn']").size() > 0){
			//通话中断，此时需取消整个通话过程
			if(timeoutId!=null) clearTimeout(timeoutId);
			close_music();
    		m_haveTask = false;
    		m_iTaskId = 0;
    		phoneNo = "";
    		curCaseNo = "";
    		callOutNo = "";
    		$("#picbody").html("");
    		$(".controlInfo").find("dt").remove();
    		$(".controlInfo").find("dd").remove();
    		$(".controlInfo").find("div[name='curCaseInfoDiv']").attr("style","margin-top:4px;width:100%;height:26px;text-align:center;color:red").html("用户已取消呼叫,自动中断本次案件推送！");
    		$(".controlInfo").find("input[name='acceptBtn']").remove();
		}
		if(AINF.SetIdle()==0){
			$("#StatusButton0").attr("disabled",true);//有空按钮不可点击
			$("#StatusButton2").attr("disabled",false);//暂离按钮可点击
			if($(".controlInfo").find("div[name='curCaseInfoDiv']").size() < 1){
				$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：空闲！</div>");
			}
		} else {
			$("#StatusButton0").attr("disabled",false);//有空按钮可点击
		}
	} else if(originStatus==1){
		if(AINF.SetBusy()==0){
			$("#StatusButton2").attr("disabled",true);//暂离按钮不可点击
			$("#StatusButton0").attr("disabled",false);//有空按钮可点击
			if($(".controlInfo").find("div[name='curCaseInfoDiv']").size() < 1){
				$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：离开！</div>");
			}
		} else {
			$("#StatusButton2").attr("disabled",false);//暂离按钮可点击
		}
	} else if(originStatus==3){
		AINF.AgentEnterWrapUp();
		$("#StatusButton0").attr("disabled",false);//有空按钮可点击
		$("#StatusButton2").attr("disabled",false);//暂离按钮可点击
		$(".controlInfo").html("<div align='center' style='color:#0000CC'>您当前有任务正在处理，见左下角！</div>");
	}
}

/**
 * 校验坐席是否接受了任务，若无需将坐席置为暂离状态
 */
function checkCaseInfo(caseNo,callType,ticketid){
	if(caseNo!=null && caseNo!=''){
		tryNum++;
		var url = contextRootPath + "/dispatch/dispatch_getCaseStatus?random="+Math.random();
		$.ajax({
	    	type: "POST",
	        url: url,
	        data:{caseNum:caseNo},
	        success: function(data){
	        	if(data!=null && data!="" && data>=0){
	        		tryNum = 0;
	        		phoneNo = "";
	        		curCaseNo = "";
	        		callOutNo = "";
	        		close_music();
	        		m_haveTask = false;
	        		m_iTaskId = 0;
	        		$("#picbody").html("");
	        		$(".controlInfo").find("dt").remove();
	        		$(".controlInfo").find("dd").remove();
	        		$(".controlInfo").find("div[name='curCaseInfoDiv']").attr("style","margin-top:4px;width:100%;height:26px;text-align:center;color:red").html("接受超时，你被系统置为离开！");
	        		$(".controlInfo").find("input[name='acceptBtn']").remove();
	        		parent.parent.topFrame.seatStatus = 1;
	        		if(callType==2){
	        			AINF.TicketDeal(0,ticketid,"");
	        		} else {
	        			//displayInfo("--------开始调用ReleaseCall：");
	        			AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
	        		}
	        	} else {
	        		if(tryNum<=3){
	        			checkCaseInfo(caseNo,callType,ticketid);//重新请求一次
	        		} else {
	        			tryNum = 0;
	        		}
	        	}
			}
		});
	}
}

/** 切换操作信息显示 */
function ShowPicDiv(id) {
	if (1 == id) {
		document.getElementById("PicDiv").style.display = "";
		document.getElementById("SysDiv").style.display = "none";
		document.getElementById("spanPic").style.color = "#FF0000";
		document.getElementById("spanSys").style.color = "#000000";
	} else {
		document.getElementById("PicDiv").style.display = "none";
		document.getElementById("SysDiv").style.display = "";
		document.getElementById("spanPic").style.color = "#000000";
		document.getElementById("spanSys").style.color = "#FF0000";
	}
}

/** 用户状态置为离开*/
function SetLeave() {
	if(isHaveTask()){
		return;
	}
	//获取坐席当前状态，判断是否可以点击离开按钮
	var strstate = parent.parent.topFrame.document.getElementById("state").value;
	if(strstate!=''){
		var state = parseInt(strstate, 10);
		if ((state >= 200 && state < 300) || state == 108 || state == 109 || state == 102
	            || (state >= 400 && state < 500))
	    {
			//坐席示忙
			if (AINF.SetBusy() != 0)
			{
				alert("置离开状态失败，请重试！");
				return;
			}
			parent.parent.topFrame.seatStatus = 1;
			SetStatus(2, 0);
	    }
		else if(state == 105){
			parent.parent.topFrame.seatStatus = 1;
			SetStatus(2, 0);
		}
	    else
	    {
	        alert("当前无法置成离开！");
	    }
	} else {
		alert("当前无法置成离开！");
	}
}

function setToBusy(seatStatus){
	var result = 0;
	var strstate = parent.parent.topFrame.document.getElementById("state").value;
	if(strstate!=''){
		var state = parseInt(strstate, 10);
		if ((state >= 200 && state < 300) || state == 108 || state == 109 || state == 102 || state == 400
	            || (state >= 402 && state < 500))
	    {
			//坐席示忙
			if (AINF.AgentEnterWrapUp() != 0)
			{
				result = 1;
			} else {
				parent.parent.topFrame.seatStatus = seatStatus;
			}
	    }
		else if(state == 401){
			result = 0;
			parent.parent.topFrame.seatStatus = seatStatus;
		}
	    else
	    {
	    	result = 1;
	    }
	} else {
		result = 1;
	}
	return result;
}

/**	用户状态置为空闲*/
function Setfree()
{	
	if(isFree()){
		return;
	}
	//获取坐席当前状态，判断是否可以点击离开按钮
	var strstate = parent.parent.topFrame.document.getElementById("state").value;
	if(strstate!=''){
		var state = parseInt(strstate, 10);
		if ((state >= 105 && state < 108) || state == 111 || state == 317 || state == 102
	            || (state >= 400 && state < 500))
	    {
			//座席设置示闲
			if (AINF.SetIdle() != 0)
			{
				alert("置空闲状态失败，请重试！");
				return;
			}
			parent.parent.topFrame.seatStatus = 2;
			SetStatus(0,0);
	    }
		else if(state == 200){
			parent.parent.topFrame.seatStatus = 2;
			SetStatus(0,0);
		}
	    else
	    {
	        alert("当前无法置成空闲！");
	    }
	} else {
		alert("当前无法置成空闲！");
	}
}

function setToFree(seatStatus)
{	
	var result = 0;
	//获取坐席当前状态，判断是否可以点击离开按钮
	var strstate = parent.parent.topFrame.document.getElementById("state").value;
	if(strstate!=''){
		var state = parseInt(strstate, 10);
		if ((state >= 105 && state < 108) || state == 111 || state == 317 || state == 102
	            || (state >= 400 && state < 500))
	    {
			//座席设置示闲
			if (AINF.SetIdle() != 0)
			{
				result = 1;
			} else {
				parent.parent.topFrame.seatStatus = seatStatus;
			}
	    }
		else if(state == 200){
			result = 0;
			parent.parent.topFrame.seatStatus = seatStatus;
		}
	    else
	    {
	    	result = 1;
	    }
	} else {
		result = 1;
	}
	return result;
}

/**	更新对应用户状态*/
function SetStatus(iStatus)
{
	if(iStatus > 2)
		return;
	switch(iStatus)
	{
 	case 2 : 
		$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：离开！</div>");
		$("#StatusButton0").attr("disabled",false);//有空按钮可点击
		$("#StatusButton2").attr("disabled",true);//离开按钮可点击
		break;
	case 1 :
		$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：繁忙！</div>"); 
		break;
	case 0 : 
        $(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：空闲！</div>");
        $("#StatusButton0").attr("disabled",true);//有空按钮可点击
		$("#StatusButton2").attr("disabled",false);//离开按钮可点击
		break;
	default : 
	 	$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您的状态异常"+iStatus+"请置有空！</div>"); 
		break;  
	}
}

/**	是否要播放音乐*/
var need_music = true; //是否需要音乐

function play_music(){
	if(need_music){
		Player.controls.play();
		flash();
	}
}

/** 是否静音 */
function controlMusic(){
	if(need_music){
		clearU();
		Player.controls.stop();
		need_music = false;
		document.getElementById("alarms").src= contextRootPath +"/msplatform/images/tb2/alarm_nosound.gif";
	} else {
		need_music = true;
		document.getElementById("alarms").src= contextRootPath +"/msplatform/images/tb2/alarm.gif";
	}
}

var changeAlarm = 0;
//小喇叭闪烁
var flash = function(){
	clearU();
	changeAlarm = setInterval(function(){
		if($("#alarms").attr("src") == (contextRootPath +"/msplatform/images/tb2/alarm.gif")) {
			$("#alarms").attr("src", contextRootPath +"/msplatform/images/tb2/alarm2.gif");
		} else {
			$("#alarms").attr("src", contextRootPath +"/msplatform/images/tb2/alarm.gif");
		}
	}, 200);
};

var close_music = function(){
	if(need_music){
		clearU();
		Player.controls.stop();
		document.getElementById("alarms").src= contextRootPath +"/msplatform/images/tb2/alarm.gif";
	}
};

var clearU = function(){
	if(changeAlarm != 0){
		clearInterval(changeAlarm);
		changeAlarm = 0;
	}
};

//显示调度信息
function insertDispatsh(szInfo)
{
	var divInfo = "<div align='center' style='color:#0000CC' >您有新任务，信息如下:</div>";
	divInfo += szInfo;
	$(".controlInfo").html(divInfo);
    m_haveTask = true;
    m_iTaskId = -1;//未接受案件
}

//调度信息接受,关闭提示音
function receiveCase(obj,userCode,caseUuid,caseNo,caseType,licenseNo,userNum,userName,acceptDate,acceptTime,callType,ticketid){
	obj.disabled = true;
	//displayInfo("调用receiveCase方法："+ticketid);
	//取消校验
	clearTimeout(timeoutId);
	//判断当前坐席是否有任务，若有任务则不可点击接受，此校验是防止出现异常情况，导致坐席有任务的情况下还接受到任务的推送
	if($('#chulicase', window.parent.document).find("input[name='caseNo']").is("input")){
		close_music();
		m_haveTask = false;
		m_iTaskId = 1;
		parent.parent.topFrame.seatStatus = 3;//有 任务，繁忙状态
		if(callType==2){
			AINF.TicketDeal(0,ticketid,"");
		} else {
			AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
		}
		$(".controlInfo").html("");
		return;
	}
	if(AINF){																		
		close_music();
		var time = acceptDate + " " + acceptTime;
		if(callType==2){
			var strrs = AINF.TicketDeal(1,ticketid,"");
			var rs = strrs.split(";")[0].split("=")[1];
			if(rs!=0){
				$(".controlInfo").find("dt").remove();
        		$(".controlInfo").find("dd").remove();
				$(".controlInfo").find("div[name='curCaseInfoDiv']").attr("style","margin-top:4px;width:100%;height:26px;text-align:center;color:red").html("建立通信异常，请联系管理员！");
        		$(".controlInfo").find("input[name='acceptBtn']").remove();
        		m_haveTask = false;
	        	m_iTaskId = 0;
	        	phoneNo = "";
        		curCaseNo = "";
        		callOutNo = "";
    			return;
    		}
		}
		$.ajax({
	    	type: "POST",
	    	data:{
	    		userCode:userCode,
	    		caseUuid:caseUuid,
	    		caseNo:caseNo,
				caseType:caseType,
				licenseNo:licenseNo,
				userNum:userNum,
				userName:userName,
				acceptTime:time
	    	},
	        url: contextRootPath + "/dispatch/dispatch_receiveCaseInfo",
	        success: function(data){
	        	if(data=='success'){
	        		data_curtask.put("caseType", caseType);
	        		data_curtask.put("userNum", userNum);
	        		data_curtask.put("userName", userName);
	        		data_curtask.put("caseNo", caseNo);
	        		data_curtask.put("licenseNo", licenseNo);
	        		data_curtask.put("phoneNo", phoneNo);
	        		data_curtask.put("time", time);
	        		if(callType!=2){
		        		if(AINF.Answer(6) != 0){
		        			//调用中兴的挂机方法
		        			AINF.ReleaseCall(6);
		        			dispatchStatus_init();
			    			data_curtask = new Map();
			    			alert("本次视频通话失败，请重试！");
			    		} else {
			    			//坐席示忙
			    			setToBusy(3);
			    		}
		        	}else{
		        		//坐席示忙
		    			setToBusy(3);
		        		showCurtask();
		        	}
	        		//预占排队成功
	        		//oncampSuccess();
	        		
	        	} else if(data=='redispatch'){
	        		parent.parent.topFrame.seatStatus = 2;
	        		$(".controlInfo").find("dt").remove();
	        		$(".controlInfo").find("dd").remove();
	        		$(".controlInfo").find("div[name='curCaseInfoDiv']").attr("style","margin-top:4px;width:100%;height:26px;text-align:center;color:red").html("案件已注销或改派！");
	        		$(".controlInfo").find("input[name='acceptBtn']").remove();
	        		phoneNo = "";
	        		curCaseNo = "";
	        		m_iTaskId = -1;
	        		m_haveTask = false;
	        		if(callType==2){
	        			 var state = parent.parent.topFrame.document.getElementById("state").value;
	        			 if(state==200 || (state >= 300 && state < 318)){
	        				 if(AINF.SetBusyEx(1,"cancelticket=1")==0){//取消预占
	        					 parent.topFrame.document.getElementById("state").value = 105;
	        					 if (setToFree(2) == 0) {
	     		        			$("#StatusButton0").attr("disabled",true);//示闲成功，有空按钮不可点击
	     		        		 }
	        				 } else {
	        					 if(AINF.SetBusyEx(1,"cancelticket=1")==0){//取消预占
		        					 parent.topFrame.document.getElementById("state").value = 105;
		        					 if (setToFree(2) == 0) {
		     		        			$("#StatusButton0").attr("disabled",true);//示闲成功，有空按钮不可点击
		     		        		 } else {
		     		        			$("#StatusButton0").attr("disabled",false);
		     		        		 }
		        				 }
	        				 }
	        			 }
		        	} else {
		        		if(AINF.ReleaseCall(6) != 0){
			    		}
		        	}
	        	} else if(data=='error'){
	        		parent.parent.topFrame.seatStatus = 2;
	        		//清空已有信息，腾出新的地方显示异常信息
	        		$(".controlInfo").find("dt").remove();
	        		$(".controlInfo").find("dd").remove();
	        		$(".controlInfo").find("div[name='curCaseInfoDiv']").attr("style","margin-top:4px;width:100%;height:26px;text-align:center;color:red").html("与理赔系统通信异常，接受失败，请联系管理员！");
	        		$(".controlInfo").find("input[name='acceptBtn']").remove();
	        		//设置空闲
	        		phoneNo = "";
	        		curCaseNo = "";
	        		m_iTaskId = -1;
	        		m_haveTask = false;
	        		if(callType==2){
	        			 var state = parent.parent.topFrame.document.getElementById("state").value;
	        			 if(state==200 || (state >= 300 && state < 318)){
	        				 if(AINF.SetBusyEx(1,"cancelticket=1")==0){//取消预占
	        					 parent.topFrame.document.getElementById("state").value = 105;
	        					 if (setToFree(2) == 0) {
	     		        			$("#StatusButton0").attr("disabled",true);//示闲成功，有空按钮不可点击
	     		        		 }
	        				 } else {
	        					 if(AINF.SetBusyEx(1,"cancelticket=1")==0){//取消预占
		        					 parent.topFrame.document.getElementById("state").value = 105;
		        					 if (setToFree(2) == 0) {
		     		        			$("#StatusButton0").attr("disabled",true);//示闲成功，有空按钮不可点击
		     		        		 } else {
		     		        			$("#StatusButton0").attr("disabled",false);
		     		        		 }
		        				 }
	        				 }
	        			 }
		        	} else {
		        		var state = parent.parent.topFrame.document.getElementById("state").value;
		        		if(state>=300 && state<318){
		        			if(AINF.ReleaseCall(6) == 0){
		        				parent.parent.topFrame.document.getElementById("state").value = 400;
				    		}
		        		}
		        		if(state!=200 && state!=400 && state!=312){
		        			$("#StatusButton0").attr("disabled",false);//有空按钮可点击
			        		$("#StatusButton2").attr("disabled",false);//离开按钮可点击
			        		if (setToFree(2) == 0) {
			        			$("#StatusButton0").attr("disabled",true);//示闲成功，有空按钮不可点击
			        		}
		        		}
		        	}
	        	} else if(data=='timeout'){//登录超时
	        		alert("登录系统超时，请重新登录！");
	        		if(callType==2){
	        			AINF.TicketDeal(0,ticketid,"");
	        		} else {
	        			AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
	        		}
	        		AINF.SignOut();
				    AINF.Uninitial();
	        		top.location.href = contextRootPath+"/login_plat/login_logoff";
	        	} else {
	        		$(".controlInfo").find("div[name='curCaseInfoDiv']").attr("style","margin-top:4px;width:100%;height:26px;text-align:center;color:red").html("系统异常，接受失败，请联系管理员！");
	        		$(".controlInfo").find("input[name='acceptBtn']").remove();
	        		if(callType==2){
	        			var strrs = AINF.TicketDeal(0,ticketid,"");
	        			var rs = strrs.split(";")[0].split("=")[1];
		        		if(rs!=0){
		        		}
		        	} else {
		        		if(AINF.ReleaseCall(6) != 0){
			    		}
		        	}
	        		//设置空闲
	        		phoneNo = "";
	        		curCaseNo = "";
	        		m_iTaskId = -1;
	        		m_haveTask = false;
	        	}
	        }
		});
	} else {
		alert("系统处理失败，请重新登录后重试！若问题还在，请联系管理员！");
	}
}

function acceptCase(){
	
}

function oncampSuccess(){
	var recordInfo = AINF.GetRecordRelatedInfo();//获取录像相关信息 格式：成功的返回结果格式：录音记录标识|呼叫流水号|呼叫ID
	//displayInfo("获取正在进行录音的相关信息="+recordInfo);
	var flowNo = "";//呼叫流水号
	if(recordInfo != ""){
		flowNo = recordInfo.split("|")[1];
		$.ajax({
			type : "POST",
			url  :	contextRootPath + "/dispatch/dispatch_oncampSuccess",
			data : {
				flowNo : flowNo
			},
			async : false,
			success : function(data){
			}
		});
	}
}


//结束所有案件后，重置标示位
function noTask(){
	if(m_iTaskId < 1){
		m_haveTask=false;
		//$("#StatusButton2").attr("disabled",false);
		$(".controlInfo").html("<div align='center' style='color:#0033FF;'>您当前的状态为：空闲！</div>");
	}
}

/**
 * 判断是否有任务
 * @param isTip 是否提示
 * @param tip 提示内容
 */
function isHaveTask(isTip, tip){
	var taskFlag = false;
	if (m_iTaskId>0 || m_haveTask) {
		if(isTip==null){
			alert("您当前有任务！无法离开");
		} else if(isTip){
			alert(tip);
		}
		taskFlag = true;
	}
	return taskFlag;
}

//判断是否有任务
function isFree(){
	var taskFlag = false;
	if (m_iTaskId>0 || m_haveTask) {
		alert("您当前有任务正在处理");
		taskFlag = true;
	}
	return taskFlag;
}

/**
 * 拍照成功调用的方法
 */
function onShotSuccess(imgPath){
	//获取呼叫类型 呼入 呼出
	var callType = parent.parent.topFrame.document.getElementById("callType").value;
	if(callType != 'callin'){//主动呼出
		if(curCaseNo!=null && curCaseNo!=""){
			if(phoneNo != callOutNo){
				return;
			}
		} else {
			return;
		}
	}
	if(curCaseNo!=null && curCaseNo!=""){
		var url = contextRootPath + "/uploadImg/uploadImg_savePhoto?random="+Math.random();
		$.ajax({
	    	type: "POST",
	        url: url,
	        data:{imgPath:imgPath,mobile:phoneNo,caseNo:curCaseNo},
	        success: function(jsonData){
	        	if(jsonData!=null && jsonData!=""){
	        		var obj = $.parseJSON(jsonData);
	        		var buffer = new StringBuffer();
	        		buffer.append("<table class=\"table_img\">");
	        		buffer.append("	<tr class=\"tr_photo1\">");
	        		buffer.append("		<td class=\"td_box\">");
	        		buffer.append("			<input type=\"checkbox\" name=\"index_box\" onclick=\"checkAllBox(this);\">");
	        		buffer.append("			<input type=\"hidden\" name=\"picId\" value=\""+obj.ID+"\">");
	        		buffer.append("		</td>");
	        		buffer.append("		<td class=\"td_img\"><img name='shootImgName' src='"+contextRootPath+"/uploadImg/uploadImg_showPhotos?ossUuid="+obj.ossUuid+"' ondblclick=\"showPhoto("+obj.ID+")\"/></td>");
	        		buffer.append("		<td class=\"td_time\">"+obj.imgDate+"<br/>"+obj.imgTime+"</td>");
	        		buffer.append("	</tr>");
	        		buffer.append("</table>");
	        		$("#picbody").prepend(buffer.toString());
	        	}
			}
		});
	}
}

/**
 * 设置变量值
 * @param param1 当前案件号
 * @param param2 手机号或查勘员工号
 */
function setVariableValue(param1,param2){
	curCaseNo = param1;
	phoneNo = param2;
}

function selectAll(obj){
	if(obj.checked){
		$("input[name='index_box']").prop("checked",true);
	} else {
		$("input[name='index_box']").prop("checked",false);
	}
}
function checkAllBox(obj){
	if(!obj.checked){
		$("input[name='all_box']").prop("checked",false);
	}
}
function downloadAllPicToZIP(){
	var _list = [];
	$("input[name='picId']").each(function(index){
		_list[index] = $(this).val();
	});
	if(_list.length > 0){
		var url = contextRootPath + "/uploadImg/uploadImg_downLoadPics";
		var form = $("<form>");// 定义一个form表单
		form.attr("style", "display:none");
		form.attr("method", "post");
		form.attr("action", url);
		form.attr("target", "blankFrame");
		$("body").append(form);// 将表单放置在web中
		var input1 = $("<input>");
		input1.attr("type", "hidden");
		input1.attr("name", "requestType");
		input1.attr("value", 1);
		form.append(input1);
		input1 = $("<input>");
		input1.attr("type", "hidden");
		input1.attr("name", "caseNo");
		input1.attr("value", curCaseNo);
		form.append(input1);
		for(var i=0; i<_list.length; i++){
			var input2 = $("<input>");
			input2.attr("type", "hidden");
			input2.attr("name", "picIds");
			input2.attr("value", _list[i]);
			form.append(input2);
		}
		form.submit();// 表单提交
	}
}
/** 点击照片弹出新窗口 */
function showPhoto(curPicId) {
	var picAry = [];
	var picIdAry = [];
	$(".table_img").each(function(){
		picIdAry[picIdAry.length] = $(this).find("input[name='picId']").val();
		picAry[picAry.length] = $(this).find("img[name='shootImgName']").attr("src");
	});
	var paramObj = {
		pWindow:window,
		picIdAry:picIdAry,
		picAry:picAry,
		curPicId:curPicId
	};
	var url = contextRootPath + "/msplatform/pages/video/showImg.jsp?random="+ Math.random();
	window.showModalDialog(url, paramObj, 'dialogWidth:650px;dialogHeight:800px;scroll:no;status:no;center:yes');
}
/**删除图片*/
function deletePhoto(){
	if(curCaseNo!=null && curCaseNo!=""){
		var _list = [];
		var index = 0;
		$("input[name='index_box']").each(function(){
			if($(this)[0].checked==true){
				_list[index++] = $(this).siblings("input[name='picId']").val();
			}
		});
		if(_list.length > 0 && confirm("确定要删除吗？")){
			var url = contextRootPath + "/uploadImg/uploadImg_delete?random="+Math.random();
			$.ajax({
		    	type: "POST",
		        url: url,
		        data:{requestType:'2',picIds:_list},
		        traditional: true,
		        success: function(data){
		        	if(data=='success'){
		        		$(".table_img").each(function(){
							if($(this).find("input[name='index_box']")[0].checked==true){
								$(this).remove();
							}
						});
		        	} else {
		        		alert("删除失败，请稍后重试");
		        	}
				}
			});
		}
	} else {
		$(".table_img").each(function(){
			if($(this).find("input[name='index_box']")[0].checked==true){
				$(this).remove();
			}
		});
	}
}

/**删除单张图片*/
function deleteOnePhoto(picId){
	var result = 0;
	if(curCaseNo!=null && curCaseNo!=""){
		var _list = [picId];
		var url = contextRootPath + "/uploadImg/uploadImg_delete?random="+Math.random();
		$.ajax({
	    	type: "POST",
	        url: url,
	        data:{requestType:'2',picIds:_list},
	        async: false,
	        traditional: true,
	        success: function(data){
	        	if(data=='success'){
	        		$(".table_img").each(function(){
	        			if($(this).find("input[name='picId']").val()==picId){
	        				$(this).remove();
	        			}
					});
	        	} else {
	        		result = 1;
	        	}
			}
		});
	} else {
		result = 1;
	}
	return result;
}

function refreshImg(){
	if(m_iTaskId>0 && curCaseNo!=null && curCaseNo!=""){
		var url = contextRootPath + "/uploadImg/uploadImg_getAllShootImg?random="+Math.random();
		$.ajax({
			type: "POST",
			url: url,
			data:{caseNo:curCaseNo},
			success: function(jsonData){
				if(jsonData!=null && jsonData!=''){
					$("#picbody").html("");
					var jsonArray = $.parseJSON(jsonData);
					var obj;
					for(var i =0;i<jsonArray.length;i++){
						obj = jsonArray[i];
						var buffer = new StringBuffer();
						buffer.append("<table class=\"table_img\">");
						buffer.append("	<tr class=\"tr_photo1\">");
						buffer.append("		<td class=\"td_box\">");
						buffer.append("			<input type=\"checkbox\" name=\"index_box\" onclick=\"checkAllBox(this);\">");
						buffer.append("			<input type=\"hidden\" name=\"picId\" value=\""+obj.ID+"\">");
						buffer.append("		</td>");
						buffer.append("		<td class=\"td_img\"><img name='shootImgName' src='"+contextRootPath+"/uploadImg/uploadImg_showPhotos?ossUuid="+obj.ossUuid+"' ondblclick=\"showPhoto("+obj.ID+")\"/></td>");
						buffer.append("		<td class=\"td_time\">"+obj.imgDate+"<br/>"+obj.imgTime+"</td>");
						buffer.append("	</tr>");
						buffer.append("</table>");
						$("#picbody").append(buffer.toString());
					}
				}
			}
		});
	}
}

function showCurtask(){
	if(!data_curtask.isEmpty()){
		$('#chulicase', window.parent.document).html("");
		$(".controlInfo").html("");
		var caseTypeName = "";
		var caseType = data_curtask.get("caseType");
		var userNum = data_curtask.get("userNum");
		var userName = data_curtask.get("userName");
		var caseNo = data_curtask.get("caseNo");
		var licenseNo = data_curtask.get("licenseNo");
		var phoneNo = data_curtask.get("phoneNo");
		var time = data_curtask.get("time");
		data_curtask = new Map();
		if(caseType=='1'){
			caseTypeName = "客户";
		} else if(caseType=='2'){
			caseTypeName = "查勘员";
		} else if(caseType=='3'){
			caseTypeName = "修理厂";
		}
		//添加信息到当前任务中
		var dlBuffer = new StringBuffer();
		dlBuffer.append("<div class=\"twoBtu\"><a href=\"javascript:;\" onclick=\"show(this)\" >"+caseTypeName+":"+userNum+"</a><input type=\"button\" value=\"结束\" onclick=\"endVideo(this,'"+userName+"','"+userNum+"','"+caseNo+"','"+licenseNo+"','"+caseType+"')\"><input type=\"button\" value=\"重派\" class=\"marR0\" onclick=\"cancelCase(this,'"+caseNo+"','"+userNum+"')\" />");
		dlBuffer.append("<dl class=\"dl_con\" style=\"display:none;\" >");
		dlBuffer.append("<dt>案件号：</dt><dd>"+caseNo+"<input type='hidden' name='caseNo' value='"+caseNo+"' /><input type='hidden' name='caseType' value='"+caseType+"' /><input type='hidden' name='mobileNo' value='"+userNum+"' /></dd>");
		dlBuffer.append("<dt>车牌号：</dt><dd>"+licenseNo+"</dd>");
		if(caseType=='1'){
			dlBuffer.append("<dt>案件类型：</dt><dd>自助案件</dd>");
			dlBuffer.append("<dt>客户：</dt><dd style='cursor:pointer;color:#196ec8' ondblclick=\"callUser('"+userNum+"','"+caseNo+"')\">"+userNum+"</dd>");
		} else if(caseType=='2'){
			dlBuffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
			dlBuffer.append("<dt>查勘员：</dt><dd>"+userName+"</dd>");
			dlBuffer.append("<dt>设备名：</dt><dd style='cursor:pointer;color:#196ec8' ondblclick=\"callUser('"+phoneNo+"','"+caseNo+"')\">"+userNum+"</dd>");
		} else if(caseType=='3'){
			dlBuffer.append("<dt>案件类型：</dt><dd>查勘案件</dd>");
			dlBuffer.append("<dt>修理厂：</dt><dd style='cursor:pointer;color:#196ec8' ondblclick=\"callUser('"+phoneNo+"','"+caseNo+"')\">"+userNum+"</dd>");
		}
		callout_phoneNo=userNum;
		callout_caseNo=caseNo;
		
		dlBuffer.append("<dt>接受时间：</dt><dd>"+time+"</dd>");
		dlBuffer.append("</dl>");
		dlBuffer.append("</div>");
		$('#chulicase', window.parent.document).append(dlBuffer.toString());
		$(".controlInfo").html("<div align='center' style='color:#0000CC'>您当前有任务正在处理，见左下角！</div>");
		parent.parent.topFrame.seatStatus = 3;//有 任务，繁忙状态
		receive_caseNo = caseNo;
		
		m_haveTask = false;
		m_iTaskId = 1;
		
		//刷新图片
		refreshImg();
		
		$("#StatusButton0").attr("disabled",false);
		$("#StatusButton2").attr("disabled",false);
		
	}
}
//开始录制视频
function beginRecord(filename){
	//获取呼叫类型 呼入 呼出
	var callType = parent.parent.topFrame.document.getElementById("callType").value;
	if(callType != 'callin'){//主动呼出
		if(curCaseNo!=null && curCaseNo!=""){
			if(phoneNo != callOutNo){
				return;
			}
		} else {
			return;
		}
	}
	if(curCaseNo!=null && curCaseNo!=""){
		var recordInfo = AINF.GetRecordRelatedInfo();//获取录像相关信息 格式：成功的返回结果格式：录音记录标识|呼叫流水号|呼叫ID
		//displayInfo("获取正在进行录音的相关信息="+recordInfo);
		var flowNo = "";//呼叫流水号
		if(recordInfo != ""){
			flowNo = recordInfo.split("|")[1];
			$.ajax({
				type : "POST",
				url  :	contextRootPath + "/dispatch/dispatch_getRecordStartInfo",
				data : {
					caseNo : curCaseNo,
					flowNo : flowNo,
					filename : filename,
					mobile : phoneNo
				},
				async : false,
				success : function(data){
				}
			});
		}
	}
}

//录音过程中出现失败
function recordFailure(){
	//获取呼叫类型 呼入 呼出
	var callType = parent.parent.topFrame.document.getElementById("callType").value;
	if(callType != 'callin'){//主动呼出
		if(curCaseNo!=null && curCaseNo!=""){
			if(phoneNo != callOutNo){
				return;
			}
		} else {
			return;
		}
	}
	if(curCaseNo!=null && curCaseNo!=""){
			$.ajax({
				type : "POST",
				url  :	contextRootPath + "/dispatch/dispatch_getRecordFailure",
				data : {
					caseNo : curCaseNo,
					mobile : phoneNo
				},
				async : false,
				success : function(data){
				}
			});
	}
}

//停止录制视频
function endRecord(filename){
	//获取呼叫类型 呼入 呼出
	var callType = parent.parent.topFrame.document.getElementById("callType").value;
	if(callType != 'callin'){//主动呼出
		if(curCaseNo!=null && curCaseNo!=""){
			if(phoneNo != callOutNo){
				return;
			}
		} else {
			return;
		}
	}
	if(curCaseNo!=null && curCaseNo!=""){
		var recordInfo = AINF.GetRecordRelatedInfo();//获取录像相关信息
		if(recordInfo!=null && recordInfo != ""){
			//displayInfo("获取正在进行录音的相关信息="+recordInfo);
			var flowNo = recordInfo.split("|")[1];
			$.ajax({
				type : "POST",
				url  :	contextRootPath + "/dispatch/dispatch_getRecordEndInfo",
				data : {
					flowNo : flowNo,
					filename : filename,
				},
				async : false,
				success : function(data){
				}
			});
		}
	}
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

function displayInfo(msg){
	$("#dd_content").append("<p>"+msg+"</p>");
}

