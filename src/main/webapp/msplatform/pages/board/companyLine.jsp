<%@page import="com.sinosoft.msplatform.util.Constant"%>
<%@ page import="java.util.List"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath",basePath);
	request.setAttribute("ctx",path);
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "xhtml11.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible"
	content="IE=10;IE=9; IE=8; IE=7; IE=EDGE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>案件受理状态</title>
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/highcharts.js"
	type="text/javascript"></script>
<style type="text/css">
body {
	font-family: 'Lato', 'Arial', sans-serif;
	background: #ddd ;
	font-weight: 300;
	font-size: 15px;
	color: #333;
}
a {
	color: #555;
	text-decoration: none;
}
</style>
<script type="text/javascript">
$(document).ready(function()  {
	
$(function () {
    $('#container').highcharts({
    	title: {
            text: '案件受理状态',
            x: -20, //center
            style: { color: '#3E576F', 
	                 font: ' 16px "microsoft yahei",Tahoma, Geneva, sans-serif'
	        } 
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            categories: [${result}],
            labels: { 
                      rotation: -37,
                      style: {
                    	  color: '#808080', //刻度字体颜色
                    	  fontSize:12 //刻度字体大小
                    	  },
                   	  formatter: function () {
                             return '<a href="${basePath}/msplatform/pages/board/companyPie.jsp?linetoPieCom='+this.value+'">' +
                                 this.value + '</a>';
                         }
                   }
        },
        yAxis: {
        	min: 0,
            title: {
                text: '案件数量'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '个'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{//0-未连线 1-连线成功 2-视频完成 3-申请改派 4-改派完成 5-连线前注销 6-连先后注销
            name: '${status0}',
            data: [${result0}]
        }, {
            name: '${status1}',
            data: [${result1}]
        }, {
            name: '${status2}',
            data: [${result2}]
        }, {
            name: '${status3}',
            data: [${result3}]
        }, {
            name: '${status4}',
            data: [${result4}]
        }, {
            name: '${status5}',
            data: [${result5}]
        }, {
            name: '${status6}',
            data: [${result6}]
        }, {
            name: '${status7}',
            data: [${result7}]
        }]
	});	
});
});

function myrefresh(){			
	window.location.reload();
}
setTimeout('myrefresh()', 120000); //30秒刷新一次

</script>
	
	</head>
	<body  style="background-color: rgb(220,220,220)">
<div id="container" style="min-width:700px;height:400px"></div>
 
	</body>
</html>
