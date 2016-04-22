
/**添加用户信息*/
function addUser(){
	var nodeId = $("#treeNodeId").val();
	if("0001"==nodeId){
		alert("请在分公司或其区域下添加用户！");
	}else{
		var oldAction = pageForm.action;
		pageForm.action = contextRootPath + "/user/user_beforeAdd";
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
		pageForm.action = oldAction;
	}
}

/** 获取需要修改的用户信息 */
function editUser(userUuid) {
	var comType = $("#comType").val();
	var treeNodeId = $("#treeNodeId").val(); 
	var treeNodeName = $("#treeNodeName").val(); 
	var treeFlag = $("#treeFlag").val(); 
	location.href = contextRootPath + "/user/user_edit?userUuid="+userUuid+"&treeNodeId="+treeNodeId+"&treeNodeName="+treeNodeName+"&comType="+comType+"&treeFlag="+treeFlag;
}

/**删除用户信息*/
function deleteUser(userUuid){
	if(confirm("你确定删除这个用户吗？")){
		var oldAction = pageForm.action;
		pageForm.action =contextRootPath + "/user/user_delete?userUuid="+userUuid;
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
		pageForm.action = oldAction;
	}
}

function userSearch(){
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
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
function deleteSelectCheckBoxs(){
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
	if(confirm("你确定删除这些用户吗？")){
		var oldAction = pageForm.action;
		pageForm.action = contextRootPath + "/user/user_delete?idArrStr="+idArrStr;
		$("#currentPage").val(0);//查询结果回到第一页
		pageForm.submit();
		pageForm.action = oldAction;
	}
}

/**添加安装包版本信息*/
function addVersion(){
	location.href = contextRootPath + "/msplatform/pages/user/versionForm.jsp";
}

function versionSearch(){
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
}
