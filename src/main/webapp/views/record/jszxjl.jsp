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
		<meta charset="UTF-8">
		<title>技术咨询记录</title>
		<base href="<%=basePath%>">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/header.css"/>
		<link rel="stylesheet" type="text/css" href="css/history.css"/>
		<script src="js/jquery-1.7.1.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<script type="text/javascript">
		    (function (doc, win) {
        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if(clientWidth>=640){
                    docEl.style.fontSize = '27px';
                }else{
                    docEl.style.fontSize = 27 * (clientWidth / 640) + 'px';
                }
            };

        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);

	</script>
	<body>
		<header>
    		<div class="head">
        		<div class="title">技术咨询记录</div>
        		<span class="h-lt" style="cursor:pointer" onclick="window.history.go(-1)"><i class="h-bk"></i></span>
        		<a class="h-rt" href="#"></a>
    		</div>
		</header>
		<ul class="oul">
				
			</ul>
	</body>
	<script type="text/javascript">
	$(document).ready(function(){ 
		var token= localStorage.getItem("c_token")
		var userId= localStorage.getItem("userId");	
		$.ajax({
			type : "GET", //用GET方式传输
			dataType : "json", //数据格式:JSON
			url : 'faultRepair/faultRepairList', //目标地址
		    data :{
		    	userId:userId,
		    	token:token
		    },
			success : function(msg) {
				var datas=msg.data.list;
				for(var i in datas){
					$(".oul").append("<li class='now'>"+
							"<a name='"+data[i].id+"'>"+
								"<div class='right'>"+
									"<p class='title'>"+
										"<span class='size'>王霞</span>"+
										"<span class='time'>21:55</span>"+
									"</p>"+
									"<p class='zw'>培训详情培训详情培训详情培训详情培训详情</p>"+
								"</div></a></li>");			
				}				
				 $.ajax({
						type : "GET", //用GET方式传输
						dataType : "json", //数据格式:JSON
						url : 'user/getUserInfo', //目标地址
						//data : "dealType=" + dealType + "&uid=" + uid + "&code=" + code,
						data : {userId:userId,token:token},
						success : function(msg) {	
							if(msg.code==100){
								if(msg.msg=="登录信息失效,请重新登录"){
									alert(msg.msg);
									window.location.href="views/login.jsp";
								}
								
							}
							if(msg.code==200){
								//跳转地址区分
								 $(".oul a").each(function(){
										 var repairId=$(this).attr("name");
										 $(this).attr({href:"views/record/jszxjl2.jsp?repairId="+repairId});
									
								 });
							}
						}
				 });
			}
		});
	}); 

    </script>
</html>
