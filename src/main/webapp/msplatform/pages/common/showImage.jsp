<%@page import="com.sinosoft.msplatform.fileupload.OssManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%
    OssManage ossManage = new OssManage();
    String imgurl = ossManage.getImgURl("ba9ee07d-c7e5-479f-ba7b-2d4a527cf41f");
    System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"  + imgurl);
%>
<html>
	<head>
	<SCRIPT LANGUAGE="JavaScript">
//滑轮滚动放大缩小
function onChange(field)
{
    var index = 0;
    var imgArray = document.getElementsByName("img");
    var zoom = parseInt(imgArray[index].style.zoom) || 100;
    if (event.wheelDelta > 0)
        zoom += 10;
    else
        zoom -= 10;
    if (zoom > 0)
        imgArray[index].style.zoom = zoom + '%';
    return false;
}
/****************************完美分割线**********************************/
//图片放大
function becomebig(field)
{
    var index = 0;
    var imgArray = document.getElementsByName("img");
    var old = imgArray[index].width;
    var b = 100;
    old = old + b;
    if (old > 2000)
        old = 2000;
    imgArray[index].width = old;
}
/****************************完美分割线**********************************/
//图片缩小
function becomesmall(field)
{
    var index = 0;
    if (index < 1)
        index = 0;
    var imgArray = document.getElementsByName("img");
    var old = imgArray[index].width;
    var b = 100;
    old = old - b;
    if (old < 50)
        old = 50;
    imgArray[index].width = old;
}
/****************************完美分割线**********************************/
//增加对比度
var b = 100;
var c = 1;
var d;
function contrast_increase(field)
{
    var index = 0;
    var imgArray = document.getElementsByName("img");
    if (c != 00)
    {
        b -= 10;
        c = b;
    }
    if (b <= 0)
    {
        b = 0;
    }
    d = 0 + b;
    imgArray[index].style.filter = "Alpha(Opacity=" + d + ")";
}
/****************************完美分割线**********************************/
//减少对比度
function contrast_decrease(field)
{
    var index = 0;
    var imgArray = document.getElementsByName("img");
    if (c != 100)
    {
        b += 10;
        c = b;
    }
    if (b >= 100)
    {
        b = 100;
    }
    d = 0 + b;
    imgArray[index].style.filter = "Alpha(Opacity=" + d + ")";
}
/****************************完美分割线**********************************/
//顺时针旋转
function rotateImage_shun(field)
{
    var index = 0;
    var imgArray = document.getElementsByName("img");
    var tmpFilter = imgArray[index].style.filter;
    var imgindex = 0;
    imgindex = parseInt(tmpFilter.charAt(tmpFilter.length - 2));
    if (!isFinite(imgindex))
    {
        imgindex = 1;
    }
    else
    {
        imgindex = imgindex + 1;
        if (imgindex > 3)
        {
            imgindex = 0;
        }
    }
    imgArray[index].style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=" + imgindex + ")";
}
/****************************完美分割线**********************************/
//逆时针旋转
function rotateImage_ni(field)
{
    var index = 0;
    var imgArray = document.getElementsByName("img");

    var tmpFilter = imgArray[index].style.filter;

    var imgindex = 3;
    imgindex = parseInt(tmpFilter.charAt(tmpFilter.length - 2));

    if (!isFinite(imgindex))
    { //first time
        imgindex = 3;
    }
    else
    {
        imgindex = imgindex - 1;
        if (imgindex < 0)
        {
            imgindex = 3;
        }
    }
    imgArray[index].style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=" + imgindex + ")";
}

</SCRIPT>
	</head>
	<body>
	<tr>
				<input align="center" type="hidden" class=button name='addsize'
					value="放大" onclick="javascript:becomebig(this);">
					
				<input align="center" type="hidden" class=button name='decsize'
					value="缩小" onclick="javascript:becomesmall(this);">

				<img align="top" src="${ctx}/msplatform/images/common/rotateImage_shun.jpg"
					alt="顺时针旋转" name='rotateImage1111'
					onclick="javascript:rotateImage_shun(this);">
				旋转
				<img align="top" src="${ctx}/msplatform/images/common/rotateImage_ni.jpg" alt="逆时针旋转"
					name='rotateImage2222' onclick="javascript:rotateImage_ni(this);">
					
				<input align="center" type="button" class=smallbutton
					name='increase' value="  +  "       onClick="contrast_increase(this)" />
				
				<img align="top" src="${ctx}/msplatform/images/common/duibidu.jpg" alt="对比度">
				
				<input align="center" type="button" class=smallbutton
					name='decrease' value="  -  " onClick="contrast_decrease(this)" />
				
				<input align="center" type="button" class=button name='return'
					value=" 返回 " onclick="history.back();" />
					
					<font color="#FF0000">说明：滚动鼠标中键可改变图片大小.</font>
      </tr>
      <br>
      <tr>
					<span id="image" style="filter:progid:DXImageTransform.Microsoft.BasicImage(Rotation=1);">
					<img name="img" src="<%=imgurl%>" 
					   style="filter: alpha(opacity=100)"  onmousewheel="return onChange(this);">
	 </tr>		
	</body>
</html>


