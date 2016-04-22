<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<meta name="save" content="history">
<link rel='STYLESHEET' type='text/css' href='${ctx}/css/common/newAdd.css'>
<title></title>
<script type="text/javascript">
function delayURL(){
    var delay = document.getElementById("time").innerHTML;
    if(delay>0){
        delay--;
        document.getElementById("time").innerHTML = delay;
    }else{
        location.href = contextRootPath+"/${action }";
    }
    setTimeout('delayURL()',1000);
}
</script>
<style type="text/css">
		table {
			font:14px "microsoft yahei",Tahoma, Geneva, sans-serif; font-weight:normal;
		}
</style>
</head>
<body onload="delayURL();">
	<table cellpadding="4" cellspacing="1" align="center" style="margin-top:30px;border:1px solid #B4DAF1;" >
	    <tr>
	    	<td style="color:#3399CC;border-bottom:1px solid #B4DAF1;padding-left:5px;" colspan="2">提示信息</td>
	    </tr>
	    <tr>
		    <td  class="input" style="width:30%;border-right:1px solid #B4DAF1;text-align:center">
		    	<img src='${ctx}/msplatform/images/common/imgSuccess.gif'>
		    </td>
		    <td class="input" style="width:70%;">
		     ${message }
		     </br>
		     <span id="time">3</span>
		      秒钟后自动跳转
		      </br>
		      如果不跳转，请点击下面链接
		     <a href="${ctx}/${action}">返回</a>
		    </td>
	    </tr>
    </table> 
</body>
</html>