
/**	点击照片弹出新窗口*/
function showPhoto(uuid,caseUuid) {
	var win = window
			.showModalDialog(
					contextRootPath
							+ "/msplatform/pages/caseInfo/showReuploadImg.jsp?uuid="+uuid+"&caseUuid="+caseUuid, window,
					'dialogWidth:650px;dialogHeight:800px;scroll:no;status:no;center:yes');
}

/**	全选、全部选*/
function selectAll(obj){
	if(obj.checked){
		$("input[name='index_box']").prop("checked",true);
	} else {
		$("input[name='index_box']").prop("checked",false);
	}
}

/**	单选框控制全选显示*/
function checkAllBox(obj){
	var flag=true;//默认全选
	if($(obj).prop("checked")==false){
		flag=false;
	}else {
		flag=true;
		$("input[name='index_box']").each(function(){
			if($(this).prop("checked")!=true){
				flag=false;
			} 
		});
	}
	if(flag==true) {
		$("input[name='all_box']").prop("checked",true);
	}else {
		$("input[name='all_box']").prop("checked",false);
	}
}

/**	打包下载*/
function downloadAllPicToZIP(){
	if(isFieldIdChecked("index_box")==false){
		return false;
	}
	var array=new Array();
	$("input[name='index_box']").each(function(){
		if($(this).prop("checked")==true){
			array.push($(this).val());
		} 
	});
	
	if(array.length > 0){
		var url = contextRootPath + "/uploadImg/uploadImg_reuploadImgDownLoadPics";
		var form = $("<form>");// 定义一个form表单
		form.attr("style", "display:none");
		form.attr("method", "post");
		form.attr("action", url);
		$("body").append(form);// 将表单放置在web中
		
		for(var i=0; i<array.length; i++){
			var input2 = $("<input>");
			input2.attr("type", "hidden");
			input2.attr("name", "picIds");
			input2.attr("value", array[i]);
			form.append(input2);
		}
		form.submit();// 表单提交
	}
}

/**删除图片*/
function deletePhoto(){
	if(isFieldIdChecked("index_box")==false){
		return false;
	}
	var array=new Array();
	$("input[name='index_box']").each(function(){
		if($(this).prop("checked")==true){
			array.push($(this).val());
		} 
	});

	if(array.length > 0 && confirm("确定要删除吗？")){
		var url = contextRootPath + "/uploadImg/uploadImg_reuploadDelete?random="+Math.random();
		$.ajax({
			type: "POST",
			url: url,
			data:{picIds:array},
			traditional: true,
			success: function(data){
				if(data=='success'){
					$("input[name='index_box']").each(function(){
						if($(this).prop("checked")==true){
							$(this).parent().parent().remove();
						} 
					});
				} else {
					alert("删除失败，请稍后重试");
				}
			}
		});
	}
}