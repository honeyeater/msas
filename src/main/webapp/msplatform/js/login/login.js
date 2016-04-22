/**
 * login页面初始化方法
 */
function initForm() {
    self.moveTo(0, 0); // 使其IE窗口最大化
    self.resizeTo(screen.availWidth, screen.availHeight);
    //从cookie中读取上次用户名、密码并显示
    readCookie();
}

function readCookie() {
    var name = $.cookie("LastUser");
    var password = $.cookie(name);
    if(typeof(name)!='undefined' && name != '' && null != name ){
    	$("#username").attr("value", name);
    	$(".placeholder input").blur();
    }
    if(typeof(password)!='undefined' && password != '' && null != password ){
    	$("#password").attr("value", password);
    	$(".placeholder input").blur();
    }
}

function OnBtnSave() {
	//密码显示隐藏
	hidePass();
	
    if (false == checkLogin()) {
    	writeCookie();
        return;
    } else {
        writeCookie();
        var pass = loginForm.password.value;
        loginForm.password.value =  hex_md5(pass) ;
        loginForm.action = contextRootPath + "/login_plat/login_submit?method=login&nocache=" + new Date().getTime();
    }
}

/**
 * 密码显示隐藏
 */
function hidePass(){
	var pass = loginForm.password.value;
	var target = document.getElementById("password_li");
	document.getElementById("password").style.display="none";;
	var newNode = document.createElement("input");
	var oldNode = document.getElementById("font_li");
	newNode.value = pass;
	newNode.type = "password";
	target.insertBefore(newNode, oldNode);
}

/**
 * 把用户名和密码写到cookie中
 */
function writeCookie() {
    $.cookie("LastUser", loginForm.username.value);
    $.cookie(loginForm.username.value, loginForm.password.value);
}

/**
 * 获取字符串长度，识别汉字是2个字符
 * @param str
 * @returns {Number}
 */
function getTextLength(str) {
    var iLength = 0;
    for (var i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) > 255) {
            iLength += 2;
        } else {
            iLength += 1;
        }
    }
    return iLength;
}

//改变验证码方法
function changeimg() {
    document.getElementById("code").setAttribute("src", contextRootPath + "/login_plat/login_creatCode?method=creatCode&a=" + new Date().getTime());
}

function checkLogin() {
    // 用户名为空时提示
    if (loginForm.username.value.length == 0) {
        alert("请输入用户名！");
        loginForm.username.focus();
        return false;
    }
   
    if (getTextLength(loginForm.username.value) > 32) {
        alert("用户名长度不能大于32个字符！");
        loginForm.username.focus();
        return false;
    }
    username = loginForm.username.value;
    if (username.search(/#/g) != -1 || username.search(/&/g) != -1 || username.search(/'/g) != -1 || username.search(/"/g) != -1 || username.search(/%/g) != -1 || username.search(/</g) != -1 || username.search(/>/g) != -1 || username.search(/\\/g) != -1 || username.search(/\//g) != -1 || username.search(/\s/g) != -1 || username.search(/\:/g) != -1 || username.search(/\*/g) != -1 || username.indexOf('?') != -1 || username.indexOf('|') != -1 || username.indexOf('‘') != -1 || username.indexOf('’') != -1 || username.indexOf('“') != -1 || username.indexOf('”') != -1 || username.indexOf('：') != -1 || username.indexOf('？') != -1) {
        alert("用户名不能包含" + "#、&、/、\\、%、<、>、\'、\‘、\"、\:、\*、\?、\|、空格" + "等字符！");
        loginForm.username.focus();
        return false;
    }
    if (loginForm.password.value.length == 0) {
        alert("请输入密码！");
        loginForm.password.focus();
        return false;
    }
    if (getTextLength(loginForm.password.value) > 16) {
        alert("密码长度不能大于16个字符！");
        loginForm.password.focus();
        return false;
    }
    if (loginForm.password.value.search(/#/g) != -1 || loginForm.password.value.search(/&/g) != -1 || loginForm.password.value.search(/'/g) != -1 || loginForm.password.value.search(/"/g) != -1 || loginForm.password.value.search(/%/g) != -1 || loginForm.password.value.search(/</g) != -1 || loginForm.password.value.search(/>/g) != -1 || loginForm.password.value.search(/\\/g) != -1 || loginForm.password.value.search(/\//g) != -1 || loginForm.password.value.search(/\s/g) != -1 || loginForm.password.value.search(/\:/g) != -1 || loginForm.password.value.search(/\*/g) != -1 || loginForm.password.value.indexOf('?') != -1 || loginForm.password.value.indexOf('|') != -1 || loginForm.password.value.indexOf('‘') != -1 || loginForm.password.value.indexOf('’') != -1 || loginForm.password.value.indexOf('“') != -1 || loginForm.password.value.indexOf('：') != -1 || loginForm.password.value.indexOf('？') != -1) {
        alert("密码不能包含" + "#、&、/、\\、%、<、>、\'、\‘、\"、\:、\*、\?、\|、空格" + "等字符！");
        loginForm.password.focus();
        return false;
    }
    // 判断验证码是否为空
    var inputCode = "";
    /*var inputCode = document.getElementById("verifyCode").value;
    if (inputCode.length <= 0) {
        alert("请输入验证码！");
        return false;
    }*/
    //服务端校验
    var a = 1;
    $.ajax({
		type : "post",
		url : contextRootPath + "/login_plat/login_check" ,
		async : false,
		data : {
			"userName" : username,
			"password" : hex_md5(loginForm.password.value),
			"verifyCode" : inputCode
		},
        success: function(data) {
            if (data != null) {
                var note = data.substr(0, 1);
                var ip = data.substr(1, data.length);
                if (note == "0" || note == "1") {
                    alert("用户名或密码不正确");
                    a = 10;
                }
                if (note == "8") {
                    alert("该用户已过期");
                    a = 8;
                }
                if (note == "6") {
                    alert("验证码不正确");
                    a = 6;
                }
                if (note == "4") {
                	alert("用户已登录");
                	a = 4;
                }
                if (note == "9") {
                    alert("密码已过6个月未修改，请进入平台之后，修改密码");
                    a = 9;
                }
            }

        }
    });
    if (a == 10 || a == 8 || a == 6 || a == 4) {
        return false;
    }
    return true;
}

/**错误信息显示*/
//function showErrorMsg(obj , errorMsg){
	//位置、msg
	
//}

function downloadAINF(){
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
}

/*
 * 检查控件是否已下载，自动提示下载控件
 */
function checkAINF(){
	if(AINF.AutoAnswer==undefined){  
	    //跳转到控件下载页面
	  	window.location(contextRootPath + "/msplatform/pages/login/downLoadAINF.jsp");
	}else{
		//控件已加载
	}
} 