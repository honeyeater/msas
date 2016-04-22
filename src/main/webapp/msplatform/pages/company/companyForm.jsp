<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<html>
<head>
	<title>公司管理</title>
	<link rel="stylesheet" href="${ctx}/msplatform/css/common/common2.css" type="text/css" />
	<script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/msplatform/js/common/jquery.form.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/company/companyForm.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/map.js"></script>
	<script type="text/javascript" src="${ctx}/msplatform/js/common/formCheck.js"></script>
</head>

<body>
	<form id="companyForm" action="${ctx}/company/company_save" method="post">
		<table class="table">
			<input type="hidden" id="company_province" name="company_province" value="${company.province }" />
			<input type="hidden" id="company_city" name="company_city" value="${company.city }" />
			<input type="hidden" name="treeNodeId" id="treeNodeId" value="${treeNodeId}"/>
			<input type="hidden" name="treeNodeName" id="treeNodeName" value="${treeNodeName}"/>
			<input type="hidden" name="treeFlag" id="treeFlag" value="${treeFlag}"/>
			<input type="hidden" name="company.uuid" id="company_uuid" value="${company.uuid}"/>
			<input type="hidden" name="addFlag" id="addFlag" value="${addFlag}"/>
			<c:if test="${addFlag!='1' }">
			<input type="hidden" name="videoComCode" id="videoComCode" value="${company.companyCode}"/>
			</c:if>
			<tr class="td1">
				<td>&nbsp;<span>公司信息管理</span>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table1" id="info_base2">
						<tr class="tr_color">
							<td width="120px" class="td_name">公司名称:</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="company.name" id="company_name" onKeyDown="CheckKeyDown()"
								onblur="checkField(this)" checkKey="MAP_C0001,MAP_C0002,MAP_C0016,MAP_C0018" description="公司名称" class="TextLength" value="${company.name }" />&nbsp;&nbsp;
								<div id="company_nameError" name="company_nameError"
									style="display:inline">
									<font color='blue'>*</font>
								</div></td>
						</tr>

						<tr class="tr_color">
							<td class="td_name">公司代码:</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="company.companyCode" id="companyno"
								onKeyDown="CheckKeyDown()" onblur="checkField(this)" description="公司代码" checkKey="MAP_C0001,MAP_C0003"
								class="TextLength" value="${company.companyCode}" />&nbsp;&nbsp;
								<div id="companynoError" name="companynoError"
									style="display:inline">
									<font color='blue'>*</font>
								</div>
							</td>
						</tr>
						
						
							<tr class="tr_color"  >
								<td class="td_name">保险公司代码:</td>
								<td class="td_input">&nbsp;&nbsp; <input type="text"
									name="vcid" id="vcid"
									onKeyDown="CheckKeyDown()" onblur="checkField(this)" description="保险公司代码"  checkKey="MAP_C0001"
									class="TextLength" value="${vcid}" />&nbsp;&nbsp;
									<div id="vcidError" name="vcidError"
										style="display:inline">
										<font color='blue'>*</font>
									</div>
								</td>
							</tr>
					
							<tr class="tr_color">
								<td class="td_name">技能ID:</td>
								<td class="td_input">&nbsp;&nbsp; <input type="text"
									name="skillID" id="skillID"
									onKeyDown="CheckKeyDown()" onblur="checkField(this)" description="技能ID" checkKey="MAP_C0001"
									class="TextLength" value="${skillID}" />&nbsp;&nbsp;
									<div id="skillIDError" name="skillIDError"
										style="display:inline">
										<font color='blue'>*</font>
									</div>
								</td>
							</tr>

						<tr class="tr_color">
							<td class="td_name">所在省:</td>
							<td class="td_input">&nbsp;&nbsp; <select
								name="company.province" class="TextLength" id="province"
								onblur="checkField(this)" style="width:155px" onChange="changeCity()" checkKey="MAP_C0001" description="所在省">
									<option value="">请选择省</option>
									<option value="北京">北京</option>
									<option value="上海">上海</option>
									<option value="天津">天津</option>
									<option value="重庆">重庆</option>
									<option value="河北">河北</option>
									<option value="山西">山西</option>
									<option value="内蒙古">内蒙古</option>
									<option value="辽宁">辽宁</option>
									<option value="吉林">吉林</option>
									<option value="黑龙江">黑龙江</option>
									<option value="江苏">江苏</option>
									<option value="浙江">浙江</option>
									<option value="安徽">安徽</option>
									<option value="福建">福建</option>
									<option value="江西">江西</option>
									<option value="山东">山东</option>
									<option value="河南">河南</option>
									<option value="湖北">湖北</option>
									<option value="湖南">湖南</option>
									<option value="广东">广东</option>
									<option value="广西">广西</option>
									<option value="海南">海南</option>
									<option value="四川">四川</option>
									<option value="贵州">贵州</option>
									<option value="云南">云南</option>
									<option value="西藏">西藏</option>
									<option value="陕西">陕西</option>
									<option value="甘肃">甘肃</option>
									<option value="青海">青海</option>
									<option value="宁夏">宁夏</option>
									<option value="新疆">新疆</option>
									<option value="港澳台">港澳台</option>
							</select>&nbsp;&nbsp;
							<select
								name="company.city" class="TextLength" id="city"
								onblur="check(this)" style="width:155px">
									<option value="">请选择城市</option>
							</select>&nbsp;&nbsp;
								<div id="provinceError" name="provinceError" style="display:inline">
									<font color='blue'>*</font>
								</div></td>
						</tr>

						<tr class="tr_color">
							<td class="td_name">详细地址:</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								size="60" name="company.address" id="address"
								onKeyDown="CheckKeyDown()" 
								class="TextLength" value="${company.address }" />&nbsp;&nbsp;
								<div id="addressError" name="addressError"
									style="display:inline">
									<font color='blue'></font>
								</div>
							</td>
						</tr>


						<tr class="tr_color">
							<td class="td_name">手机/座机号码:</td>
							<td class="td_input">&nbsp;&nbsp; <input type="text"
								name="company.mobile" id="mobile" onKeyDown="CheckKeyDown()"
								 class="TextLength" onblur="checkField(this)"
								description="手机/座机号码" checkKey="MAP_C0013"
								value="${company.mobile }" />&nbsp;&nbsp;
								<div id="mobileError" name="mobileError" style="display:inline">
									<font color='blue'></font>
								</div>
							</td>
						</tr>
					</table></td>
			</tr>
			<tr align="center">
				<td><img src="${ctx}/msplatform/images/common/save.gif"
					onclick="send();" class="img_button" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
					src="${ctx}/msplatform/images/common/back.gif"
					onclick="history.back()" class="img_button" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
