<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>山善后台管理系统</title>
<link rel="shortcut icon" href="/shanshan/pc/images/favicon.ico" />
<link href="/shanshan/pc/css/css.css" type="text/css" rel="stylesheet" />
</head>
<!--框架样式-->
<frameset rows="95,*,30" cols="*" frameborder="no" border="0" framespacing="0">
<!--top样式-->
	<frame src="/shanshan/pc/model/top.jsp" name="topframe" scrolling="no" noresize id="topframe" title="topframe" />
<!--contact样式-->
	<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="194,12,*" rows="*">
		<frame scrolling="auto" noresize="" frameborder="no" name="leftFrame" src="/shanshan/pc/model/left.jsp"></frame>
		<frame id="leftbar" scrolling="no" noresize="" name="switchFrame" src="/shanshan/pc/model/swich.jsp"></frame>
		<frame scrolling="auto" noresize="" border="0" name="mainFrame" src="/shanshan/pc/main/fujianmain.jsp"></frame>
	</frameset>
<!--bottom样式-->
	<frame src="/shanshan/pc/model/bottom.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset><noframes></noframes>
<!--不可以删除-->
</html>