<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>底部bottom</title>
<base href="<%=basePath%>">
<link href="pc/css/css.css" type="text/css" rel="stylesheet" />
<style>
#footer{font-size:12px;}
.footer_pad{padding:7px 9px 5px 9px;}
</style>
</head>
<body style="overflow-x:hidden; background:url(pc/images/main/bottombg.jpg) repeat-x top left;" onselectstart="return false" oncontextmenu=return(false) >
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="footer">
  <tr>
    <td align="left" valign="middle" class="footer_pad">data：2017/10/1    山善：<a href="http://www.mycodes.net/" target="_blank">山善微信公众号</a> </td>
    <td align="right" valign="middle" class="footer_pad"><img src="pc/images/main/why.gif" width="12" height="12" alt="疑问图标" align="absmiddle">&nbsp;&nbsp;如有疑问请您联系TEL：666666666666</td>
  </tr>
</table>
</body>
</html>