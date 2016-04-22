
/**新增区域信息*/
function addLocation(){
	var oldAction = pageForm.action;
	pageForm.action = contextRootPath + "/location/location_beforeAdd";
	$("#currentPage").val(0);//查询结果回到第一页
	pageForm.submit();
	pageForm.action = oldAction;
}

/**获取需要修改的区域信息*/
function editLocation(uuid){
	var treeNodeId = $("#treeNodeId").val();
	var treeNodeName = $("#treeNodeName").val();
	var treeFlag = $("#treeFlag").val();
	location.href = contextRootPath + "/location/location_edit?uuid="+uuid+"&treeNodeId="+treeNodeId+"&treeNodeName="+treeNodeName+"&treeFlag="+treeFlag;
}

/**删除区域信息*/
function deleteLocation(uuid){
	var treeNodeId = $("#treeNodeId").val();
	var treeNodeName = $("#treeNodeName").val();
	var treeFlag = $("#treeFlag").val();
	if(confirm("你确定删除这个区域吗？")){
		location.href = contextRootPath + "/location/location_delete?uuid="+uuid+"&treeNodeId="+treeNodeId+"&treeNodeName="+treeNodeName+"&treeFlag="+treeFlag;
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
	if(confirm("你确定删除这个区域吗？")){
		var treeNodeId = $("#treeNodeId").val(); 
		var treeNodeName = $("#treeNodeName").val(); 
		var treeFlag = $("#treeFlag").val(); 
		location.href = contextRootPath + "/location/location_delete?treeNodeId="+treeNodeId+"&treeNodeName="+treeNodeName+"&idArrStr="+idArrStr+"&treeFlag="+treeFlag;
	}
}