<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>

<head>
<link href="${ctx}/msplatform/css/frame.css" rel="stylesheet" type="text/css" />
	<style>
			.funcbutton{
				margin-left: 5px; 
				margin-bottom: 10px;
				padding-top: 3px;
				cursor: pointer;
			}
			#stop_all{
				margin-top: 3px;
				margin-left: 12px;
				width: 29px;
				height: 28px;
				cursor: pointer;
			}
			#webtakepic{
				margin-top: 3px;
				width: 29px;
				height: 28px;
				cursor: pointer;
			}
			#hesun{
				margin-left: 10px; 
				margin-bottom: 10px;
				padding-top: 3px;
				cursor: pointer;
			}
			#Sound{
				margin-top: -33px;
				width: 29px;
				height: 28px;
			}
			.imageSlider { margin:0;padding:0; height:20px; width:100px; background-image:url("../../images/video/scrollbg.gif"); }
			.imageBar    { margin:0;padding:0; height:17px; width:10px; background-image:url("../../images/video/scrfloat.gif"); }
		</style>
		<script src="${ctx}/msplatform/js/video/slider_extras.js" type="text/javascript"></script>
		<script type="text/javascript">
			var AINF = parent.topFrame.AINF;//获取控件
			var fileName = "";
			function initmiddle(){
				
				//设置视频模式
				setVideoMode();
				// 设置视频窗口句柄
				initalVideo();
				initViewHW();
			}
			function setVideoMode(){
				//  设置自己内嵌子窗口
				$("#selfView")[0].DisplayMode = 0;  	
				$("#selfView")[0].VideoWndCount = 1;
			    // 设置对方内嵌子窗口
				$("#destView")[0].DisplayMode = 0; 
				$("#destView")[0].VideoWndCount = 1;
			}
			function initalVideo(){
				// 设置视频句柄
				var selfVideoHwnd,destVideoHwnd;
				try{			
					$("#destView")[0].DisplayMode = 0;
					// 自己视频句柄
				    selfVideoHwnd =  $("#selfView")[0].GetVIDWndHandle(0);
					// 对方视频句柄
				    destVideoHwnd = $("#destView")[0].GetVIDWndHandle(0);
					if(AINF.SetVideoWindowEx(selfVideoHwnd,destVideoHwnd) != 0){
						alert("设置视频句柄失败!");
					}
				}catch(e){ 					
					alert("设置视频句柄异常!" +  e.message + "'****" + e.stack  + "*****" + e.toLocaleString());
				}	
			}
			//控制闪光灯
			function  clickFlash(obj){
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  }
			  var status = "";
			  if($(obj).is(".ra4_bg")){
				  status = "off";
			  } else {
				  status = "on";
			  }
			  var msg = "flash:" +  status;
			  AINF.SndMsgToSipUsr(userPhone,msg,"","");
			}
			
			// 拍照功能
			function clickCapture()
			{
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  var vcid = parent.topFrame.document.getElementById("vcid").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();	
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  }   
			  var caseNo = "";
			  if(parent.main1.handle){
				  caseNo = parent.main1.handle.receive_caseNo;
			  }
			  var _fileName = "z"+formatDate(new Date(),"yyyyMMddhhmmssS") + MathRand() + ".jpg";	
			  //var msg = "screenshot:" + _fileName;
			  var msg = "screenshot:" + vcid + "," + formatDate(new Date(),"yyyyMMdd")  +","+ _fileName;
			  AINF.SndMsgToSipUsr(userPhone,msg,"","");
			  fileName = _fileName;
			}
			
			function MathRand() 
			{ 
					var Num=""; 
					for(var i=0;i<6;i++) 
					{ 
								Num+=Math.floor(Math.random()*10); 
					}
					return Num;
			}
			
			/**
			 * 日期格式化
			 * @param format
			 * @returns
			 */
			function formatDate(date,format)
			{
			    var o =
			    {
			        "M+" : date.getMonth() + 1, // month
			        "d+" : date.getDate(), // day
			        "h+" : date.getHours(), // hour
			        "m+" : date.getMinutes(), // minute
			        "s+" : date.getSeconds(), // second
			        "q+" : Math.floor((date.getMonth() + 3) / 3), // quarter
			        "S" : date.getMilliseconds()
			    };
			    if (/(y+)/.test(format))
			        format = format.replace(RegExp.$1, (date.getFullYear() + "")
			                .substr(4 - RegExp.$1.length));
			    for ( var k in o)
			        if (new RegExp("(" + k + ")").test(format))
			            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
			                    : ("00" + o[k]).substr(("" + o[k]).length));
			    return format;
			};
			
			// 指定区域
			function  clickArea()
			{
				$(".Btu>li>a.ra5").addClass("ra5_bg");
			    $("#destView")[0].ScreenCapture();
			}
			
			// 收到指定区域事件
			function OncreenCaptured(result,cx,cy,width,height){
			  if(result == 0){
			     addMessages("指定区域操作失败！");
				 return;
			  }
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();	
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  }
			  
			  var msg = "rectdisplay:" + cx + "," + cy + "," + width + "," + height; 
			  AINF.SndMsgToSipUsr(userPhone,msg,"","");      
			  $(".Btu>li>a.ra5").removeClass("ra5_bg");
			}
			
			//控制方向
			function  clickArrowUp(){
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();	
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  }
			  var msg = "arrow:0";   
			  AINF.SndMsgToSipUsr(userPhone,msg,"","");
			}


			function  clickArrowDown(){
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();	
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  }
			  var msg = "arrow:180"; 
			  AINF.SndMsgToSipUsr(userPhone,msg,"","");	
			}

			function  clickArrowLeft(){
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();	
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  }
			  var msg = "arrow:270"; 
			  AINF.SndMsgToSipUsr(userPhone,msg,"","");	
			}

			function  clickArrowRight(){
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();	
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  }
			  var msg = "arrow:90"; 
			  AINF.SndMsgToSipUsr(userPhone,msg,"","");	
			}
			
			/**
			* 打开字幕窗口
			*/
			function clickSdSubtitle()
			{
				var url = "sendSubtitles.jsp";
				window.showModalDialog(url,window,"dialogHeight:400px; dialogWidth:400px;");
				//popupWin("sendSubtitles.jsp",200,250);
			}

			/**
			* 打开窗口
			*/
			function popupWin(url, width, height, winname, left, top){
				  if(width == '' || width == null){
				  	  width = screen.width;
				  }
				  if(height == '' || height == null){
				  		height = screen.height;
				  }
				  var _top = (top == '' || top == null) ? (screen.height - height) / 2 : top;
				  var _left = (left == '' || left == null) ? (screen.width - width)/2:left;
				  var _winname = (winname == undefined || winname == null || winname == '') ? '_blank' : winname;
				  window.open(url, _winname, 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=' 
				    		  + width + ',height=' + height + ',left=' + _left + ', top=' + _top + ',screenX=' + left + ',screenY=' + top + '');
				 
			}
			
			// 发送字幕
			function sendSubtitles(msg)
			{  
			  var userPhone;
			  var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			  if(callType == 'callin'){
			     userPhone =  AINF.GetCallingNo();	
			  }else{ 
			     userPhone =  $.trim($("#callee").val());
			  } 
			  var _msg = "textdisplay:" + msg;  
			  return AINF.SndMsgToSipUsr(userPhone,_msg,"","");
			}
			
			// 视频静音
			function clickMute(obj){
			     var callid = AINF.GetCallID(0);
				 var userPhone;
				 var callType = parent.topFrame.document.getElementById("callType").value;//获取呼叫类型
			     if(callType == 'callin'){
			       userPhone =  AINF.GetCallingNo();	
			     }else{ 
			        userPhone =  $.trim($("#callee").val());
			     }
			     var status;
				  if($(obj).is(".ra1_bg")){
					  status = 1;
				  } else {
					  status = 0;
				  }
			    AINF.SetUserMute(callid,userPhone,status);	
			}
			
			$(function(){
				$(".radio_btn>li>a.ra1").click();
				$(".Btu>li>a.ra1").click();
			});
		</script>
</head>
<body onload="initmiddle()">
	<input type="hidden" id="callee" name="callee" />
	<div position="center" title="视频" id="sliderDemo" style="background: #fff;">
		<div> 
			<object name="selfView"  width="1" height="1" id="selfView"   classid="clsid:62DBA0B4-7445-4d2e-99E3-EE150B0F07C0">
		</object>
		</div>
			<object name="destView" id="destView" width=875  
				style="background-color:#fff"
				classid="clsid:62DBA0B4-7445-4d2e-99E3-EE150B0F07C0">
			</object>
		<div style="background:#fff; margin-top:20px; position:relative;">
			<ul class="radio_btn">
				<li><a class="ra1" onclick="ArrangeWindow(1)" id="Window1" title="1画面"></a></li>
				<li><a class="ra2" onclick="ArrangeWindow(4)" id="Window4" title="4画面"></a></li>
				<li><a class="ra3" onclick="ArrangeWindow(9)" id="Window9" title="9画面"/></a></li>
				<li><a class="ra4" onclick="ArrangeWindow(16)" id="Window16" title="16画面"/></a></li>
				<li class="paddl" ><a class="ra5" onclick = "stop_all()" title="停止" style="width:30px; height:30px;"></a></li>
				<li class="paddl"><a class="ra6" title="音量"></a></li>
				<li style="margin-left:0px;"><div id="slider" style="height:40px; padding-top: 3px;"></div></li>
			</ul>
			<ul class="Btu">
				<li><a class="ra1" title="静音" onclick="clickMute(this)"></a></li>
				<li><a class="ra2" title="消息" onclick="clickSdSubtitle()"></a></li>
				<li><a class="ra3" title="拍照" onclick="clickCapture()"></a></li>
				<li><a class="ra4" title="闪光" onclick="clickFlash(this)"></a></li>
				<li class="paddl"><a class="ra5" title="指定区域" onclick="clickArea()"></a></li>
				<li class="paddl"><a class="ra6" title="切换"></a><div class="up_down" style="display:none;"><span class="left_bg" onclick="clickArrowLeft();"></span><span class="up_bg" onclick="clickArrowUp();"></span><span class="right_bg" onclick="clickArrowRight();"></span><span class="down_bg" onclick="clickArrowDown();"></span><span class="middle"></span></div></li>
			</ul>
			<div class="Volume" style="display:none"></div>
		</div>
		<script type="text/javascript">
			//控制按钮颜色2015-9-17
			$(".radio_btn>li>a.ra1").click(function(){				
				$(this).addClass("ra1_bg").parents().siblings().children("a").removeClass("ra3_bg ra4_bg ra5_bg ra2_bg");
			});
			$(".radio_btn>li>a.ra2").click(function(){				
				$(this).addClass("ra2_bg").parents().siblings().children("a").removeClass("ra3_bg ra4_bg ra5_bg ra1_bg");
			});
			$(".radio_btn>li>a.ra3").click(function(){			
				$(this).addClass("ra3_bg").parents().siblings().children("a").removeClass("ra2_bg ra4_bg ra5_bg ra1_bg");
			});
			$(".radio_btn>li>a.ra4").click(function(){			
				$(this).addClass("ra4_bg").parents().siblings().children("a").removeClass("ra3_bg ra2_bg ra5_bg ra1_bg");
			});
			$(".radio_btn>li>a.ra5").mouseover(function(){				
				$(this).addClass("ra5_bg");
			});
			$(".radio_btn>li>a.ra5").mouseout(function(){				
				$(this).removeClass("ra5_bg");
			});
			
			/* $(".radio_btn>li>a.ra6").click(function(){			
				$(this).toggleClass("ra6_bg");
				$(".Volume").toggle();
			}); */
			
			
			$(".Btu>li>a.ra1").click(function(){				
				$(this).toggleClass("ra1_bg");
			});
			$(".Btu>li>a.ra2").mouseover(function(){				
				$(this).addClass("ra2_bg");
			});
			$(".Btu>li>a.ra2").mouseout(function(){				
				$(this).removeClass("ra2_bg");
			});
			$(".Btu>li>a.ra3").mouseover(function(){			
				$(this).addClass("ra3_bg");
			});
			$(".Btu>li>a.ra3").mouseout(function(){			
				$(this).removeClass("ra3_bg");
			});
			$(".Btu>li>a.ra4").click(function(){			
				$(this).toggleClass("ra4_bg");
			});
			/* $(".Btu>li>a.ra5").click(function(){			
				$(this).toggleClass("ra5_bg");
			}); */
			//手机控制上下左右
			$(".Btu>li>a.ra6").click(function(){			
				$(this).hide().siblings(".up_down").show();		
			});
			$(".Btu>li>.up_down>.middle").click(function(){				
				$(this).parent(".up_down").hide().siblings(".ra6").show();		
			});		
			$(".up_down .left_bg").mouseenter(function(){
				$(this).removeClass("left_bg").addClass("left");
			});
			$(".up_down .right_bg").mouseenter(function(){
				$(this).removeClass("right_bg").addClass("right");
			});
			$(".up_down .up_bg").mouseenter(function(){
				$(this).removeClass("up_bg").addClass("up");
			});
			$(".up_down .down_bg").mouseenter(function(){
				$(this).removeClass("down_bg").addClass("down");
			});		
			$(".up_down .left_bg").mouseleave(function(){
				$(this).removeClass("left").addClass("left_bg");
			});
			$(".up_down .right_bg").mouseleave(function(){
				$(this).removeClass("right").addClass("right_bg");
			});
			$(".up_down .up_bg").mouseleave(function(){
				$(this).removeClass("up").addClass("up_bg");
			});
			$(".up_down .down_bg").mouseleave(function(){
				$(this).removeClass("down").addClass("down_bg");
			});
			
			var sliderImage1 = new neverModules.modules.slider(
	          {targetId: "slider",
	          sliderCss: "imageSlider",
	          barCss: "imageBar",
	          min: 1,
	          max: 100,
	          hints: "音量调节"
	          });
	          sliderImage1.onend = function () {
	        	//获取当前值方法：sliderImage.getValue()
	        	//调用失败，则连续再调用2次
	        	var oldVoiceLevel = AINF.GetVoiceGainParam(4,"");
	        	for(var k=0; k<3; k++){
	        		if(AINF.SetVoiceLevelParam(4,sliderImage1.getValue(),"")!=0){
	        			continue;
	        		} else {
	        			var curVoiceLevel = AINF.GetVoiceGainParam(4,"");
		        		if(oldVoiceLevel==curVoiceLevel){
		        			continue;
		        		} else {
		        			break;
		        		}
	        		}
	        	}
	          };
	          sliderImage1.create();
	          sliderImage1.setValue(sliderImage1.max/2);
			
			
			function change_bottom_buttons(arg) {
			}
			//抓拍
			var webtakepic = function(){
				uploadImage();
				
			};
	
			//重连
			var reconnect = function(){
				
			};
			
			//停止全部预览
			var stop_all = function(){
				var strstate = parent.topFrame.document.getElementById("state").value;//获取坐席状态码
				if(strstate!=''){
					var state = parseInt(strstate, 10);
					if (state >= 300 && state < 313){
						AINF.ReleaseCall(6);
					}
				}
			};
			
			//判断是否安装声卡
			var HasSoundCar =  function(){
				return 1;
			};
			
	     	//1,4,9,16 分屏
			function ArrangeWindow(x){
				var sendOCX  = document.getElementById("Mixwebctrl1");
			    try{
					sendOCX.changegridcount(x);
			    } catch (e) {
			    	("Mixwebctrl1控件未安装无法使用");
			    }
			    if(x==1){
				    document.getElementById("Window1").src="<%=request.getContextPath()%>/images/screensel1wnd.gif";
				    document.getElementById("Window4").src="<%=request.getContextPath()%>/images/screen4wnd.gif";
				    document.getElementById("Window9").src="<%=request.getContextPath()%>/images/screen9wnd.gif";
				    document.getElementById("Window16").src="<%=request.getContextPath()%>/images/screen16wnd.gif";
			    }
			    if(x==4){
				    document.getElementById("Window1").src="<%=request.getContextPath()%>/images/screen1wnd.gif";
				    document.getElementById("Window4").src="<%=request.getContextPath()%>/images/screensel4wnd.gif";
				    document.getElementById("Window9").src="<%=request.getContextPath()%>/images/screen9wnd.gif";
				    document.getElementById("Window16").src="<%=request.getContextPath()%>/images/screen16wnd.gif";					 
			    }
			    if(x==9){
				    document.getElementById("Window1").src="<%=request.getContextPath()%>/images/screen1wnd.gif";
				    document.getElementById("Window4").src="<%=request.getContextPath()%>/images/screen4wnd.gif";
				    document.getElementById("Window9").src="<%=request.getContextPath()%>/images/screensel9wnd.gif";
				    document.getElementById("Window16").src="<%=request.getContextPath()%>/images/screen16wnd.gif";					    
			    }
			    if(x==16){
				    document.getElementById("Window1").src="<%=request.getContextPath()%>/images/screen1wnd.gif";
				    document.getElementById("Window4").src="<%=request.getContextPath()%>/images/screen4wnd.gif";
				    document.getElementById("Window9").src="<%=request.getContextPath()%>/images/screen9wnd.gif";
				    document.getElementById("Window16").src="<%=request.getContextPath()%>/images/screensel16wnd.gif";					     
			    }
			}
	     	
	     	function initViewHW() {
	     		var frameHeight =  document.getElementById("sliderDemo").offsetHeight;
				var frameWidth =  document.getElementById("sliderDemo").offsetWidth;
				document.getElementById("destView").height = frameHeight-70;
				document.getElementById("destView").width = frameWidth;
			}
	     	
			//页面布局
			//$(function (){
				//var frameHeight =  document.getElementById("sliderDemo").offsetHeight;
				//var frameWidth =  document.getElementById("sliderDemo").offsetWidth;
				//document.getElementById("destView").height = frameHeight-70;
				//document.getElementById("destView").width = frameWidth;
			//});
		</script>
	</div>
</body>