<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.net.InetAddress"%>
<%@page import="com.sinosoft.msplatform.webservice.util.IPUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp" %>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	//String ip = request.getLocalAddr();
	//String ip = request.getRemoteAddr();
	//String ip = IPUtil.getRemoteIpAddr(request);
    String ip = request.getServerName();
	
	int port = request.getLocalPort();
	String url1 = request.getScheme()+"://"+ip+":"+port+"/msplatform/user/user_versionDownload?appType=2&systemCode=2";
	String url2 = request.getScheme()+"://"+ip+":"+port+"/msplatform/user/user_versionDownload?appType=1&systemCode=2";
	String url3 = request.getScheme()+"://"+ip+":"+port+"/msplatform/user/user_versionDownload?appType=2&systemCode=1";
	String url4 = request.getScheme()+"://"+ip+":"+port+"/msplatform/user/user_versionDownload?appType=1&systemCode=1";
	request.setAttribute("url1",url1);
	request.setAttribute("url2",url2);
	request.setAttribute("url3",url3);
	request.setAttribute("url4",url4);
%>
<head>
	<title>天安客户端地址下载</title>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/login/utf.js"></script>
 	<script type="text/javascript" src="${ctx}/msplatform/js/login/jquery.qrcode.js"></script>
 	<script type="text/javascript" src="${ctx}/msplatform/js/login/downloadAddress.js"></script>
	<style>
		td{
			width: 260px;
			text-align: center;
		}
		.version_title{
			height:20px;
			background-color: #00BBff; 
		}
		.version_title1{
			height:20px;
			background-color: #ffbb66; 
		}
		#qrcodeCanvas1{
			background-color: #cceeff
		}
		#qrcodeCanvas2{
			background-color: #cceeff
		}
		#qrcodeCanvas3{
			background-color: #cceeff
		}
		#qrcodeCanvas4{
			background-color: #cceeff
		}
			
	</style>
</head>

<body style="line-height: 25px" >
	<fieldset style="width: 1300px;"  >
	<div style="margin: 0 auto;float: left;">
	<input type="hidden" id="url1" value="${url1 }"/>
	<input type="hidden" id="url2" value="${url2 }"/>
	<input type="hidden" id="url3" value="${url3 }"/>
	<input type="hidden" id="url4" value="${url4 }"/>
		<h1>
			<a style='font-size:20px;color:blue'>天安客户端地址下载</a>
		</h1>
		<!-- <h2>
			<a style='font-size:16px;color:blue'>客户自助：</a>
		</h2>
		<p style='font-size:14px;color:blue'>Android版本下载地址：</p>
		<a style='font-size:14px;color:blue' href="javascript:downloadVersion('2','2');"
			><span id="tb1">${url1}</span></a>
		[<a href="javascript:void(0)" onclick="copyText('tb1')">点击复制</a>]
		<p style='font-size:14px;color:blue'>IOS版下载地址：</p>
		<a style='font-size:14px;color:blue' href="javascript:downloadVersion('1','2');"
			><span id="tb2">${url2}</span></a>
		[<a href="javascript:void(0)" onclick="copyText('tb2')">点击复制</a>]
		<div style="height: 20px"></div> -->
		<h2>
			<a style='font-size:16px;color:blue'>查勘员/修理厂：</a>
		</h2>
		<p style='font-size:14px;color:blue'>Android版下载地址：</p>
		<a style='font-size:14px;color:blue' href="javascript:downloadVersion('2','1');"
			><span id="tb3">${url3}</span></a>
		[<a href="javascript:void(0)" onclick="copyText('tb3')">点击复制</a>]
		<p style='font-size:14px;color:blue'>IOS版下载地址：</p>
		<a style='font-size:14px;color:blue' href="javascript:downloadVersion('1','1');"
			><span id="tb4">${url4}</span></a>
		[<a href="javascript:void(0)" onclick="copyText('tb4')">点击复制</a>]
	</div>
	<div style="float: left;margin:10px 20px">
		<table style="width: 600px;height: 300px;" border="1" cellpadding="0" cellspacing="1" >
			<!-- <tr><td colspan="2" class="version_title">客户自助模式</td></tr>
			<tr><td class="version_title1">Android版</td><td class="version_title1">IOS版</td></tr>
			<tr><td id="qrcodeCanvas1" ></td><td id="qrcodeCanvas2" ></td></tr> -->
			<tr><td colspan="2" class="version_title">查勘员/修理厂模式</td></tr>
			<tr><td class="version_title1">Android版</td><td class="version_title1">IOS版</td></tr>
			<tr>
				<td id="qrcodeCanvas3"><div align="center" id="qr3"></div></td>
				<td id="qrcodeCanvas4"><div align="center" id="qr4"></div></td>
			</tr>
		</table>
	</div>	
	</fieldset>
</body>

</html>

