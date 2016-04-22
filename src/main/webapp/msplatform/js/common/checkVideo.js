var checkMap = new Map();
var MAP_C0001 = "MAP_C0001";
var MAP_C0002 = "MAP_C0002";
var MAP_C0003 = "MAP_C0003";
var MAP_C0004 = "MAP_C0004";
var MAP_C0005 = "MAP_C0005";
var MAP_C0006 = "MAP_C0006";
var MAP_C0007 = "MAP_C0007";
var MAP_C0008 = "MAP_C0008";
var MAP_C0009 = "MAP_C0009";
var MAP_C0010 = "MAP_C0010";
var MAP_C0010 = "MAP_C0011";
checkMap.put("MAP_C0001", "反初始化控件失败");
checkMap.put("MAP_C0002", "从平台读取配置信息失败");
checkMap.put("MAP_C0003", "初始化控件和平台连接失败");
checkMap.put("MAP_C0004", "坐席签入失败");
checkMap.put("MAP_C0005", "坐席签出失败");
checkMap.put("MAP_C0006", "坐席设置示闲（有空）失败");
checkMap.put("MAP_C0007", "坐席设置示忙（暂离）失败");
checkMap.put("MAP_C0008", "坐席设置离席（迁出）失败");
checkMap.put("MAP_C0009", "应答用户呼入成功！");
checkMap.put("MAP_C0010", "应答用户呼入失败 ！");
checkMap.put("MAP_C0011", "视频结束失败！");

function videoPromptMSG(key) {
	var msg = checkMap.get(key);
	if (null != msg) {
		alert(msg);
	}
}

function videoErrorMSG(key) {
	var msg = checkMap.get(key);
	if (null != msg) {
		alert(msg);
	}
}
