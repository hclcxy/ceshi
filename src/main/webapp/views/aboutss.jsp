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
		<title>关于山善</title>
		<base href="<%=basePath%>">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/header.css"/>
		<link rel="stylesheet" type="text/css" href="css/aboutss.css"/>
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
        		<div class="title">关于山善</div>
        		<span class="h-lt" style="cursor:pointer" onclick="window.history.go(-1)"><i class="h-bk"></i></span>
        		<a class="h-rt" href="#"></a>
    		</div>
		</header>
		<div class="section">
			<div class="logo">
				<img src="img/logo.png"/>
			</div>
			<div class="into">
				<div class="left">
					<a href="javascript:;" class="red">公司介绍</a>
				</div>
				<div class="center">
					<a href="javascript:;">技术服务团队</a>
				</div>
				<div class="right">
					<a href="javascript:;">联系方式</a>
				</div>
			</div>
			
			<div class="otext">
				<div class="oimg">
					<img src="img/u86.png"/>
				</div>
				<p class="title">株式会社山善</p>
				<p class="zw">
					株式会社山善1947年在日本创建，是有着60多年历史的机械类国际专业化综合商社，也是日本机械行业中最大的商社之一。在这几十年内已将业务范围扩展到全世界各个地方，目前有海外支社5处，现地法人公司14家。 日本总部基于中国经济持续增长的考虑，为扩大在中国的业务范围，于2001年12月在中国广东省深圳市设立了山善深圳代表处，并于2005年12月成立了全资子公司山善（深圳）贸易有限公司。
				</p>
			</div> 
			
			
			
			<div class="otexb">
				<p class="title">株式会社山善</p>
				<p class="zw">
					株式会社山善1947年在日本创建，是有着60多年历史的机械类国际专业化综合商社，也是日本机械行业中最大的商社之一。在这几十年内已将业务范围扩展到全世界各个地方，目前有海外支社5处，现地法人公司14家。 日本总部基于中国经济持续增长的考虑，为扩大在中国的业务范围，于2001年12月在中国广东省深圳市设立了山善深圳代表处，并于2005年12月成立了全资子公司山善（深圳）贸易有限公司。
				</p>
			</div> 
			
			<div class="phone">
				<div class="call">
				<div class="big">
					<div class="left">
						<div class="oimg"></div>
						<span>公司地址</span>
					</div>
					<div class="right">
						<span>中国 上海 上海市长宁区 仙霞路 88号太阳广场</span>
					</div>
				</div>
				<div class="big">
					<div class="left">
						<div class="oimg"></div>
						<span>联系电话</span>
					</div>
					<div class="right">
						<span>86-021-62700515</span>
					</div>
				</div>
				
				<!--<div class="big">
					<div class="left">
						<div class="oimg"></div>
						<span>邮箱</span>
					</div>
					<div class="right">
						<span>hello@yamazengsh.com</span>
					</div>
				</div>-->
				
			</div>
			
			<div class="call">
				<div class="big">
					<div class="left">
						<div class="oimg"></div>
						<span>公司地址</span>
					</div>
					<div class="right">
						<span>中国 上海 上海市长宁区 仙霞路 88号太阳广场</span>
					</div>
				</div>
				<div class="big">
					<div class="left">
						<div class="oimg"></div>
						<span>联系电话</span>
					</div>
					<div class="right">
						<span>86-021-62700515</span>
					</div>
				</div>
				
				<!--<div class="big">
					<div class="left">
						<div class="oimg"></div>
						<span>邮箱</span>
					</div>
					<div class="right">
						<span>hello@yamazengsh.com</span>
					</div>
				</div>-->
				
			</div>
			
			
			</div>
			
			
			
			
		</div>
	</body>
	<script type="text/javascript">
		$('.into .left').click(function(){
			$('.otext').show();
			$('.phone').hide();
			$('.otexb').hide();
			$(this).children('a').addClass('red');
			$('.into .right a').removeClass('red');
			$('.into .center a').removeClass('red');
		})
		
		$('.into .right').click(function(){
			$('.otext').hide();
			$('.otexb').hide();
			$('.phone').show();
			$(this).children('a').addClass('red');
			$('.into .left a').removeClass('red');
			$('.into .center a').removeClass('red');
		})
		
		$('.into .center').click(function(){
			$('.otext').hide();
			$('.otexb').show();
			$('.phone').hide();
			$(this).children('a').addClass('red');
			$('.into .left a').removeClass('red');
			$('.into .right a').removeClass('red');
		})
	</script>
</html>
