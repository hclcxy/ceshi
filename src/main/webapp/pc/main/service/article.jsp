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
<title>主要内容区main</title>
<base href="<%=basePath%>">
<link href="pc/css/css.css" type="text/css" rel="stylesheet" />
<link href="pc/css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="pc/images/main/favicon.ico" />
<link rel="stylesheet" href="pc/css/adminstyle.css" type="text/css">
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(pc/images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(pc/images/main/add.jpg) no-repeat -3px 7px #548fc9; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(pc/images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9}
</style>
</head>
<body>
</head>

<body>
<!-- top -->
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
  <tr> 
    <td width="24%">位置： 
    </td>
    <td width="76%"><div align="center" class="emenubutton">
		  <span id="showaddclassnav"></span>         
           <input type="button" name="Submit" value="增加信息" onclick="self.location.href='pc/main/xinximain/articleAdd.jsp'">
		  &nbsp;          
        </div></td>
  </tr>
</table>
<!-- 搜索栏 -->
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
    <tr> 
      <td width="100%"> <div align="right">&nbsp;搜索： 
          <select name="showspecial" id="showspecial">
            <option value="0">不限属性</option>
            <option value="2">推荐</option>
            <option value="3">头条</option>
          </select>
          <input name="keyboard" type="text" id="keyboard" value="关键字">
          <select name="show">
            <option value="0">不限字段</option>
            <option value="1">标题</option>
            <option value="2">发布者</option>
			<option value="3">ID</option>
          </select>
		  <span id="searchclassnav"></span>
          <select name="myorder" id="myorder">
            <option value="1">按信息ID</option>
            <option value="2">按发布时间</option>
            <option value="3">按点击率</option>
            <option value="4">按下载数</option>
            <option value="5">按评论数</option>
          </select>
          <select name="orderby" id="orderby">
            <option value="0">降序排序</option>
            <option value="1">升序排序</option>
          </select>
          <select name="infolday" id="infolday">
            <option value="1">全部时间</option>
            <option value="86400">1 天</option>
            <option value="172800">2 天</option>
            <option value="604800">一周</option>
            <option value="2592000">1 个月</option>
            <option value="7948800">3 个月</option>
            <option value="15897600">6个月</option>
            <option value="31536000">1年</option>
          </select>
          <input type="submit" name="Submit2" value="搜索">
        </div></td>
    </tr>
</table>
<br>

<form name="listform" method="post" action="" onsubmit="return confirm('确认要执行此操作？');">
  <table width="100%" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td width="10%" height="25"><div align="center"><a href="pc/main/xinximain/article.jsp" title="已发布信息总数：">未过期(12) </a></div></td>
      <td width="10%"><div align="center"><a href="pc/main/xinximain/article.jsp">过期 (12)</a></div></td>
      <td width="10%">&nbsp;</td>
      <td width="58%">&nbsp; </td>
      <td width="6%">&nbsp;</td>
      <td width="6%">&nbsp;</td>
    </tr>
  </table>
  <!-- 文章列表 -->
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
    <tr class="header"> 
      <td height="25" colspan="8"></td>
    </tr>
    <tr> 
      <td width="3%"><div align="center"></div></td>
      <td width="6%" height="25"><div align="center">ID</div></td>
      <td width="36%" height="25"><div align="center">标题</div></td>
      <td width="12%" height="25"><div align="center">发布者</div></td>
      <td width="16%" height="25"> <div align="center">发布时间</div></td>
	  <td width="7%" height="25"><div align="center">阅读</div></td>
      <td width="14%" height="25"> <div align="center">编辑</div></td>
    </tr>
   
    <tr bgcolor="#FFFFFF" onmouseout="this.style.backgroundColor='#ffffff'" onmouseover="this.style.backgroundColor='#C3EFFF'"> 
      <td><div align="center"> 
          <input name="id[]" type="checkbox" id="id[]" value="">
		  <input name="infoid[]" type="hidden" value="">
          </div>
      </td>
      <td height="42"> <div align="center"> 1</div></td>
      <td height="25"> <div align="center"> 山善技术文章 </div></td>                        
      <td height="25"> <div align="center">dark_cgd</div></td>
      <td height="25"> <div align="center">2017-10-7</div></td>
      <td height="25"> <div align="center">25</div></td>
      <td height="25"> <div align="center">
          <a href="pc/main/xinximain/articleAdd.jsp">修改</a> | 
          <a href="pc/main/xinximain/articleAdd.jsp" onclick="return confirm('确认要删除？');">删除</a></div>            
      </td>
    </tr>
     <tr bgcolor="#FFFFFF" onmouseout="this.style.backgroundColor='#ffffff'" onmouseover="this.style.backgroundColor='#C3EFFF'"> 
      <td><div align="center"> 
          <input name="id[]" type="checkbox" id="id[]" value="">
		  <input name="infoid[]" type="hidden" value="">
          </div>
      </td>
      <td height="42"> <div align="center"> 1</div></td>
      <td height="25"> <div align="center"> 山善技术文章 </div></td>                        
      <td height="25"> <div align="center">dark_cgd</div></td>
      <td height="25"> <div align="center">2017-10-7</div></td>
      <td height="25"> <div align="center">25</div></td>
      <td height="25"> <div align="center">
           <a href="pc/main/xinximain/articleAdd.jsp">修改</a> | 
          <a href="pc/main/xinximain/articleAdd.jsp" onclick="return confirm('确认要删除？');">删除</a></div>            
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25"> <div align="center"> 
          <input type=checkbox name=chkall value=on onclick=CheckAll(this.form)>
        </div></td>
      <td height="25" colspan="7"><div align="center"> 
          <input type="submit" name="Submit3" value="多条删除" onclick="document.listform.enews.value='DelNews_all';document.listform.action='';">		 
        </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" colspan="8"> 
      　 </td>
    </tr>
  </table>
</form>
</body>
<script type="text/javascript">
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall')
       e.checked = form.chkall.checked;
    }
  }

function GetSelectId(form)
{
  var ids='';
  var dh='';
  for (var i=0;i<form.elements.length;i++)
  {
	var e = form.elements[i];
	if (e.name == 'id[]')
	{
	   if(e.checked==true)
	   {
       		ids+=dh+e.value;
			dh=',';
	   }
	}
  }
  return ids;
}

function PushInfoToSp(form)
{
	var id='';
	id=GetSelectId(form);
	if(id=='')
	{
		alert('请选择要推送的信息');
		return false;
	}
	window.open('');
}
</script>
</html>