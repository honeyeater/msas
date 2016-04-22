var checkMap = new Map();
var MAP_C0001 = "MAP_C0001";
var MAP_C0002 = "MAP_C0002";
var MAP_C0003 = "MAP_C0003";
var MAP_C0004 = "MAP_C0004";
var MAP_C0005 = "MAP_C0005";
var MAP_C0006 = "MAP_C0006";
var MAP_C0007 = "MAP_C0007";
var MAP_C0008 = "MAP_C0008";
var MAP_C0009 = "MAP_C0009";
var MAP_C0010 = "MAP_C0010";
var MAP_C0011 = "MAP_C0011";
var MAP_C0012 = "MAP_C0012";
var MAP_C0013 = "MAP_C0013";
var MAP_C0014 = "MAP_C0014";
var MAP_C0015 = "MAP_C0015";
var MAP_C0016 = "MAP_C0016";
var MAP_C0017 = "MAP_C0017";
var MAP_C0018 = "MAP_C0018";
checkMap.put("MAP_C0001", "不能为空！");   //校验录入的信息不能为空
checkMap.put("MAP_C0002", "只能输入中文，数字，字母或点！");   //校验录入的信息是合法中文信息
checkMap.put("MAP_C0003", "只能为字母，数字或下划线！");   //校验录入的信息是合法英文信息
checkMap.put("MAP_C0004", "格式有误！");   //校验录入的信息是合法手机号码
checkMap.put("MAP_C0005", "只能是1-10位的数字！");//校验录入的信息是数字 
checkMap.put("MAP_C0006", "格式有误！");//校验录入的信息是合法的日期信息
checkMap.put("MAP_C0007", "格式有误！");//校验录入的信息是合法的座机号码
checkMap.put("MAP_C0008", "格式有误！");//校验录入的信息是合法的分机号码
checkMap.put("MAP_C0009", "已存在！");//校验录入的系统登录名是否存在
checkMap.put("MAP_C0010", "已存在！");//检验版本号是否存在
checkMap.put("MAP_C0011", "格式有误！");//校验上传文件合法路径信息
checkMap.put("MAP_C0012", "不超过256个字符！");//校验备注不超过256个字符
checkMap.put("MAP_C0013", "格式有误！");//校验录入的信息是合法手机号码或合法的座机号码
checkMap.put("MAP_C0014", "两次密码不一致！");//校验录入的密码信息是否一致
checkMap.put("MAP_C0015", "！");//校验手机号是否已被使用
checkMap.put("MAP_C0016", "已存在！");//校验公司名是否已被使用
checkMap.put("MAP_C0017", "已存在！");//校验区域名是否已被使用
checkMap.put("MAP_C0018", "不超过40个字符！");//校验备注不超过40个字符

var MSGHEAD = "<font color='red'>";
var TIPHEAD = "<font color='blue'>";
var MSGTAIL = "</font>";
var OKMSG = "<img src = ' "+contextRootPath+"/msplatform/images/common/OK.PNG' style = 'width:16px;height:16px;margin-left:5px;margin-top:2px'/>";
	
/**录入信息不允许有空格*/
function CheckKeyDown(){
	if(event.keyCode == 32){
		event.returnValue = false;   
		return;
	}
}

/**
 * 此方法用来校验当前域
 * @param obj  当前对象
 * @returns {Boolean}
 */
function checkField(obj){
	//操作前先清除当前域的提示信息 开始
	var id = obj.id;
	var errorId = id+"Error";
	$("#" + errorId).html("");
	//操作前先清除当前域的提示信息 结束
	var arr_checkKey = $(obj).attr("checkKey").split(",");
	for(i =0 ; i < arr_checkKey.length; i++){
		if(MAP_C0001 == arr_checkKey[i]){
			if(!check_MAP_C0001(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0002 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0002(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0003 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0003(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0004 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0004(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0005 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0005(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0006 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0006(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0007 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0007(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0008 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0008(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0009 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0009(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0010 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0010(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0011 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0011(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0012 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0012(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0013 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0013(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0014 == arr_checkKey[i]){
			if(!check_MAP_C0014(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0015 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0015(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0016 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0016(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0017 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0017(obj, arr_checkKey[i])){
				return false;
			}
		}
		if(MAP_C0018 == arr_checkKey[i] && obj.value != ""){
			if(!check_MAP_C0018(obj, arr_checkKey[i])){
				return false;
			}
		}
	}
	if(obj.value != ""){
		//有值且正确才显示，避免非必录项的显示
		$("#" + errorId).html(OKMSG);
	}
	return true;
}

/**
 * 校验非空
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0001(obj, checkKey){
	var value = obj.value;
	if(value.length==0){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}
/**
 * 校验录入的中文信息
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0002(obj,checkKey){
	var re=/^[\u4e00-\u9fa5a-zA-Z0-9.][\u4e00-\u9fa5a-zA-Z.0-9]*$/;//只能输入中文，字母，数字，点
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}

/**
 * 校验录入的英文信息
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0003(obj,checkKey){
	var re=/^[A-Za-z0-9\_]*$/; //可以输入字母，数字，下划线 
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}

/**
 * 校验手机格式
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0004(obj,checkKey){
	var re=/^1[3578]\d{9}$/;
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}

/**
 * 校验1-10位的数字
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0005(obj,checkKey){
	var re=/^\d{1,10}$/;
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}

/**
 * 校验日期的格式
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0006(obj,checkKey){
	var re=/^(\d{4})-(\d{2})-(\d{2})$/;
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}

/**
 * 校验座机号码的格式
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0007(obj,checkKey){
	var re=/^([0-9]{3,4}-)?[0-9]{7,8}$/;
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}

/**
 * 校验分机号码的格式
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0008(obj,checkKey){
	var re=/^(((0\d{3}[\-])?\d{7}|(0\d{2}[\-])?\d{8}))([\-]\d{2,4})?$/;
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}
/**
 * 校验系统登录名是否已存在
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0009(obj,checkKey){
	var flag = true;//默认不存在
	var value = obj.value;
	var check_loginName = $("#check_loginName").val();
	$.ajax({
		type : "POST",
		url : contextRootPath + "/user/user_checkLoginName?loginName="+value+"&check_loginName="+check_loginName,
		async : false,
		success : function(data){
				if(data.indexOf("用户名不存在")>-1){
					flag = true;
				}else {
					setMsg(obj,checkKey);
					flag = false;
				}
			}
		});
	return flag;
}
/**
 * 检验版本号是否存在
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0010(obj,checkKey){
	var flag = true;//默认不存在
	var versionId = obj.value;
	var appType = $("input[name='appType']:checked").val();
	var systemCode = $("input[name='systemCode']:checked").val();
	$.ajax({
		type : "POST",
		url : contextRootPath + "/user/user_checkVersionId?versionId="+versionId+"&appType="+appType+"&systemCode="+systemCode,
		async : false,
		success : function(data){
			if(data.indexOf("版本号不存在")>-1){
				flag = true;
			}else {
				setMsg(obj,checkKey);
				flag = false;
			}
		}
	});
	return flag;
}
/**
 * 校验上传文件合法路径信息
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0011(obj,checkKey){
	var flag = true;//默认合法
	var filepath = obj.value.split(".");
	var filename = obj.value.split("\\");
	var length = filepath.length;
	var appType = $("input[name='appType']:checked").val(); 
	var filetype = filepath[length-1];
	if(1 == appType){
		//if ( 'ipa' != filetype && 'plist' != filetype)
		if ( 'ipa' != filetype )
		{
			setMsg(obj,checkKey);
			flag = false;
		}
	}else if(2 == appType){
		if ( 'apk' != filetype )
		{
			setMsg(obj,checkKey);
			flag = false;
		}
	}
	if(flag){
		$("#version_filename").val(filename[filename.length-1]);
	}
	return flag;
}
/**
 * 校验备注不超过256个字符
 * @param obj
 * @param checkKey
 */
function check_MAP_C0012(obj,checkKey){
	if(obj.value.length>256){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}
/**
 * 校验录入的信息是合法手机号码或合法的座机号码
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0013(obj,checkKey){
	var re1=/^([0-9]{3,4}-)?[0-9]{7,8}$/;
	var re2=/^1[3578]\d{9}$/;
	var value = obj.value;
	if(re1.test(value)== false && re2.test(value)== false ){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}
/**
 * 校验两次录入的密码是否一致
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0014(obj,checkKey){
	var value = obj.value;
	var psw1 = $("#password").val();
	if(value != psw1){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}
/**
 * 校验手机号是否已被使用
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0015(obj,checkKey){
	var useflag = true;//默认未被使用
	var checkType = $("#checkType").val();
	var flag = $("#flag").val();
	if(checkType==1 && flag==1){
		var check_mobile = obj.value;
		$.ajax({
			type : "POST",
			url : contextRootPath + "/user/user_checkMoibleuse?check_mobile="+check_mobile,
			async : false,
			success : function(data){
				
				if(data.indexOf("未使用")>-1){
					useflag = true;
				}else {
					var id = obj.id;
					var errorId = id+"Error";
					var msg = MSGHEAD + $(obj).attr("description")+ data + checkMap.get(checkKey)+ MSGTAIL;
					$("#" + errorId).html(msg);
					useflag = false;
				}
			}
		});
		return useflag;
	}else {
		return true;
	}
}
/**
 * 校验公司名称是否已被使用
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0016(obj,checkKey){
	var compNameflag = true;//默认未被使用
	var compName = obj.value;
	var addFlag = $("#addFlag").val();
	var compnuuid = $("#company_uuid").val();
	$.ajax({
		type : "POST",
		url : contextRootPath + "/company/company_checkCompName",
		async : false,
		data : {compnuuid:compnuuid,compName:compName,addFlag:addFlag},
		success : function(data){
			if(data.indexOf("未使用")>-1){
				compNameflag = true;
			}else {
				setMsg(obj,checkKey);
				compNameflag = false;
			}
		}
	});
	return compNameflag;
}
/**
 * 校验区域名称是否已被使用
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0017(obj,checkKey){
	var locNameflag = true;//默认未被使用
	var locName = obj.value;
	var flag = $("#flag").val();
	var locationUuid = $("#locationUuid").val();
	$.ajax({
		type : "POST",
		url : contextRootPath + "/location/location_checkLocName",
		async : false,
		data : {locationUuid:locationUuid,locName:locName,flag:flag},
		success : function(data){
			if(data.indexOf("未使用")>-1){
				locNameflag = true;
			}else {
				setMsg(obj,checkKey);
				locNameflag = false;
			}
		}
	});
	return locNameflag;
}
/**
 * 校验备注不超过40个字符
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_MAP_C0018(obj,checkKey){
	if(obj.value.length>40){
		setMsg(obj,checkKey);
		return false;
	}
	return true;
}

/**
 * 设置校验的错误信息
 * @param obj
 * @param checkKey
 */
function setMsg(obj,checkKey){
	var id = obj.id;
	var errorId = id+"Error";
	var msg = MSGHEAD + $(obj).attr("description") + checkMap.get(checkKey) + MSGTAIL;
	$("#" + errorId).html(msg);
}


/** 调用时间插件 */
function checkSelectValue() {
	WdatePicker({
		dateFmt : 'yyyy-MM-dd'
	});
}

/** 调用时间插件 */
function MorecheckSelectValue() {
	WdatePicker({
		dateFmt : 'yyyy-MM-dd HH:mm:ss'
	});
}

/**
 * 设置提示信息
 * @param obj
 * @param checkKey
 */
function setTip(obj,checkKey){
	var id = obj.id;
	var errorId = id+"Error";
	var msg = TIPHEAD + checkMap.get(checkKey) + MSGTAIL;
	$("#" + errorId).html(msg);
}

/** 隐藏提示 */
function clearMsg(obj){
	var id = obj.id;
	var errorId = id+"Error";
	$("#" + errorId).html("");
}

/**
 * 校验密码信息
 * @param obj
 * @param checkKey
 * @returns {Boolean}
 */
function check_psw(obj,checkKey){
	var re=/^[A-Za-z0-9\_]*$/; //可以输入字母，数字，下划线 
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	} else {
		clearMsg(obj);
	}
	return true;
}

function check_pswtwo(obj,checkKey){
	var re=/^[A-Za-z0-9\_]*$/; //可以输入字母，数字，下划线 
	var value = obj.value;
	if(re.test(value)== false){
		setMsg(obj,checkKey);
		return false;
	} else {
		//校验密码是否一致
		var psw1 = $("#password").val();
		if(psw1 != value){
			setMsg(obj,'MAP_C0014');
		} else {
			clearMsg(obj);
		}
	}
	return true;
}