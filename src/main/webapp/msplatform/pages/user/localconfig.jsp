<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>本地配置</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script>
	var pathpre = "";
	var pathgao = "";
	var savetime = "";
	var pathvideo = "";
	var pathpic = "";
	//保存路径
	function savepre() {
		var obj = document.getElementById("foo");
		try {
			pathpre = obj.ChoosePath();
		} catch (e) {
			alert("控件未安装");
		}
		if (pathpre == "") {
		} else {
			document.getElementById("Capture").value = pathpre;
		}
	}
	function savegaoqing() {
		var obj = document.getElementById("foo");
		try {
			pathgao = obj.ChoosePath();
		} catch (e) {
			alert("控件未安装");
		}
		if (pathgao == "") {
		} else {
			document.getElementById("GaoqingPic").value = pathgao;
		}
	}
	function savevideo() {
		var obj = document.getElementById("foo");
		try {
			pathvideo = obj.ChoosePath();
		} catch (e) {
			alert("控件未安装");
		}
		if (pathvideo == "") {
		} else {
			document.getElementById("video").value = pathvideo;
		}

	}
	function savepic() {
		var obj = document.getElementById("foo");
		try {
			pathpic = obj.ChoosePath();
		} catch (e) {
			alert("控件未安装");
		}
		if (pathpic == "") {
		} else {
			document.getElementById("pic").value = pathpic;
		}
	}

	//点击确定方法  传给控件参数
	function ok() {
		var obj = document.getElementById("foo");
		pathgao = document.getElementById("GaoqingPic").value;
		pathpre = document.getElementById("Capture").value;
		pathvideo = document.getElementById("video").value;
		//pathpic=document.getElementById("pic").value;
		savetime = document.getElementById("savetime").value;
		//alert(savetime);
		if (pathgao == "")
			pathgao = "d://Handkoo";
		if (pathpre == "")
			pathpre = "d://Handkoo";
		if (pathvideo == "")
			pathvideo = "d://Handkoo";
		//	if(pathpic=="")
		//	pathpic="d:";
		if (savetime == "")
			savetime = "8";
		try {
			obj.DeleteConfigFile("");
			obj.WriteConfigFile(pathpre, "");
			obj.WriteConfigFile(pathgao, "");
			obj.WriteConfigFile(pathvideo, "");
			//obj.WriteConfigFile(pathpic,"");
			obj.WriteConfigFile(savetime, "");
			obj.CloseDlg();
		}

		catch (e) {
			alert("控件未安装");
		}
		window.close();

	}
/**	function Init() {
		var obj = document.getElementById("foo");

		try {
			var path1 = obj.ReadStringByLine(0, "");
			var path2 = obj.ReadStringByLine(1, "");
			var path3 = obj.ReadStringByLine(2, "");
			//var path4= obj.ReadStringByLine(3,"");
			var path5 = obj.ReadStringByLine(3, "");
		} catch (e) {
			alert("控件未安装");

		}
		document.getElementById("Capture").value = path1;
		document.getElementById("GaoqingPic").value = path2;
		document.getElementById("video").value = path3;
		document.getElementById("savetime").value = path5;
	}*/
	//点击取消

	function Cancel1() {
		window.close();
	}
	
	function browseFolder(path) {
	    try {
	        var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
	        alert("Message="+Message);
	        var Shell = new ActiveXObject("Shell.Application");
	        alert("Shell="+Shell);
	        var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
	        alert("Folder="+Folder);
	        //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
	        if (Folder != null) {
	            Folder = Folder.items(); // 返回 FolderItems 对象
	            Folder = Folder.item(); // 返回 Folderitem 对象
	            Folder = Folder.Path; // 返回路径
	            if (Folder.charAt(Folder.length - 1) != "\\") {
	                Folder = Folder + "\\";
	            }
	            document.getElementById("path").value = Folder;
	            return Folder;
	        }
	    }
	    catch (e) {
	        alert(e.message);
	    }
	}
</script>
</head>

<body leftmargin="0" topmargin="0">

<table width="420" height="208" border="0" cellspacing="0"
	cellpadding="0">
	<tr>
		<td bgcolor="#f3f3f3" valign="top" align="center"
			style="padding-top: 20;">
		<table width="400" height="90" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td colspan="2" class="ListFont" height="30">&nbsp;本地文件保存路径配置:<object
					id="foo" CLASSID="CLSID:81D3C6F2-D9B3-4AAF-8616-7B3BCF9BAD49"
					WIDTH=1 HEIGHT=1> </object></td>

			</tr>
			<tr>
				<td class="ListFont" width="75" align="center">&nbsp;文件下载
				
				<!-- <input
					name="Capture" id="Capture" value="" type="hidden"> <input
					name="GaoqingPic" id="GaoqingPic" value="" type="hidden"> <input
					name="savetime" id="savetime" value="8" type="hidden">
					</td> -->
					
				<td class="ListFont" height="42">&nbsp;<input name="video"
					id="video"
					style="FONT-SIZE: 14px; COLOR: #666161; WIDTH: 250px; height: 20px;"
					value="" maxlength="32" readonly="readonly"></td>
				<td width="57"
					style="cursor: hand; background-repeat: no-repeat; background-position: center; padding-top: 2"
					background="${ctx}/msplatform/images/common/button.gif"
					onClick="savevideo()" align="center" class="ListFont"><span
					style="font-size: 13px;">浏览</span></td>
			</tr>
			 <!--
			<tr>
				<td><input id="path" type="text" name="path" size="30"></td>
    			<td><input type=button value="选择" onclick="browseFolder('path')"></td>
			</tr> -->
			<tr>
				<td class="ListFont" width="75" align="center">&nbsp;</td>
				<td class="ListFont" height="40" style="font-size: 13px;">&nbsp;(该路径表示图片下载和打包下载的路径)</td>
			</tr>

		</table>
		</td>
	</tr>
	<tr>
		<td width="118" height="40" bgcolor="#dadada" align="right">
		<table width="380" height="40" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td>&nbsp;</td>
				<td width="118">
				<table width="118" height="40" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="57"
							style="cursor: hand; background-repeat: no-repeat; background-position: center; padding-top: 2"
							background="${ctx}/msplatform/images/common/button.gif"
							onClick="ok()" align="center" class="ListFont" id="SetPreset">确定</td>
						<td width="4">&nbsp;</td>
						<td width="57"
							style="cursor: hand; background-repeat: no-repeat; background-position: center; padding-top: 2"
							background="${ctx}/msplatform/images/common/button.gif"
							onClick="Cancel1()" align="center" class="ListFont"
							id="SetPreset">取消</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>


</html>

