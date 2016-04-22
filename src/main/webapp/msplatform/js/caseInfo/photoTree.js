var zTree1;
var zTree2;
var setting1;
var setting2;
var rTaskId;

//初始化树的参数
setting1 = {
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

//初始化树的参数
setting2 = {
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

var Cicon = contextRootPath
	+ "/msplatform/zTreeStyle/img/diy/phone18.png";
var Dicon = contextRootPath
	+ "/msplatform/zTreeStyle/img/diy/account.gif";

//点击节点前确认
function beforeClick(treeId, treeNode) {
	if (treeNode != null && (treeNode.icon.indexOf(Dicon)>-1)||treeNode.icon.indexOf(Cicon)>-1) {
		var array = treeNode.name.split(" ");
		var deviceNum ;
		if(array.length==2){
			deviceNum = array[1];
		}else {
			deviceNum = array[0];
		}
		if(treeType.indexOf("photo")>-1){
			window.parent.frames["FrameInfo"].document.getElementById("deviceNum").value = deviceNum;
		}
		if(treeType.indexOf("replay")>-1){
			window.parent.frames["FrameInfo"].document.getElementById("deviceNum").value = deviceNum;
		}
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

//搜索
var ifFind1 = 0;
var ifFind2 = 0;
var location1 = 0;
var location2 = 0;

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
	var zNodes1 = [ {
		"id" : "00",
		"name" : "财险总公司查勘员",
		"t" : "财险总公司查勘员",
		"icon" : contextRootPath + "/msplatform/zTreeStyle/img/diy/1_close.png",
		"iconOpen" : contextRootPath + "/msplatform/zTreeStyle/img/diy/1_open.png",
		"iconClose" : contextRootPath + "/msplatform/zTreeStyle/img/diy/1_close.png"
	} ];
	var zNodes2 = [ {
		"id" : "00",
		"name" : "财险总公司手机自助",
		"t" : "财险总公司手机自助",
		"icon" : contextRootPath + "/msplatform/zTreeStyle/img/diy/1_close.png",
		"iconOpen" : contextRootPath + "/msplatform/zTreeStyle/img/diy/1_open.png",
		"iconClose" : contextRootPath + "/msplatform/zTreeStyle/img/diy/1_close.png"
	} ];
	
	var menuURL = "";
	if(treeType.indexOf("video")>-1){
		menuURL = contextRootPath + "/dynamicPhotoTree?rnd="+Math.random();
	}else {
		menuURL = contextRootPath + "/photoTree?rnd="+Math.random();
	}
	$.ajax({
		type : "POST",
		url : menuURL,
		async : false,
		success : function(data) {
			var realData = $.parseJSON(data);
			var data = realData.list1;
			var data2 = realData.list2;
			if (realData != '') {
				var a = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/Area.gif";
				var b = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/Area1.png";
				var Cicon = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/phone18.png";
				var Dicon = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/account.gif";
				var e = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/1_open.png";
				var f = contextRootPath
						+ "/msplatform/zTreeStyle/img/diy/1_close.png";
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
					if((data[i].parentUuid=="0001" || data[i].parentUuid=="") && data[i].comLevel != 4 ){
						zNodes1.push({
							id : data[i].uuid,
							pId : "00",
							name : data[i].name,
							t : data[i].name,
							icon : thisIcon,
							iconOpen : thisiconOpen,
							iconClose : thisiconClose
						});
					}else {
						zNodes1.push({
							id : data[i].uuid,
							pId : data[i].parentUuid,
							name : data[i].name,
							t : data[i].name,
							icon : thisIcon,
							iconOpen : thisiconOpen,
							iconClose : thisiconClose
						});
					}
					
				}
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
					if((data2[i].parentUuid=="0001" || data2[i].parentUuid=="") && data2[i].comLevel != 4 ){
						zNodes2.push({
							id : data2[i].uuid,
							pId : "00",
							name : data2[i].name,
							t : data2[i].name,
							icon : thisIcon2,
							iconOpen : thisiconOpen2,
							iconClose : thisiconClose2
						});
					}else {
						zNodes2.push({
							id : data2[i].uuid,
							pId : data2[i].parentUuid,
							name : data2[i].name,
							t : data2[i].name,
							icon : thisIcon2,
							iconOpen : thisiconOpen2,
							iconClose : thisiconClose2
						});
					}
					
				}
			}
		}
	});
	//初始化树
	zTree1 = $.fn.zTree.init($("#tree1"), setting1, zNodes1);
	zTree2 = $.fn.zTree.init($("#tree2"), setting2, zNodes2);
	if(treeType.indexOf("video")>-1){
		rTaskId = setTimeout("initTree()", 10000);
	}
}

var treeType = "";
$(document).ready(function() {
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
	});

	$("#tree2").css("display", "none");
	$("#tree1").css("display", "block");
	initTree();
});

function refreshTree(){
	if(rTaskId!=null){
		clearTimeout(rTaskId);
		initTree();
	} else {
		initTree();
	}
}







