<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setAttribute("ctx",request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "xhtml11.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible"
	content="IE=10;IE=9; IE=8; IE=7; IE=EDGE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>核损员状态详情</title>
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/highcharts.js"
	type="text/javascript"></script>
<style type="text/css">
body {
	font-family: "microsoft yahei",Tahoma, Geneva, sans-serif;
	background: #ddd;
	font-weight: 300;
	font-size: 15px;
	color: #333;
}
a {
    font-family: "microsoft yahei",Tahoma, Geneva, sans-serif;
	color: #555;
	text-decoration: none;
}
</style>
<script type="text/javascript">
$(function () {
$('#container').highcharts({
            chart: {  
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false, 
	 			events: {
					load: function(event) {
						var seriesList= this.series;
						if(seriesList.length > 0)
							{
								this.setTitle({text: "<a href='#' style=' cursor:hand;color:#0079FF ;text-decoration:underline' onclick='query()'   >核损员状态详情</a>",useHTML:true });
							}
					}
				} 
            }, 
            title: {
                text: '核损员状态详情',
                x: -20 //center
            },
            xAxis: {
                categories: [${result}],
                labels: {
                    rotation: -37
                }
            },
            yAxis: {
            	min: 0,
                title: {
                    text: '人数(/人)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '人'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
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
            }]
        });
    });
    
function query(){
    window.open("${ctx}/board/board_countCaseList?linetype=1");
}

function myrefresh(){			
	window.location.reload();
}
setTimeout('myrefresh()', 120000);//30秒刷新一次
</script>
</head>
  
<body>
	<div id="container" style="min-width: 310px; height: 500px; margin: 0 auto"></div>
</body>
</html>
