<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/msplatform/pages/common/meta.jsp"%>
<%@ include file="/msplatform/pages/common/taglibs.jsp"%>
<html>
  <head>
    
    <title>添加重派说明</title>
    <script src="${ctx}/msplatform/js/common/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/msplatform/js/video/addCanelExplain.js" ></script>
    <style type="text/css">
		table {
			font:12px "microsoft yahei",Tahoma, Geneva, sans-serif; font-weight:normal;
		}
</style>
  </head>
  
  <body>
  	<input type="hidden" id="devideNo" name="devideNo" value=""/>
  
    <table width="420" height="208" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#f3f3f3" valign="top"  align="center" style="padding-top:20;"><table width="400" height="90" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" class="ListFont" height="30">&nbsp;添加重派说明:</td>
      </tr>
       <tr>
       <td class="ListFont" width="80" align="center">案件号&nbsp;&nbsp; 
		</td>
        <td class="ListFont" height="42">&nbsp;<input name="caseNum" id="caseNum" style="FONT-SIZE: 14px; COLOR: #666161;WIDTH: 253px;height:20px;" value="" maxlength="32" disabled="disabled">
        </td>
      </tr>
      <tr>
       <td class="ListFont" width="80" align="center">重派说明<br>(50个字符)</td>
        <td class="ListFont">&nbsp;<textarea name="recontent" id="recontent" cols = "29" rows = "3" ></textarea>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="118" height="40" bgcolor="#dadada" align="right"><table width="380" height="40" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td width="118"><table width="118" height="40" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td  width="57" style="cursor:hand;background-repeat:no-repeat;background-position:center;padding-top:2" background="${ctx}/msplatform/images/common/button.gif" onClick="ok()" align="center" class="ListFont" id="SetPreset">确定</td>
        <td width="4">&nbsp;</td>
        <td  width="57" style="cursor:hand;background-repeat:no-repeat;background-position:center;padding-top:2" background="${ctx}/msplatform/images/common/button.gif" onClick="Cancel()" align="center" class="ListFont" id="SetPreset">取消</td>
      </tr>
    </table></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
