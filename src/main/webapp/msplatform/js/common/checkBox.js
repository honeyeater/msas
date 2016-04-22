function isFieldIdChecked(fieldId){
	if(document.all[fieldId] == undefined){
		alert("请选择一条数据");
		return false;
	}
	var length = document.all[fieldId].length;
	var flag = false;
	if(typeof(length) == "undefined"){
		if(document.all[fieldId].checked == true){
			flag = true;
		}
	}else{
		for(var i=0;i<length;i++){
			if(document.all[fieldId][i].checked == true){
				flag = true;
				break;
			}
		}
	}
	if(!flag){
		alert("请选择一条数据");
		return false;
	}
	return true;
}