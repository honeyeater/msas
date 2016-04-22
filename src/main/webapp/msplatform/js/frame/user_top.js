
var callType;
//拍照文件名
var fileName;

var flag = false;

var tryNum = 0; //登录视频控件次数

var seatStatus = 0;//坐席的业务场景状态 1离开 2空闲 3繁忙

$(function(){
	var userType = $("#userType").val();
	var manage = $("#manage").val();
	//判断是否进入实时监控页面
	if(manage==2 && (userType=='1' || userType=='2')){
		try {
			if(AINF){
				$(".admin_topbg").css("display","none");//登录成功后再显示出来
				if(AINF.IsInitial == null){
					if(confirm("检测到您还未安装控件，是否安装？")){
						var url = contextRootPath + "/dispatch/dispatch_downFile";
						var form = $("<form>");// 定义一个form表单
						form.attr("style", "display:none");
						form.attr("method", "post");
						form.attr("target", "_self");
						form.attr("action", url);
						$("body").append(form);// 将表单放置在web中
						var input1 = $("<input>");
						input1.attr("type", "hidden");
						input1.attr("name", "fileName");
						input1.attr("value", "AInfSetup");
						form.append(input1);
						form.submit();// 表单提交
					} else {
						logoutAfterError();
					}
				} else {
					if(userType=='2'){ 
						userOnliRefresh();
					}
					//注册接口事件
					registerAINFEvents();
					//用户登录
					videoUserLogin();
				}
			}
		} catch (e){
			if(e=='-10230'){
				alert("[ERROR:-10230]该工号已登录！");
			} else {
				alert("视频控件加载失败，请重新登录！");
			}
			logoutAfterError();
		}
	}else if(manage==2 && userType=='3'){
		 parent.main1.src = contextRootPath + "/msplatform/pages/caseInfo/caseResultFrame.jsp";
	     parent.main1.window.location.href = contextRootPath + "/msplatform/pages/caseInfo/caseResultFrame.jsp";
	     //理算员登录，在online中记录数据，1min定时刷新
	     userOnliRefresh(); 
	}
});

function userOnliRefresh(){
	$.ajax({
		type : "POST",
		url :	contextRootPath + "/user/user_setToOnline",
		async : true,
		success : function(data){
		}
	});
	setTimeout("userOnliRefresh()", 60000);//1分钟刷新一次
}

function logoutAfterError() {
	top.location.href = contextRootPath+"/login_plat/login_logoff";
}

/**客户端显示监控数据,5s定时刷新*/
function showMonitorData(){
	$.ajax({
		type : "POST",
		url :	contextRootPath + "/user/user_queryMonitorData",
		async : true,
		success : function(videoNum){
			videoNum = $.parseJSON(videoNum);
			if(videoNum!=null && videoNum != ''){
				//根据状态，重新给页面赋值
				$("#surveyCaseNum").html(videoNum.surveyCaseNum);
				$("#selfCaseNum").html(videoNum.selfCaseNum);
				$("#onlineNum").html(videoNum.onlineNum);
				$("#freeNum").html(videoNum.freeNum);
				$("#busyNum").html(videoNum.busyNum);
				var caseNum =  Number(videoNum.surveyCaseNum)+Number(videoNum.selfCaseNum);
				var freeNum = Number(videoNum.freeNum);
				showImgCaseNum(freeNum);
				if(caseNum>freeNum){
					$("#caseNumMsg").attr("style","display:inline;");
				}else {
					$("#caseNumMsg").attr("style","display:none;");
				}
			}
		}
	});
	setTimeout("showMonitorData()", 5000);//5秒请求一次
}

function showImgCaseNum(freeNum){
	$.ajax({
		type : "POST",
		url :	contextRootPath + "/user/user_queryImgCaseNum",
		async : true,
		success : function(data){
			data = $.parseJSON(data);
			$("#selfImgCaseNum").html(data.selfImgCaseNum);
			$("#surveyImgCaseNum").html(data.surveyImgCaseNum);
			var imgCaseNum = Number(data.selfImgCaseNum)+Number(data.surveyImgCaseNum);
			if(!isNaN(imgCaseNum)&&(imgCaseNum>0)){
				$("#imgCaseNumMsg").attr("style","display:inline;");
			}else {
				$("#imgCaseNumMsg").attr("style","display:none;");
			}
		}
	});
}

/**点击按钮触发样式*/
var add_effect = function(t) {
	var beforeName = $(t).parent().find(".active").html();//获取点击前的选项
	var agentID = $("#operatorId").val();
	var userType = $("#userType").val();
	var manage = $("#manage").val();
	if(manage==2 && (userType=='1' || userType=='2')){
		if( $(t).html()!='实时监控' && beforeName == '实时监控'){
			if(parent.main1.handle){
				if(typeof(parent.main1.handle.isHaveTask)=='function'){
					if(isHaveTask()){
						return false; 
					}
				}	
			}	
			AINF.SetRest(agentID);
		}else if ($(t).html()=='实时监控' && beforeName == '实时监控'){
			return false;
		}
	}

	//$("#menus a").attr("src", contextRootPath +"/msplatform/ui/image/titlelocalconfig.gif");
	//$(t).attr("src",  contextRootPath + "/msplatform/ui/image/titlepreviewsel.gif");
	$(t).css("color", "fff").addClass("active").siblings().css("color", "666").removeClass("active");
	return true;
}


function warn1(value){
	return confirm("确定要进入客户端链接吗?");
}

function warn2(value){
	var userType = $("#userType").val();
	if (1==userType) {
		if(parent.main1.handle){
			if(typeof(parent.main1.handle.isHaveTask)=='function'){
				if(isHaveTask()){
					flag = false;
				}else{
				    if(confirm("确定要进入管理中心链接吗?")){
				    	AINF.SignOut();
					    AINF.Uninitial();
					    flag = true;
					}else{
						flag = false;
					}
				}
			}
			return flag;
		}else{
			return confirm("确定要进入管理中心链接吗?");
		}
	}else{
		alert("您没有权限进入管理中心!");
		return false;
	}
}

function modifypassword(){
	var userType = $("#userType").val();
	var manage = $("#manage").val();
	if(parent.main1){
		if(parent.main1.handle){
			if(typeof(parent.main1.handle.isHaveTask)=='function'){
				if(isHaveTask()){
					flag=true;
				}
			}
		}
	}
	
	if(flag==false){
		var returnValue = window.showModalDialog( contextRootPath + '/msplatform/pages/user/password_modify.jsp',window,'dialogWidth:300px;dialogHeight:240px;scroll:no;status:no;center:yes');
		if(returnValue==1){
			if(manage==2 && (userType=='1' || userType=='2')){
				AINF.SignOut();
			    AINF.Uninitial();
			}
			top.location.href = contextRootPath+"/login_plat/login_logoff";
		}
	}
}

function localconfig(t){
	window.showModalDialog( contextRootPath + "/msplatform/pages/user/localconfig.jsp",window,'dialogWidth:420px;dialogHeight:210px;scroll:no;status:no;center:yes');
	add_effect(t);
}

//退出系统时,坐席迁出、反初始化
function logout(value){
	var userType = $("#userType").val();
	var manage = $("#manage").val();
	if(parent.main1){
		if(parent.main1.handle){
			if(typeof(parent.main1.handle.isHaveTask)=='function'){
				if(isHaveTask()){
					flag=true;
					return false;
				}
			}
		}
	}
	if(confirm("确定要退出系统吗?")){
		if(manage==2 && (userType=='1' || userType=='2')){
			AINF.SignOut();
		    AINF.Uninitial();
		}
		return true;
	}else{
		return false;
	}
}

/**
 * 检测坐席异常状态
 * 出现异常情况时，可重新调整坐席状态
 */
var oldState = -1;
function monitorSeatState(){
	var state = $("#state").val();
	if(state == 100 || state == 107){
		if(oldState == state){
			try {
				if((parent.main1.handle !=null) && typeof(parent.main1.handle.resetSetStatus) == 'function'){
					parent.main1.handle.resetSetStatus(seatStatus);
				}
			} catch (e){}
			setTimeout("monitorSeatState()", 5000);
		} else {
			oldState = state;
			setTimeout("monitorSeatState()", 10000);//10秒后再检测一次
		}
	} else if(state == 3){//坐席被自动签出
		reLogin();
		setTimeout("monitorSeatState()", 5000);//每5秒后检测一次
	} else {
		setTimeout("monitorSeatState()", 5000);//每5秒后检测一次
	}
}

/**
 * 坐席重新登录
 */
function reLogin(){
	var videoUrl = $("#videoUrl").val();
	var vcid = $("#vcid").val();
	var operatorId = $("#operatorId").val();
	var password = $("#password").val();
	// 先反初始化以防止存A接口在未断开的连接
	//接口文档中说明 反初始化方法只能在“已初始化”且“未登录”的情况下使用 因此需判断这两种状态
	if(AINF.IsInitial){//已初始化
		if(AINF.IsSignIn){//已登录
			if (AINF.SignOut() != 0){//先登出
				return; 
			}
			if (AINF.Uninitial() != 0){//反初始化
				return; 
			}
		} else {//未登录
			if (AINF.Uninitial() != 0){
				return; 
			}
		}
	} else {
		if (AINF.Uninitial() != 0){
			return; 
		}
	}
	 // 加载平台配置信息
	 if(AINF.LoadConfig(videoUrl, vcid, operatorId, hex_md5(password)
	            .toUpperCase(), "urlparam=phonetype=0") == -1)
	 {
		 return;
	 }
	 // 设置收到振铃事件时，需座席主动应答
	 AINF.AutoAnswer = 0; 
	 // 本地录音
	 AINF.RecordMode = 0;
	 // 全程录音
	 AINF.FullRecord = 1;	
	 // 设置使用视频属性
	 AINF.UseVideo = 1;
	 AINF.InitialReady=0;
	 // 初始化A接口控件
	 if (AINF.Initial() != 0)
	 {
		 return;
	 }
	 //	设置视频分辨率 0:DEFAULT  1:QCIF  2:CIF  3:SQCIF 4:CIF4  5:720P
	 AINF.SetAinfProperty("videopixel","2","");	
	 // A接口和平台发生网络了中断，网络恢复后，A接口是否进行自动登录
	 AINF.SetAinfProperty("autoResignIn",1,"");
	 //设置自动上传录像文件
	 AINF.SetAinfProperty("autoUploadRec",1,"");
	 //A接口自动刷新录音路径到日志服务器，并通知录音结束时间
	 AINF.SetAinfProperty("updateRecord","1","");
	 // 登录，根据SignIn的返回值判断登录是否成功
	 if (AINF.SignIn() != 0)
	 {
	 }
}

/**	用户登录实时监控页面*/
function videoUserLogin() {
	tryNum = tryNum + 1;
	if(tryNum > 3){//表明已尝试登录3次未成功，提示用户登录失败，重新登录
		var errorMsg = getErrorMsg();
		alert(errorMsg+"\n视频控件加载失败，请重新登录！");
		logoutAfterError();
		return;
	}
	var videoUrl = $("#videoUrl").val();
	var vcid = $("#vcid").val();
	var operatorId = $("#operatorId").val();
	var password = $("#password").val();
	// 先反初始化以防止存A接口在未断开的连接
	//接口文档中说明 反初始化方法只能在“已初始化”且“未登录”的情况下使用 因此需判断这两种状态
	if(AINF.IsInitial){//已初始化
		if(AINF.IsSignIn){//已登录
			if (AINF.SignOut() != 0){//先登出
				setTimeout("videoUserLogin()", 3000);//3秒后尝试重新登录
				return; 
			}
			if (AINF.Uninitial() != 0){//反初始化
				setTimeout("videoUserLogin()", 3000);
				return; 
			}
		} else {//未登录
			if (AINF.Uninitial() != 0){
				setTimeout("videoUserLogin()", 3000);
				return; 
			}
		}
	} else {
		if (AINF.Uninitial() != 0){
			setTimeout("videoUserLogin()", 3000);
			return; 
		}
	}
	 
	 
	 // 加载平台配置信息
	 if(AINF.LoadConfig(videoUrl, vcid, operatorId, hex_md5(password)
	            .toUpperCase(), "urlparam=phonetype=0") == -1)
	 {
		 setTimeout("videoUserLogin()", 3000);
		 return;
	 }
	 
	 // 设置收到振铃事件时，需座席主动应答
	 AINF.AutoAnswer = 0; 

	 // 本地录音
	 AINF.RecordMode = 0;

	 // 全程录音
	 AINF.FullRecord = 1;	

	 // 设置使用视频属性
	 AINF.UseVideo = 1;
	 
	 AINF.InitialReady=0;

	 // 初始化A接口控件
	 if (AINF.Initial() != 0)
	 {
		 setTimeout("videoUserLogin()", 3000);
		 return;
	 }
	 
	 //	设置视频分辨率 0:DEFAULT  1:QCIF  2:CIF  3:SQCIF 4:CIF4  5:720P
	 AINF.SetAinfProperty("videopixel","2","");	
	 
	 // A接口和平台发生网络了中断，网络恢复后，A接口是否进行自动登录
	 AINF.SetAinfProperty("autoResignIn",1,"");
	 
	 //设置自动上传录像文件
	 AINF.SetAinfProperty("autoUploadRec",1,"");

	 //A接口自动刷新录音路径到日志服务器，并通知录音结束时间
	 AINF.SetAinfProperty("updateRecord","1","");

	//A接口设置自动应答模式-手工应答
	 AINF.SetAinfProperty("manualAnswerMode",1,"");
	 
	 // 登录，根据SignIn的返回值判断登录是否成功
	 if (AINF.SignIn() != 0)
	 {
		 //获取错误代码
		 var errorCode = AINF.GetLastErrorCode();
		 if(errorCode=='-10230'){//工号被占用
			 throw errorCode;
		 } else {
			 setTimeout("videoUserLogin()", 3000);
		 }
		 return;
	 }
	 //显示页面
	 $(".admin_topbg").css("display","");
	 //显示监控数据
	 showMonitorData();
	 setTimeout("monitorSeatState()", 5000);
	 //加载其他页面
	 parent.main1.src = contextRootPath + "/msplatform/pages/video/videoFrame.jsp";
     parent.main1.window.location.href = contextRootPath + "/msplatform/pages/video/videoFrame.jsp";
}

//注册A接口事件
function registerAINFEvents()
{
	var buffer = new Array();

    buffer.push("function AINF::OnCTIAgentStateChanged(state, lastState, cause, param)");
    buffer.push("{");
    buffer.push("   OnCTIAgentStateChanged(state, lastState, cause, param);");
    buffer.push("};");
    
    buffer.push("function AINF::OnSetIdleFailure()");
    buffer.push("{");
    buffer.push("   OnSetIdleFailure();");
    buffer.push("};");
    
    buffer.push("function AINF::OnSetBusyFailure()");
    buffer.push("{");
    buffer.push("   OnSetBusyFailure();");
    buffer.push("};");
    
    buffer.push("function AINF::OnCallOutsideFailure()");
    buffer.push("{");
    buffer.push("   OnCallOutsideFailure();");
    buffer.push("};");
    
    buffer.push("function AINF::OnCallOutsideSuccess()");
    buffer.push("{");
    buffer.push("   OnCallOutsideSuccess();");
    buffer.push("};");
    
    buffer.push("function AINF::OnCallOutsideSuccTalk()");
    buffer.push("{");
    buffer.push("   OnCallOutsideSuccTalk();");
    buffer.push("};");
	
	buffer.push("function AINF::OnReleaseSuccess(mediatype, callid)");
    buffer.push("{");
    buffer.push("   OnReleaseSuccess();");
    buffer.push("};");
	
	buffer.push("function AINF::OnReleaseFailure(mediatype, callid)");
    buffer.push("{");
    buffer.push("   OnReleaseFailure();");
    buffer.push("};");
	
	buffer.push("function AINF::OnSingleStepTransSuccess()");
    buffer.push("{");
    buffer.push("   OnSingleStepTransSuccess();");
    buffer.push("};");
    
    buffer.push("function AINF::OnSingleStepTransFailure()");
    buffer.push("{");
    buffer.push("   OnSingleStepTransFailure();");
    buffer.push("};");
	
	// 拍照成功事件
	buffer.push("function AINF::OnSipUsrMsg(msg,extInfo)");
    buffer.push("{");
    buffer.push("   OnSipUsrMsg(msg,extInfo);");
    buffer.push("};");
	
	// 业务发送ticket预占操作后，座席会收到该事件。
//	buffer.push("function AINF::OnTicketLock(msg,extInfo)");
//    buffer.push("{");
//    buffer.push("   OnTicketLock(msg,extInfo);");
//    buffer.push("};");
	 
   // 录音成功开始事件。
	buffer.push("function AINF::OnBeginRecordSuccess (filename,iLen)");
    buffer.push("{");
    buffer.push("   OnBeginRecordSuccess(filename,iLen);");
    buffer.push("};");
    
    // 开始录像失败事件。
    buffer.push("function AINF::OnBeginRecordFailure()");
    buffer.push("{");
    buffer.push("   OnBeginRecordFailure();");
    buffer.push("};");
    
    // 录音过程中出现失败。
    buffer.push("function AINF::OnRecordFailure (errtype,param)");
    buffer.push("{");
    buffer.push("   OnRecordFailure (errtype,param);");
    buffer.push("};");
    
    //应答事件
    buffer.push("function AINF::OnAnswerRequest(mediatype, callid)");
    buffer.push("{");
    buffer.push("   OnAnswerRequest(mediatype, callid);");
    buffer.push("};");
    
    //应答事件
    buffer.push("function AINF::OnAnswerSuccess(mediatype)");
    buffer.push("{");
    buffer.push("   OnAnswerSuccess(mediatype);");
    buffer.push("};");
    
    //应答事件
    buffer.push("function AINF::OnAnswerFailure(mediatype)");
    buffer.push("{");
    buffer.push("   OnAnswerFailure(mediatype);");
    buffer.push("};");

    //录音停止事件
    buffer.push("function AINF::OnRecordEvent(filename,iLen)");
    buffer.push("{");
    buffer.push("   OnRecordEvent(filename,iLen);");
    buffer.push("};");
    
    //客户端异常退出，坐席端5秒内未收到语音流触发该时间
    buffer.push("function AINF::OnNoRtpNotify(param)");
    buffer.push("{");
    buffer.push("   OnNoRtpNotify(param);");
    buffer.push("};");
    
	eval(buffer.join(""));
}

function OnAnswerRequest(mediatype, callid){
	var callData = AINF.QueryCallData(6);//获取随路数据 格式：VCID^技能号^案件号^业务类型^工号
	//addMessages("获取随路数据：" + callData + "");
	//addMessages("触发OnAnswerRequest事件：");
	var caseNo = "";
	var phoneNo = "";
	if(callData != ""){
		caseNo = callData.split("^")[2];
		phoneNo = callData.split("^")[4];
		if(caseNo==null || caseNo=="" || phoneNo==null || phoneNo==""){
			AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
			return;
		}
	} else {
		AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
		return;
	}
	//判断当前坐席是否有任务，
	//若有判断任务是否是客户自助案件，若是且是预占案件的视频请求则直接接通，若是但非预占案件的视频请求则拒绝本次调度任务
	//只所以增加该判断是防止任务接受后，但置坐席为空闲失败，导致该坐席还能接收到任务
	if((parent.main1.handle !=null) && typeof(parent.main1.handle.isHaveTask) == 'function'){
		if(parent.main1.handle.isHaveTask(false)){
			if(parent.main1.getCaseType()=='1'){//表明当前的案件是客户自助案件
				if(parent.main1.getCaseNo()==caseNo){
					if(AINF.Answer(6) != 0){//直接接受请求
		    			//TODO 是否需要调用挂机接口
		    		}
					return;
				}
			} else {//非自助案件，直接拒绝
				//seatStatus = 3;
				//AINF.ReleaseCall(6);//释放掉当前连接到座席的指定类型呼叫。
				return;
			}
		}
	}
	if((parent.main1.handle !=null) && typeof(parent.main1.handle.dispatchCaseInfo) == 'function'){
		parent.main1.handle.dispatchCaseInfo(caseNo, 1, null, phoneNo);
	}
}

//收到ticket预占事件
function OnTicketLock(msg,extInfo){
	//addMessages("收到OnTicketLock预占事件,msg：" + msg + ",extInfo:"+extInfo);
	var index = msg.indexOf("Ticket=");
	if(index  < 0){
		index = msg.indexOf("ticket=");
	}
	if(index  < 0){
		index = msg.indexOf("TICKET=");
	}
	if(index  < 0){
		return;
	}
	var _mag = msg.substring(index);
	var ticketid = _mag.split(";")[0].split("=")[1];
	index = msg.indexOf("US=");
	if(index  < 0){
		index = msg.indexOf("us=");
	}
	if(index  < 0){
		return;
	}
	_mag = msg.substring(index);
	var caseNo = _mag.split(";")[0].split("=")[1];
	//addMessages("从OnTicketLock预占事件获取,ticketid：" + ticketid + ",caseNo:"+caseNo);
	//判断当前坐席是否有任务，若有则拒绝本次调度任务
	if((parent.main1.handle != null) && typeof(parent.main1.handle.isHaveTask) == 'function'){
		if(parent.main1.handle.isHaveTask(false)){
			AINF.TicketDeal(0,ticketid,"");//释放掉当前连接到座席的指定类型呼叫。
			AINF.AgentEnterWrapUp();
			return;
		}
	}
	if((parent.main1.handle !=null) && typeof(parent.main1.handle.dispatchCaseInfo) == 'function'){
		parent.main1.handle.dispatchCaseInfo(caseNo, 2, ticketid);
	}
}

/**
 * 状态改变事件
 * 
 * @param state
 *            当前状态
 * @param lastState
 *            上一状态
 * @param cause
 *            改变原因
 * @param param
 *            扩展参数
 */
function OnCTIAgentStateChanged(state, lastState, cause, param)
{
    $("#state").val(state);
    //addMessages("状态切换至[" + state + "]");
    // 呼入
	if(state == 300 || state == 301)
	{
	   callType = 'callin';
	   $("#callType").val("callin");
	
	}else if( state == 302 || state == 303){
	   callType = 'callout';
	   $("#callType").val("callout");
	}
	//登录时先置成繁忙
	if(state == 100)
	{
		//手动进入整理态401（业务上将该状态代表繁忙态）
    	if(AINF.AgentEnterWrapUp()==0){
    		$("#state").val(401);//由于OnCTIAgentStateChanged这个方法调用存在延时，成功之后马上就置状态
    	}
	}
    
    if(state == 400)
	{
    	parent.main1.handle.resetSetStatus(seatStatus);
	}
}

/**
 * 客户端通话过程中异常退出
 */
function OnNoRtpNotify(param){
//	if(AINF.ReleaseCall(6) != 0){
//    }
	alert("对方未打开麦克风或者是当前网络不好！");
}

/**
 * 示闲失败事件
 */
function OnSetIdleFailure()
{
    
}

/**
 * 示忙失败事件
 */
function OnSetBusyFailure()
{

}

/**
 * 外呼失败事件
 */
function OnCallOutsideFailure()
{
	//var errorMsg = getErrorMsg();
	//alert(errorMsg+"\n呼叫失败！");
}

/**
 * 外呼成功事件
 */
function OnCallOutsideSuccess()
{
    //addMessages("外呼成功");
}

/**
 * 外呼通话建立事件
 */
function OnCallOutsideSuccTalk()
{
    //addMessages("外呼通话建立");
	var callid = parent.main1.user_mobile;
	var caseNo = parent.main1.user_caseNo;	
	var msg1 = "camera:back"; 
	var msg2 = "appdata:"+caseNo;
	AINF.SndMsgToSipUsr(callid,msg1,"","");
	AINF.SndMsgToSipUsr(callid,msg2,"","");
}

/**
 * 挂机成功事件
 */
function OnReleaseSuccess(mediatype,callid){
  //addMessages("挂机成功");
}

/**
 * 挂机失败事件
 */
function OnReleaseFailure(mediatype,callid){
  //addMessages("挂机失败");
}


/**
 * 单步转移成功事件
 */
function OnSingleStepTransSuccess(){
    //addMessages("单步转移成功");
}

/**
 * 单步转移失败事件
 */
function OnSingleStepTransFailure(){
    //addMessages("单步转移失败");
}

function OnAnswerSuccess(mediatype){
	
	//获取呼叫类型 呼入 呼出
	if(callType != 'callin'){//主动呼出
		return ;
	}else {
		//左下角显示当前案件信息(这个地方会有赋值案件号的，所以这段代码要在上面)
		parent.main1.handle.showCurtask();
	}
	var caseNo = parent.main1.handle.receive_caseNo;
	//修改案件状态为连接成功,调用理赔定损接口
	if(caseNo!=null && caseNo!=""){
		$.ajax({
			type : "POST",
			url  :	contextRootPath + "/dispatch/dispatch_chgCaseStatus",
			data : {
				caseNo : caseNo
			},
			async : false,
			success : function(data){
			}
		});
	}
	
	//addMessages("视频通话成功");
	var userPhone =  AINF.GetCallingNo();
	var msg1 = "camera:back"; 
	var msg2 = "appdata:"+caseNo; 
	AINF.SndMsgToSipUsr(userPhone,msg1,"","");
	AINF.SndMsgToSipUsr(userPhone,msg2,"","");
	

}

function OnAnswerFailure(mediatype){
	/*if(AINF.ReleaseCall(6) != 0){
		//失败不做处理
	}else{
		//调用示闲
		AINF.SetIdle();
	}*/
	//addMessages("*******视频通话失败*******");
}

/**
 * 坐席接受调度请求
 */
/*function acceptRequest(){
	if (AINF.Answer(6) != 0)
  {
      return;
  }
  //addMessages("确认应答成功");
}*/

//收到拍照成功上传图片事件
function OnSipUsrMsg(msg,extInfo){
	// VCID=2;AGTID=102;INFOMSG=screenshot:success,http://10.116.40.251:8081/receivefile/doFileReceive/20151010170708.jpg
  //addMessages("调用OnSipUsrMsg"+msg);
  var arr0 = msg.split(";")[2].split("=")[1].split(",")[0];  
  var arrs = arr0.split(":");  
  if(arrs[0] == "screenshot"){
	  //addMessages("拍照上传成功，调用OnSipUsrMsg"+arrs[1]);
      if(arrs[1] == "fail"){
	      alert("拍照上传图片失败");	
	  }else{
		  if((parent.main1.handle !=null) && typeof(parent.main1.handle.onShotSuccess) == 'function'){
			  parent.main1.handle.onShotSuccess(msg.split(";")[2].split("=")[1].split(",")[1]);
		  }
	  }
  } 
}

//收到录音成功事件
function OnBeginRecordSuccess(filename,iLen){
	//addMessages("录音开始:filename="+filename);
	parent.main1.handle.beginRecord(filename);
}

//收到录音失败事件
function OnBeginRecordFailure(){
	//addMessages("录音开始:filename="+filename);
	parent.main1.handle.recordFailure();
}

//录音过程中出现失败
function OnRecordFailure(errtype,param){
	parent.main1.handle.recordFailure();
}

// 收到录音停止事件
function OnRecordEvent(filename,iLen){
	//addMessages("录音结束:filename="+filename);
	parent.main1.handle.endRecord(filename);
}

function getErrorMsg(){
	var errorCode = AINF.GetLastErrorCode();
    var errorMsg = AINF.GetPromptByErrorCode(errorCode);
    return "["+errorCode+":"+errorMsg+"]";
}

/********************************/

/**
 * 添加消息内容
 * 
 * @param msg
 *            消息内容
 */
function addMessages(msg)
{
    var newmsg = new Date().toLocaleString() + " " + msg;
    if((parent.main1.handle !=null) && typeof(parent.main1.handle.displayInfo) == 'function'){
    	parent.main1.handle.displayInfo(newmsg);
    }
}



// 变焦
function clickZoomn(){

  var userPhone;
  if(callType == 'callin'){
     userPhone =  AINF.GetCallingNo();	
  }else{ 
     userPhone =  $.trim($("#callee").val());
  } 
  
  var msg = "zoom:" + $.trim($("#zoomNum").val());  
  AINF.SndMsgToSipUsr(userPhone,msg,"","");
    
}

// 调整摄像头
function clickCamera(){

  var userPhone;
  if(callType == 'callin'){
     userPhone =  AINF.GetCallingNo();	
  }else{ 
     userPhone =  $.trim($("#callee").val());
  }
  
  var msg = "camera:" +  getRadioVal('visit');   
  AINF.SndMsgToSipUsr(userPhone,msg,"","");    
}

//根据video_handle.js反馈是否有任务
function isHaveTask(){
	var taskFlag = false;//没有任务
	if(parent.main1.handle.isHaveTask()){
		taskFlag = true;
	}
	return taskFlag;
}