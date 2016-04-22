
$(document).ready(function(){
	changeForm();
});

/**表单显示变化*/
function changeForm(){
	$("#lisuan_NoID,#lisuan_NoPass").css("display","block");
	$("#videoPass").attr({"checkKey":"MAP_C0003"});
	//区分修改用户，增加用户
	var userFlag=$("#userFlag").val();
	if(userFlag=="0"){
		//区分用户类型
		var userType=$("#userType").val();
		if(userType==1){
			$("#num1,#num2,#num3").css("display","none"); 
		}else{
			if(userType==3){
				$("#lisuan_NoID,#lisuan_NoPass").css("display","none");
				$("#agtID,#videoPass").attr({"checkKey":""});
			}
			$("#num1,#num2,#num3").css("display","block");
		}
	}else {
		var userType=$("#userType").val();
		if(userType==1){
			$("#mobilePhone,#telePhone,#extensionnNum").attr({"disabled":true});
			$("#mobilePhone,#telePhone,#extensionnNum").val("不可用");
			$("#mobilePhone").attr({"checkKey":""});
			$("#telePhone").attr({"checkKey":""});
			$("#extensionnNum").attr({"checkKey":""});
		}else{
			if(userType==3){
				$("#lisuan_NoID,#lisuan_NoPass").css("display","none");
				$("#agtID,#videoPass").attr({"checkKey":""});
			}
			$("#mobilePhone,#telePhone,#extensionnNum").attr({"disabled":false});
			$("#mobilePhone,#telePhone,#extensionnNum").val("");
			$("#mobilePhone").attr({"checkKey":"MAP_C0004"});
		}
	}
	
}

/**保存用户信息*/
function sendUser(){
	 var successFlag = "1";  //默认成功 
	 $("input").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
			 //alert("不包含checkKey");
		 }else{
			 if(!checkField(this)){	
				 successFlag = "0";
				 //return false;
			 }
		 }
	 } );
	 $("select").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
			 //alert("不包含checkKey");
		 }else{
			 if(!checkField(this)){
				 successFlag = "0";
				 //return false;
			 }
		 }
	 } );
	 $("textarea").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
			 //alert("不包含checkKey");
		 }else{
			 if(!checkField(this)){
				 successFlag = "0";
				 //return false;
			 }
		 }
	 } );
	 //所有校验通过 提交表单
	 if(successFlag == 1){
		 userForm.submit();
	 }
}
/**保存上传安装包信息*/
function sendVersion(){	
	$("#filePath").val($("#Path").val());
	var successFlag = "1";  //默认成功 
	 $("input").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
		 }else{
			 if(!checkField(this)){	
				 successFlag = "0";
			 }
		 }
	 } );
	 $("select").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
		 }else{
			 if(!checkField(this)){
				 successFlag = "0";
			 }
		 }
	 } );
	 $("textarea").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
		 }else{
			 if(!checkField(this)){	
				 successFlag = "0";
			 }
		 }
	 } );
	 //所有校验通过 提交表单
	 if(successFlag == 1){
		 versionForm.submit();
		 startLoad();
	 }
}

function initForm(){
	alert("################");
	//实例化一个plupload上传对象
    var uploader = new plupload.Uploader({
        browse_button : 'browse', //触发文件选择对话框的按钮，为那个元素id
        url : '', //服务器端的上传页面地址
        flash_swf_url : 'js/Moxie.swf', //swf文件，当需要使用swf方式进行上传时需要配置该参数
        silverlight_xap_url : 'js/Moxie.xap' //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
    });    

    //在实例对象上调用init()方法进行初始化
    uploader.init();

    //绑定各种事件，并在事件监听函数中做你想做的事
    uploader.bind('FilesAdded',function(uploader,files){
        //每个事件监听函数都会传入一些很有用的参数，
        //我们可以利用这些参数提供的信息来做比如更新UI，提示上传进度等操作
    });
    uploader.bind('UploadProgress',function(uploader,file){
        //每个事件监听函数都会传入一些很有用的参数，
        //我们可以利用这些参数提供的信息来做比如更新UI，提示上传进度等操作
    });
    //......
    //......

    //最后给"开始上传"按钮注册事件
    document.getElementById('start_upload').onclick = function(){
        uploader.start(); //调用实例对象的start()方法开始上传文件，当然你也可以在其他地方调用该方法
    }
}

function startLoad(){
	document.body.innerHTML = '<table align="center" style="margin-top:150px;" width="100%" height="100%"><tr><td align="center" valign="middle">'+
							  '<img src="'+contextRootPath+'/msplatform/images/common/loading.gif"/>正在上传...'+
							  '</td></tr></table>';
}














