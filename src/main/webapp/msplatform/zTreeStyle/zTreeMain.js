//初始化树的参数
var setting = {
	data : {
		// 添加属性r
		key : {
			title : "t"
		},
		// 简单数据模式
		simpleData : {
			enable : true
		}
	},
	view : {
		// 个性化文字样式(JSON / Function(treeId, treeNode))
		fontCss : getFontCss,
		selectedMulti : false
	},
	callback : {
		// 点击树之前确认的函数
		beforeClick : beforeClick
	}
};

function focusKey(e) {
	if (key.hasClass("empty")) {
		key.removeClass("empty");
	}
}
function blurKey(e) {
	if (key.get(0).value === "") {
		key.addClass("empty");
	}
}
// 选中的节点集合
var nodeList = [], fontCss = {};
// 查询次数标志
var i = -1;
// 查询输入值
var k;
// 查询节点树
function searchNode(e) {
	// 得到zTree对象
	var zTree = $.fn.zTree.getZTreeObj("treeBody");
	zTree.refresh();
	updateNodes(false, i);
	k = document.getElementById('key').value;
	i++;

	var value = $.trim(key.get(0).value);
	var keyType = "";
	keyType = "name";
	if (key.hasClass("empty")) {
		value = "";
	}
	if (value === "")
		return;
	// 根据属性模糊查询节点
	nodeList = zTree.getNodesByParamFuzzy(keyType, value);

	if (nodeList.length == 0) {
		alert("未查询到包含字符串\"" + k + "\"的节点!");

		return;
	}
	var count = nodeList.length;
	if (count > i) {// 个数>查询次数//存在符合条件的项
		if (i == 0) {// 只查询一次
			updateNodes(false, 0);
		} else {
			updateNodes(false, i - 1);
		}
		updateNodes(true, i);
		showFrameInfo(nodeList[i]);

	} else {
		updateNodes(false, i - 1);
		updateNodes(true, 0);
		showFrameInfo(nodeList[0]);
		i = 0;
	}

}
// 更新节点
function updateNodes(highlight, i) {
	if (nodeList.length == 0) {
		return;
	}
	var zTree = $.fn.zTree.getZTreeObj("treeBody");
	var dnodes = zTree.getSelectedNodes();

	nodeList[i].highlight = highlight;
	zTree.updateNode(nodeList[i]);
	var a = nodeList[i].getParentNode();
	// 展开指定的父节点
	zTree.expandNode(a, true, null, null, true);

}
// 变换样式
function getFontCss(treeId, treeNode) {
	// !!,确保返回值是 Boolean 类型
	return (!!treeNode.highlight) ? {
		color : "#A60000",
		"font-weight" : "bold"
	} : {
		color : "#333",
		"font-weight" : "normal"
	};
}

var nodeName = "";
// 输入的查询数据
var key;
// 载入数据的集合
var zNodes = [];

// 删除左右两端的空格
function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
// 查询功能
function search() {
	var key = document.getElementById('key').value;
	key = trim(key);

	if (key.length == 0) {
		alert("查询字符不能为空");
		return;
	}
	searchNode();
}
// 点击节点前确认
function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeBody");
	if (i != -1) {
		updateNodes(false, i);
	}
	i = -1;
	nodeName = treeNode.name;
	showFrameInfo(treeNode);
}

function showFrameInfo(treeNode) {
	var type = $("#type").val();
	var id = treeNode.id;
	var pId = treeNode.pId;
	var comType=$("#comType").val(); 
	var treeFlag = "1";
	if("location" == type && "0001"==id){
		treeFlag = "0";
	}
	
	if("0"==pId){
		return;
	}
	var name = treeNode.name;
	if ("location" == type || "user" == type || "company" == type || "caseInfo" == type) {
		parent.document.getElementById("FrameInfo").src = contextRootPath + "/"+ type + "/" + type +"_queryByTree?treeNodeId="
				+ id + "&treeFlag=" + treeFlag;
	} else if ("survey" == type) {
		parent.document.getElementById("FrameInfo").src = contextRootPath + "/checkUser/checkUser_queryByTree?treeNodeId="
				+ id + "&checkType=" + 1 + "&treeFlag=" + treeFlag;
	} else if ("garage" == type) {
		parent.document.getElementById("FrameInfo").src = contextRootPath +"/checkUser/checkUser_queryByTree?treeNodeId="
				+ id + "&checkType=" + 2 + "&treeFlag=" + treeFlag;
	}else if("caseCost" == type){
		parent.document.getElementById("FrameInfo").src = contextRootPath +"/caseInfo/caseInfo_queryCostByTree?treeNodeId="
		+ id + "&treeFlag=" + treeFlag;
	}else if("photo" == type){
		parent.document.getElementById("FrameInfo").src = contextRootPath +"/uploadImg/uploadImg_queryByTree?treeNodeId="
		+ id + "&treeFlag=" + treeFlag;
	}else if("replay" == type){
		parent.document.getElementById("FrameInfo").src = contextRootPath +"/msplatform/pages/replay/replay.jsp?treeNodeId="
		+ id + "&treeFlag=" + treeFlag;
	}

}

// 为输入框添加回车事件
function keydown(e) {
	if (e.keyCode == 13) {
		search();
	}
}

function initTree() {
	// 获取树形结构数据
	var menuURL = "";
	var comType=$("#comType").val();
	var locationId=$("#locationId").val();
	var type=$("#type").val();
	var rndtime = new Date().getTime();
	menuURL = contextRootPath + "/tree?method=getMenu&comType="+comType+"&locationId=" + locationId+"&type=" + type+"&rndtime=" + rndtime;
	$.ajax({
		type : "POST",
		url : menuURL,
		async : false,
		success : function(data) {
			data = $.parseJSON(data);
			if (data != '') {
				var a = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/Area.gif";
				var b = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/phone18.png";
				var c = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/1_open.png";
				for ( var i = 0; i < data.length; i++) {
					var thisIcon = "";
					if (data[i].comLevel == 0) {
						var thisIcon = c;
					} else {
						var thisIcon = a;
					}
					zNodes.push({
						id : data[i].uuid,
						pId : data[i].parentUuid,
						name : data[i].name,
						t : data[i].name,
						icon : thisIcon,
						iconOpen : contextRootPath
								+ "/msplatform/zTreeStyle/img/diy/Area.gif",
						iconClose : contextRootPath
								+ "/msplatform/zTreeStyle/img/diy/Area1.png"
					});
				}
			}
		}
	});

	$.fn.zTree.init($("#treeBody"), setting, zNodes);
	key = $("#key");
	key.bind("focus", focusKey).bind("blur", blurKey);
}

// 左侧树型结构
$(document).ready(function() {
	initTree();
});