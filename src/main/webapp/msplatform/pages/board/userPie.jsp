<%@page import="com.sinosoft.msplatform.util.Constant"%>
<%@ page import="java.util.List"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setAttribute("ctx",request.getContextPath());
	request.setAttribute("status0",(String)Constant.HESUNSTATUSMAP.get("0"));
	request.setAttribute("status1",(String)Constant.HESUNSTATUSMAP.get("1"));
	request.setAttribute("status2",(String)Constant.HESUNSTATUSMAP.get("2"));
	request.setAttribute("status3",(String)Constant.HESUNSTATUSMAP.get("3"));
	request.setAttribute("status4",(String)Constant.LISUANSTATUSMAP.get("0"));
	request.setAttribute("status5",(String)Constant.LISUANSTATUSMAP.get("1"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "xhtml11.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible"
	content="IE=10;IE=9; IE=8; IE=7; IE=EDGE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>人员看板</title>
<link rel="stylesheet" href="${ctx}/msplatform/css/common/common.css" type="text/css" />
<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/msplatform/js/common/highcharts.js"
	type="text/javascript"></script>
<style type="text/css">
body {
	font-family: 'Lato', 'Arial', sans-serif;
	background: #ddd;
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
$(function () {
	//得到数据
	var data0,data1,data2,data3,data4,data5;
	var countURL = "";
	countURL ="${ctx}/board/board_userCount";
	$.ajax({
         type: "POST",
         url:countURL,
         cache:false,
         async: false,
         success:function(datas) {
        	datas = $.parseJSON(datas);
         	data0 = datas[0];//离线
         	data1 = datas[1];//空闲FreeNum
         	data2 = datas[2];//繁忙OfflineNum
         	data3 = datas[3];//离开
         	
         	
         	data4 = datas[4];//离线
         	data5 = datas[5];//在线
         }
    });
	
	
    $('#container2').highcharts({
            chart: {  
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false, 
 			events: {
					load: function(event) {
					var seriesList= this.series;
					if(seriesList.length > 0)
					{
						this.setTitle({text: "<a href='#'  onclick='damagecount()' style='color:#0079FF ;text-decoration:underline '>核损员</a>",useHTML:true }); 
					}
				}
				} 
            },  
        title: {
            text: '核损员'
        },
        tooltip: {
    	       formatter: function () {  
                            return '<b>' + this.point.name + '</b>: ' + Highcharts.numberFormat(this.y, 0, ',')+'人';
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
        series: [{
            type: 'pie',
            name: '占比例',
            data: [
                ['${status0}',data0],
                ['${status1}',data1],
                {
                    name: '${status2}',
                    y:data2,
                    sliced: true,
                    selected: true
                },
                ['${status3}',data3],
            ]
        }]
    });
    $('#container3').highcharts({
            chart: {  
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,  
	             events: {
				load: function(event) {
				var seriesList= this.series;
					if(seriesList.length > 0)
					{
						this.setTitle({text: "<a href='#' onclick='calculation()' style='color:#0079FF ;text-decoration:underline' >理算员</a>",useHTML:true }); 
					}
				}
				} 
            }, 
        title: {
            text: '理算员'
        },
        tooltip: {
    	    formatter: function () {  
                            return '<b>' + this.point.name + '</b>: ' + Highcharts.numberFormat(this.y, 0, ',')+'人';
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

        series: [{
            type: 'pie',
            name: '占比例',
            data: [
                ['${status4}', data4],
                {
                    name: '${status5}',
                    y:data5,
                    sliced: true,
                    selected: true
                },
            ]
        }]
    });
});
//核损员折线图
function damagecount(){
	window.open("${ctx}/board/board_damageLineCount");
}
//理算员折线图
function calculation(){
	window.open("${ctx}/board/board_calcuLineCount");
	
}


/** * Grid theme for Highcharts JS * @author Torstein Honsi */ 
Highcharts.theme = { 
		colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'], 
		chart: {
			 backgroundColor: { 
			 linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 }, 
			 stops: [ [0, 'rgb(255, 255, 255)'],
			  [1, 'rgb(240, 240, 255)'] ] 
			  }, 
			  borderWidth: 2, 
			  plotBackgroundColor: 'rgba(255, 255, 255, .9)', 
			  plotShadow: true, plotBorderWidth: 1 
		  }, 
  		title: { 
  			    style: { color: '#3E576F', 
  			                 font: ' bold 16px "microsoft yahei",Tahoma, Geneva, sans-serif'
  			     } 
		  },
		subtitle: { style: { color: '#50B432', font: 'bold 12px "microsoft yahei",Tahoma, Geneva, sans-serif' } },
		xAxis: { 
			 gridLineWidth: 1, 
			 lineColor: '#000',
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
         legend: { 
		         itemStyle: { 
			         font: '9pt "microsoft yahei",Tahoma, Geneva, sans-serif', 
			         color: 'black' 
		         },
		          itemHoverStyle: { 
		          		color: '#039' 
		          }, 
	          	itemHiddenStyle: {
	           		color: 'gray' } 
	          },
         labels: { 
            	style: { color: '#99b' } 
	          }, 
         navigation: { 
	            buttonOptions: { 
	            theme: { stroke: '#CCCCCC' } } 
	          } 
	     }; 
// Apply the theme 
var highchartsOptions = Highcharts.setOptions(Highcharts.theme);
</script>

</head>


<body>
<FORM id="myform" name="myform" METHOD=POST
	ACTION="<%=request.getContextPath()%>/casestatus.do?method=groupcount">
<input type="hidden" value="${type}" id="type" name="type" />
</FORM>
<h1 id="companyName" style="text-align: center;font-size:20px" >${companyName }</h1>
<div id="container2" style="float: left; width: 48%; height: 400px;"></div>
<div id="container3" style="float: left; width: 48%; height: 400px; margin-left: 4%"></div>
</body>
</html>
