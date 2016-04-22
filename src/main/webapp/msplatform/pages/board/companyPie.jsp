<%@page import="java.net.URLDecoder"%>
<%@page import="com.sinosoft.msplatform.util.Constant"%>
<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%
	String companyName = (String)session.getAttribute("companyName");
	String linetoPieCom = (String)request.getParameter("linetoPieCom");
	if(linetoPieCom != null && !"".equals(linetoPieCom)){
		linetoPieCom = URLDecoder.decode(linetoPieCom,"UTF-8");
		request.setAttribute("linetoPieCom",linetoPieCom);
		companyName = linetoPieCom;
	}
	request.setAttribute("companyName",companyName);
	request.setAttribute("ctx",request.getContextPath());
	request.setAttribute("status0",(String)Constant.CASESTATUSMAP.get("0"));
	request.setAttribute("status1",(String)Constant.CASESTATUSMAP.get("1"));
	request.setAttribute("status2",(String)Constant.CASESTATUSMAP.get("2"));
	request.setAttribute("status3",(String)Constant.CASESTATUSMAP.get("3"));
	request.setAttribute("status4",(String)Constant.CASESTATUSMAP.get("4"));
	request.setAttribute("status5",(String)Constant.CASESTATUSMAP.get("5"));
	request.setAttribute("status6",(String)Constant.CASESTATUSMAP.get("6"));
	request.setAttribute("status8",(String)Constant.CASESTATUSMAP.get("8"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "xhtml11.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible"
	content="IE=10;IE=9; IE=8; IE=7; IE=EDGE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>案件看板</title>
<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/highcharts.js"
	type="text/javascript"></script>
<script type="text/javascript">
Highcharts.theme = {
	//图表序列（Series）的默认颜色数组
	colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],
	//图表区和图形区的参数及一般图表通用参数
	chart: {
		//背景颜色
		backgroundColor: {
			linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
			stops: [
				[0, 'rgb(255, 255, 255)'],
				[1, 'rgb(240, 240, 255)']
			]
		},
		//图表边框宽度
		borderWidth: 2,
		//绘制图形区域的背景颜色
		plotBackgroundColor: 'rgba(255, 255, 255, .9)',
        //绘图区投影
		plotShadow: true,
		//绘制图形区域边框宽度
		plotBorderWidth: 1
	},
	//标题
	title: {
		style: {
			color: '#000',
			font: 'bold 16px "microsoft yahei",Tahoma, Geneva, sans-serif'
		}
	},
	subtitle: {
		style: {
			color: '#666666',
			font: 'bold 12px "microsoft yahei",Tahoma, Geneva, sans-serif'
		}
	},
	xAxis: {
		//网格线的宽度
		gridLineWidth: 1,
		//轴线的颜色
		lineColor: '#000',
		//刻度线的颜色
		tickColor: '#000',
		labels: {
			style: {
				color: '#000',
				font: '11px "microsoft yahei",Tahoma, Geneva, sans-serif'
			}
		},
		title: {
			style: {
				color: '#333',
				fontWeight: 'bold',
				fontSize: '12px',
				fontFamily: '"microsoft yahei",Tahoma, Geneva, sans-serif'

			}
		}
	},
	yAxis: {
		minorTickInterval: 'auto',
		lineColor: '#000',
		lineWidth: 1,
		tickWidth: 1,
		tickColor: '#000',
		labels: {
			style: {
				color: '#000',
				font: '11px "microsoft yahei",Tahoma, Geneva, sans-serif'
			}
		},
		title: {
			style: {
				color: '#333',
				fontWeight: 'bold',
				fontSize: '12px',
				fontFamily: '"microsoft yahei",Tahoma, Geneva, sans-serif'
			}
		}
	},
	//图例说明
	legend: {
		//每个图例项的样式
		itemStyle: {
			font: '9pt "microsoft yahei",Tahoma, Geneva, sans-serif',
			color: 'black'

		},
		//图例悬浮时的样式
		itemHoverStyle: {
			color: '#039'
		},
		//当点击图例进行隐藏
		itemHiddenStyle: {
			color: 'gray'
		}
	},
	//可以放置在图表中任意位置的Html标签
	labels: {
		style: {
			color: '#99b'
		}
	},
	//出现在输出模块的一组选择按钮和菜单
	navigation: {
		buttonOptions: {
			theme: {
				stroke: '#CCCCCC'
			}
		}
	}
};
//Apply the theme
var highchartsOptions = Highcharts.setOptions(Highcharts.theme);

//获取数据,放入container
$(document).ready(function ()  {
	var data00,data01,data02,data03,data04,data05,data06,data10,data11,data12,data13,data14,data15,data16;
	var countURL = "";
	var linetoPieCom = '${linetoPieCom}';
	countURL =encodeURI(encodeURI('${ctx}/board/board_caseInfoCount?linetoPieCom='+ linetoPieCom));
	$.ajax({
         type: "POST",
         url:countURL,
         cache:false,
         async: false,
         success:function(datas) {
        	datas = $.parseJSON(datas);
        	data00 = Number(datas.zizhu0);
        	data01 = Number(datas.zizhu1);
         	data02 = Number(datas.zizhu2);
         	data03 = Number(datas.zizhu3);
         	data04 = Number(datas.zizhu4);
         	data05 = Number(datas.zizhu5);
         	data06 = Number(datas.zizhu6);
         	data08 = Number(datas.zizhu8);
         	data10 = Number(datas.chakan0);
         	data11 = Number(datas.chakan1);
         	data12 = Number(datas.chakan2);
         	data13 = Number(datas.chakan3);
         	data14 = Number(datas.chakan4);
         	data15 = Number(datas.chakan5);
         	data16 = Number(datas.chakan6);
         	data18 = Number(datas.chakan8);
         }
    });
   
/*自助*///放入container
$(function () {
    $('#container1').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: '自助案件'
            
        },
         tooltip: {
         formatter: function() {
            return '<b>'+ this.point.name +'</b>:  '+
                         Highcharts.numberFormat(this.y, 0, ',') +' 个';
         }
      },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    formatter: function () {  
                            return '<b>' + this.point.name + '</b>: ' + Highcharts.numberFormat(this.y, 0, ',');
                        }  
                },
                  showInLegend: true
            }
        },
      //数据显示
        series: [{
            type: 'pie',
            name: '案件数',
            data: [
            	{
                    name: '${status0}',
                    y: data00,
                    sliced: true,
                    selected: true
                },
                ['${status1}',data01],
                ['${status2}',data02],
                ['${status3}',data03],
                ['${status4}',data04],
                ['${status5}',data05],
                ['${status6}',data06],
                ['${status8}',data08]
            ]
        }]
    });
});	
/*查勘*///放入container			
$(function () {
    $('#container2').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: '查勘案件'
        },
       tooltip: {
         formatter: function() {
            return '<b>'+ this.point.name +'</b>:  '+
                         Highcharts.numberFormat(this.y, 0, ',') +' 个';
         }
      },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    formatter: function () {  
                            return '<b>' + this.point.name + '</b>: ' + Highcharts.numberFormat(this.y, 0, ',');
                        }  
                },
                  showInLegend: true
            }
        },
      //数据显示
        series: [{
            type: 'pie',
            name: '案件数',
            data: [
            	{
                    name: '${status0}',
                    y: data10,
                    sliced: true,
                    selected: true
                },
                ['${status1}',data11],
                ['${status2}',data12],
                ['${status3}',data13],
                ['${status4}',data14],
                ['${status5}',data15],
                ['${status6}', data16],
                ['${status8}', data18]
            ]
        }]
    });
});				

});

function myrefresh(){
	window.location.reload();
}

setTimeout('myrefresh()', 120000); //2分钟刷新一次

function checkMsg()
{
	window.open("${ctx}/board/board_caseLineCount");
}
function checkMsg2()
{
	window.open("${ctx}/board/board_queryCaseInfo");
}

</script>

</head>
<body style="background-color: rgb(220, 220, 220)">
<h1 id="companyName" style="text-align: center;font-size:20px" >${companyName }</h1>
<c:if test="${linetoPieCom == null }">
	<table width="100%" border="0" align="center">
		<tr align="center" >
			<td class="td2"   style="width:100%; text-align:center " ><input type="button"
								onclick="checkMsg2()" value="详情" class="cx"/>
						<input type="button"
								onclick="checkMsg()" value="折线图" class="cx"/>		
			</td>
		</tr>
	</table>
</c:if>

<div id="container1" style="float: left; width: 48%; height: 400px;"></div>
<div id="container2" style="float: left; width: 48%; height: 400px; margin-left: 4%"></div>

</body>
</html>
