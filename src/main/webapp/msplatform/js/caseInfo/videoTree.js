var zTree1;
var zTree2;
var rTaskId;
var isOpen1 = false;
var isOpen2 = false;
var openNodeIds = [];//已打开的节点的ID
var curTreeType = "";
//搜索
var ifFind1 = 0;
var ifFind2 = 0;
var location1 = 0;
var location2 = 0;

//初始化树的参数
var setting1 = {
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
		// 呼叫用户
		onDblClick : callUser
	}
};

//初始化树的参数
var setting2 = {
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
		beforeClick : callUser
	}
};

var Cicon = contextRootPath
	+ "/msplatform/zTreeStyle/img/diy/phone18.png";
var Dicon = contextRootPath
	+ "/msplatform/zTreeStyle/img/diy/account.gif";

//呼叫用户
function callUser(event, treeId, treeNode) {
	if(treeNode && treeNode.mobile!=null && treeNode.mobile!=''){
		
		/**
		 *	呼叫前判断当前是否有未完成任务，如果左下角显示未完成任务，
		 *	则获取案件对应手机号和需要点击的手机号比较，如果手机号相同则获取对应案件号
		 */
		var callout_caseNo = "";//实时监控页面右下角案件号（如果有任务显示） 
		var callout_phoneNo = parent.frames["handle"].callout_phoneNo;
		if(callout_phoneNo!='' && callout_phoneNo == treeNode.mobile){
			callout_caseNo = parent.frames["handle"].callout_caseNo;
		}
		parent.callUser(treeNode.mobile,callout_caseNo);
	}
}

//变换样式
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

function searchTree() {
	var content = $("#key").val().replace(/(^\s*)|(\s*$)/g, "");
	if(content != ""){
		if($("#tree1").css("display") == "block"){
			var nodes = zTree1.transformToArray(zTree1.getNodes());
			for(location1; location1 < nodes.length; location1++){
				if(nodes[location1].icon.indexOf(Dicon)>-1 && nodes[location1].name.indexOf(content) > -1){
					zTree1.selectNode(nodes[location1]);
					ifFind1 = 1;
					location1++;
					return;
				}
			}
			if(ifFind1 == 1){
				ifFind1 = 0;
				location1 = 0;
				searchTree();		
			}else{
				location1 = 0;
				alert("无此查勘员");
			}
		}else if($("#tree2").css("display") == "block"){
			var nodes = zTree2.transformToArray(zTree2.getNodes());
			for(location2; location2 < nodes.length; location2++){
				if(nodes[location2].icon.indexOf(Cicon)>-1 && nodes[location2].name.indexOf(content) > -1){
					zTree2.selectNode(nodes[location2]);
					ifFind2 = 1;
					location2++;
					return;
				}
			}
			if(ifFind2 == 1){
				ifFind2 = 0;
				location2 = 0;
				searchTree();		
			}else{
				location2 = 0;
				alert("无此客户");
			}
		}
	}
}

function initTree() {
	// 获取树形结构数据
	var zNodes1 = [];
	var zNodes2 = [];
	var menuURL = contextRootPath + "/dynamicPhotoTree?rnd="+Math.random();
	curTreeType = $("#selectTest").val();
	$.ajax({
		type : "POST",
		url : menuURL,
		async : false,
		data : {treeType:curTreeType, openUuid:openNodeIds},
		traditional: true,
		success : function(data) {
			var realData = $.parseJSON(data);
			if(curTreeType == '1'){//在线查询员列表
				var data = realData.list1;
				if (realData != '') {
					var a = contextRootPath
							+ "/msplatform/zTreeStyle/img/diy/Area.gif";
					var b = contextRootPath
							+ "/msplatform/zTreeStyle/img/diy/Area1.png";
					var Dicon = contextRootPath
							+ "/msplatform/zTreeStyle/img/diy/account.gif";
					//tree1写入数据
					for ( var i = 0; i < data.length; i++) {
						var thisIcon = "";
						var thisiconOpen = "";
						var thisiconClose = "";
						if (data[i].comLevel == 4) {
							thisIcon = Dicon;
						}else {
							thisIcon = a;
							thisiconOpen = a;
							thisiconClose = b;
						}
						zNodes1.push({
							id : data[i].uuid,
							pId : data[i].parentUuid,
							name : data[i].name,
							t : data[i].name,
							mobile : data[i].mobile,
							icon : thisIcon,
							iconOpen : thisiconOpen,
							iconClose : thisiconClose,
							open : data[i].open
						});
						
					}
				}
				//初始化树
				zTree1 = $.fn.zTree.init($("#tree1"), setting1, zNodes1);
			} else if(curTreeType == '2'){//在线自助客户列表
				var data2 = realData.list1;
				if (realData != '') {
					var a = contextRootPath
							+ "/msplatform/zTreeStyle/img/diy/Area.gif";
					var b = contextRootPath
							+ "/msplatform/zTreeStyle/img/diy/Area1.png";
					var Cicon = contextRootPath
							+ "/msplatform/zTreeStyle/img/diy/phone18.png";
					//tree2写入数据
					for ( var i = 0; i < data2.length; i++) {
						var thisIcon2 = "";
						var thisiconOpen2 = "";
						var thisiconClose2 = "";
						if(data2[i].comLevel == 4){
							thisIcon2 = Cicon;
						}else {
							thisIcon2 = a;
							thisiconOpen2 = a;
							thisiconClose2 = b;
						}
						zNodes2.push({
							id : data2[i].uuid,
							pId : data2[i].parentUuid,
							name : data2[i].name,
							t : data2[i].name,
							mobile : data[i].mobile,
							icon : thisIcon2,
							iconOpen : thisiconOpen2,
							iconClose : thisiconClose2,
							open : data2[i].open
						});
					}
				}
				//初始化树
				zTree2 = $.fn.zTree.init($("#tree2"), setting2, zNodes2);
			}
		}
	});
	rTaskId = setTimeout("refreshTree()", 20000);
}

var treeType = "";
function initViewTree() {
	treeType = $("#treeType").val();
	//选择要显示的树
	$("#selectTest").change(function() {
		if ($("#selectTest").find("option:selected").val() == 1) {
			$("#tree2").css("display", "none");
			$("#tree1").css("display", "block");
		} else if ($("#selectTest").find("option:selected").val() == 2) {
			$("#tree1").css("display", "none");
			$("#tree2").css("display", "block");
		}
		refreshTree();
	});
	$("#tree2").css("display", "none");
	$("#tree1").css("display", "block");
	initTree();
}
//$(document).ready(function() {
//	
//});

function refreshTree(){
	curTreeType = $("#selectTest").val();
	openNodeIds.length = 0;//清空
	var nodes;
	if(curTreeType=='1'){
		if(zTree1!=null){
			nodes = zTree1.getNodes();
			//获取所有父节点的展开状态
			isOpen1 = nodes[0].open;
			for(var i=0; i<nodes.length; i++){
				getAllOpenPNode(nodes[i]);
			}
		} else {
			initTree();
			return;
		}
	} else if(curTreeType=='2') {
		if(zTree2!=null){
			nodes = zTree2.getNodes();
			//获取所有父节点的展开状态
			isOpen2 = nodes[0].open;
			for(var i=0; i<nodes.length; i++){
				getAllOpenPNode(nodes[i]);
			}
		} else {
			initTree();
			return;
		}
	} else {
		return;
	}
	if(rTaskId!=null){
		clearTimeout(rTaskId);
		initTree();
	} else {
		initTree();
	}
}

function test(){
	openNodeIds.length = 0;
	nodes = zTree1.getNodes();
	//获取所有父节点的展开状态
	isOpen1 = nodes[0].open;
	for(var i=0; i<nodes.length; i++){
		getAllOpenPNode(nodes[i]);
	}
	alert(openNodeIds);
}

function getAllOpenPNode(zNode){
	if(zNode.isParent && zNode.open){
		openNodeIds[openNodeIds.length] = zNode.id;
		for(var k=0; k<zNode.children.length; k++){
			getAllOpenPNode(zNode.children[k]);
		}
	}
}







