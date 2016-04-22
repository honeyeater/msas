function OnBtnOK(value) {
	var oldpsw = document.getElementById("oldpsw").value;
	var newpsw = document.getElementById("newpsw").value;
	var confirmpsw = document.getElementById("confirmpsw").value;
	var reg1 = /^[\u4e00-\u9fa5]{2,4}$|^[a-zA-Z]{1,30}$/;
	var reg2 = /[a-zA-Z]+/;
	var reg3 = /[^a-zA-Z]+/;
	var regexp2 = new RegExp(reg2);
	var regexp3 = new RegExp(reg3);
	var userLgname = document.getElementById("userLgname").value;
	var userPsd = document.getElementById("userPsd").value;
	if (oldpsw == "") {// 密码长度不少于8位；至少包含一个字母和一个非字母；密码不能与用户名相同；密码不能与前一次相同
		document.getElementById("message").innerHTML = "请输入旧密码";
	} else if(hex_md5(oldpsw)!=userPsd){
		document.getElementById("message").innerHTML = "旧密码错误,请重新输入";
	}else if (newpsw == "") {
		document.getElementById("message").innerHTML = "请输入新密码";
	} else if (confirmpsw == "") {
		document.getElementById("message").innerHTML = "请输入确认密码";
	} else if (!(regexp2.test(newpsw) && regexp3.test(newpsw))) {
		document.getElementById("message").innerHTML = "密码至少包含一个字母和一个非字母";
		document.getElementById("newpsw").value = "";
		document.getElementById("confirmpsw").value = "";
	} else if (userLgname == newpsw) {
		document.getElementById("message").innerHTML = "密码不能与用户名相同";
		document.getElementById("newpsw").value = "";
		document.getElementById("confirmpsw").value = "";
	} else if (newpsw.length < 8) {
		document.getElementById("message").innerHTML = "密码长度不能小于8个字符";
		document.getElementById("newpsw").value = "";
		document.getElementById("confirmpsw").value = "";
	} else if (oldpsw == newpsw) {
		document.getElementById("message").innerHTML = "新密码与旧密码不能相同";
	} else if (confirmpsw != newpsw) {
		document.getElementById("message").innerHTML = "两次输入的密码不一致";
	} else {
		var url = contextRootPath + "/user/user_modifyPassword?oldpsw="
				+ oldpsw + "&newpsw=" + newpsw + "&confirmpsw=" + confirmpsw;
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			success : function(data) {
				document.getElementById("message").innerHTML = data;
				document.getElementById("oldpsw").value = "";
				document.getElementById("newpsw").value = "";
				document.getElementById("confirmpsw").value = "";
				if(data != ""){
					if (data.indexOf("修改成功") > -1) {
						alert("密码修改成功，请使用新密码重新登录!");
						window.returnValue = 1;
						window.close();
					}
				}
			}
		});
	}
}

function OnBtnCancel() {
	window.returnValue = 0;
	window.close();
}