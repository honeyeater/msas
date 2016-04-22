/** 新增查勘员信息 */
function addCheckUser() {
	var nodeId = $("#treeNodeId").val();
	var checkType = $("#checkType").val();
	var type = "";
	if(1==checkType){
		type = "查勘员";
	}else{
		type = "修理厂";
	}
	if("0001"==nodeId){
		alert("请在分公司或其区域下添加"+type+"！");
	}else{
		var oldAction = pageForm.action;
		pageForm.action = contextRootPath + "/checkUser/checkUser_beforeAdd";
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
		pageForm.action = oldAction;
	}
}

/**	选中所有checkBox*/
function selectCheckBoxs(){
	var checkall = document.getElementById("checkall");
	var length = document.all["check1"].length;
	if(checkall.checked){
		$("input[name='check1']").each(function(){
			$(this).prop("checked",true);
		});
	}else{
		$("input[name='check1']").prop("checked",false);
	}
	changeBtu_del();
}

/**改变勾选的checkbox*/
function changeCheckBoxs(obj){
	var flag=true;//默认全选
	if($(obj).prop("checked")==false){
		flag=false;
	}else {
		flag=true;
		$("input[name='check1']").each(function(){
			if($(this).prop("checked")!=true){
				flag=false;
			} 
		});
	}
	if(flag==true) {
		$("#checkall").prop("checked",true);
	}else {
		$("#checkall").prop("checked",false);
	}
	changeBtu_del();
}

/**改变删除按钮样式*/
function changeBtu_del(){
	if($("#checkall").checked==true){
		//删除可用
		$("#pageInfoButDel").removeClass();
	}else {
		//删除不可用
		$("#pageInfoButDel").removeClass();
		$("#pageInfoButDel").addClass("btu_del");
		$("input[name='check1']").each(function(){
			if(this.checked==true){
				//删除可用
				$("#pageInfoButDel").removeClass();
			}
		});
	}
}

/**	根据checkBox勾选项，删除信息*/
function deleteSelectCheckUser(){
	if(isFieldIdChecked("check1")==false){
		return false;
	}
	var arr=new Array();
	$("input[name='check1']").each(function(){
		if($(this).prop("checked")==true){
			arr.push($(this).attr("value"));
		} 
	});
	var idArrStr=arr.join(",");
	if (confirm("确定要删除吗？")) {
		var oldAction = pageForm.action;
		pageForm.action = contextRootPath + "/checkUser/checkUser_delete?idArrStr="+idArrStr;
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
		pageForm.action = oldAction;
	}
}

/** 获取需要修改的查勘员信息 */
function editCheckUser(uuid) {
	var treeNodeId = $("#treeNodeId").val(); 
	var treeNodeName = $("#treeNodeName").val(); 
	var checkType = $("#checkType").val(); 
	var treeFlag = $("#treeFlag").val(); 
	location.href = contextRootPath + "/checkUser/checkUser_edit?uuid=" + uuid+"&treeNodeId="+treeNodeId+"&treeNodeName="+treeNodeName+"&checkType="+checkType+"&treeFlag="+treeFlag;
}

/** 删除查勘员信息 */
function deleteCheckUser(uuid) {
	if (confirm("确定要删除吗？")) {
		var oldAction = pageForm.action;
		pageForm.action = contextRootPath + "/checkUser/checkUser_delete?uuid=" + uuid;
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
		pageForm.action = oldAction;
	}
}

/**
 * 查询查勘员信息 获取录入框值，做校验 模糊查询
 */
function query() {
	var checkType = $("#checkType").val();
	var query_userCode = $("#query_userCode").val();// 系统用户代码
	var query_userName = $("#query_userName").val();// 用户姓名
	var query_userMobile = $("#query_userMobile").val();// 手机号
	var regCode = /^[0-9]{0,10}$/;
	var regName = /^[\u4e00-\u9fa5]*$/;
	var regMobile = /^[0-9]{0,11}$/;
	if (!regCode.test(query_userCode)) {
		alert("系统用户代码只能输入1-10位 数字");
		$("#query_userCode").focus();
	} else if (!regName.test(query_userName)) {
		alert("用户姓名只能输入中文");
		$("#query_userName").focus();
	} else if (!regMobile.test(query_userMobile)) {
		alert("手机号码只能输入11位以内的数字");
		$("#query_userMobile").focus();
	} else {
		pageForm.action = contextRootPath + "/checkUser/checkUser_queryByTree";
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
		
	}

}