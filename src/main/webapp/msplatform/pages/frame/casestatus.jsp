<%@ page language="java" import="com.handkoo.framework.entity.user.*,java.util.*,com.handkoo.framework.entity.user.User,com.handkoo.framework.utils.*,org.apache.commons.lang.StringUtils" pageEncoding="UTF-8"%>


<%
String userId = (String)session.getAttribute("userId");		
	String group_tIdd = (String) session.getAttribute("group_id");
		if (StringUtils.isBlank(group_tIdd)) {
			group_tIdd = (String)GetCookie.getcookie(request, "group_id");
		}
			String group_tparent = (String) session.getAttribute("grouptype_parent");
		if (StringUtils.isBlank(group_tparent)) {
			group_tparent = (String)GetCookie.getcookie(request, "grouptype_parent");
		}
		String CompanyId = (String) session.getAttribute("CompanyId");
		if (StringUtils.isBlank(CompanyId)) {
			CompanyId = (String)GetCookie.getcookie(request, "CompanyId");
		}
		
%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
		function init() {
		 var guid = rnd();
         //记住给个随机数，不然的话有缓存
		var url = "<%=request.getContextPath()%>/checkNumber.do?command=userCheck&userId=<%=userId%>&companyId=<%=CompanyId%>&group_id=<%=group_tIdd%>&grouptype_parent=<%=group_tparent%>&id="+guid;
		$.ajax({
		    type: "POST",				
		    url: url,
		    async: false,
		    data: "time="+new Date().getTime(),
		    success:function(data){
		    	if(data=="")
			{
				var total="案件请求数:&nbsp;<span style='color:#FF0000'>0</span></br>在线数:&nbsp;<span style='color:#FF0000'>0</span>&nbsp;空闲数:&nbsp;<span style='color:#FF0000'>0</span>&nbsp;暂离数:&nbsp;<span style='color:#FF0000'>0</span>";
			}else{
		    	var count= data.split("#");
		    	var aquery=count[1];
		    	var afree=count[3];
		    	if(count[1]=='null')
		    	{
		    	count[1]=0;
		    	}
		    	if(count[2]=='null')
		    	{
		    	count[2]=0;
		    	}
		    	if(count[3]=='null'){
		    	count[3]=0;
		    	}
				var total="案件请求数:&nbsp;<span style='color:#FF0000'>"+count[1]+"</span></br>在线数:&nbsp;<span style='color:#FF0000'>"+count[2]+"</span>&nbsp;空闲数:&nbsp;<span style='color:#FF0000'>"+count[3]+"</span>&nbsp;暂离数:&nbsp;<span style='color:#FF0000'>"+count[4]+"</span>";
			}
		    if(parseInt(aquery)>parseInt(afree))
			{
				total +="<div align=\"center\"  style='color:#FF0000;cursor:hand;font-size:12px;'>调度请求繁忙，请添加核损员!</div>";
			}
			$('#count').html(total);
		    	}							   
		});
		setTimeout("init()",5000);
		
		//创建随机数

        rnd.today = new Date();

        rnd.seed = rnd.today.getTime();

        function rnd() {

            rnd.seed = (rnd.seed * 9301 + 49297) % 233280;

            return rnd.seed / (233280.0);

        }

        function rand(number) {

            return Math.ceil(rnd() * number);

        }

		
	}		
</script>
<style>
.test{text-align:center;width:300px;
	    padding:0px;height:25px;line-height:14px;border:solid 0px #666161;position:absolute;}
#count{font-size:12px;};	    
</style>
<body onload="init()" bgcolor="transparent">
<div id="count" onselectstart="return false;" class="test"></div>
</body>
