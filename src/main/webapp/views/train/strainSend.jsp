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
		<title>提交报名信息</title>
		<base href="<%=basePath%>">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/header.css"/>
		<link rel="stylesheet" type="text/css" href="css/calendar.css"/>
		<link rel="stylesheet" type="text/css" href="css/tj.css"/>
		<script src="js/jquery-1.7.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/uploadPreview.js" type="text/javascript" charset="utf-8"></script>
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
        		<div class="title">提交报名信息</div>
        		<span class="h-lt" style="cursor:pointer" onclick="window.history.go(-1)"><i class="h-bk"></i></span>
        		<a class="h-rt" href="#"></a>
    		</div>
		</header>
		<div class="section">
			<p class="title">
				
			</p>
			<p class="time"></p>
		</div>
		<ul class="infor">
			<!--<li>
				<span class="left">参与者</span>
				<input type="text" class="right" value="刘凤">
				<img src="img/right.png" class="righter"/>
			</li>-->
			<li>
				<span class="left">姓名</span>
				<input type="text" id="userName" class="right" value="">
			</li>
			<li>
				<span class="left">公司</span>
				<input type="text" class="right" id="company" value="">
			</li>
			<li>
				<span class="left">手机号</span>
				<input type="text" class="right" id="phone" value="">
			</li>
			
			<li>
				<span class="left">邮箱地址</span>
				<input type="text" class="right" id="email" value="">
			</li>
			<li>
				<span class="left">公司地址</span>
				<input type="text" class="right" id="provincesCities" value="">
			</li>
			<li>
				<span class="left">职位</span>
				<input type="text" class="right" id="positionName" value="">
				<!--<img src="img/right.png" class="righter"/>-->
				<!--<div class="slide">
					<div class="oss">
						软件工程师
					</div>
					<div class="oss">
						UI设计师
					</div>
				</div>-->
			</li>
			<li>
				<span class="left">部门</span>
				<input type="text" class="right" id="departmentName" value="">
				
				<!--<img src="img/right.png" class="righter"/>-->
				<!--<div class="slide">
					<div class="oss">市场部</div>
					<div class="oss">研发部</div>
				</div>-->
			</li>
			<li id="isNeedFreeLunch"">
				<span class="left">午餐</span>
				<span class="right"></span>
		           <img style="display:block;"  src="img/finish.png" class="finish"/> 
		
			</li>
			<li id="isNeedProvideAccommodation">
				<span class="left">住宿</span>
				<span class="right"></span>				
			        <img  style="display:block;" src="img/finish.png" class="finish"/> 			   
			</li>
			
		</ul>
		
		<div class="date">
			<!--<div class="na">
				<span>参加日期</span>
			</div>-->
			<div class="cand" id="isNeedJoinDate">
				<span>参加日期</span>
				<div class="right"></div>
				<img src="img/right.png" class="righter"/>
				<div class="slide">
					<div class="oss"></div>
					<!-- <div class="oss"></div> -->
				</div>
			</div>
		</div>
		<!--<div class="date">
			<!--<div class="na">
				<span>参加场次</span>
			</div>-->
			<!--<div class="cand">
				<span>选择场次</span>
				<div class="right">第一场</div>
				<img src="img/right.png" class="righter"/>
				<div class="slide">
					<div class="oss">第一场</div>
					<div class="oss">第二场</div>
				</div>
			</div>
		</div>-->
		
		<div class="date">
			<!--<div class="na">
				<span>活动信息来源</span>
			</div>-->
			<div class="cand" id="isNeedSource">
				<span>选择来源</span>
				<div class="right">网络</div>
				<img src="img/right.png" class="righter"/>
				<div class="slide">
					<div class="oss">网络</div>
					<div class="oss">朋友</div> 
				</div>
			</div>
		</div>
		
		<div class="date" id="isNeedPhoto">
			<div class="na">
				<span>上传图片</span>
			</div>
			
			<div class="oamg">
				<div class="omg">
						<div class="hh">
			            <input type="hidden" value=""  accept="image/*;capture=camera" name="pics" id="pics">
						<div class="oimg" id="img1">
							<img class="jj" src="img/jj.png" alt="">				<input type="file"   class="aimgs"/>
						</div>
			
		</div>

				</div>
			</div>
			
		</div>
		
		<div class="tj">
			<a href="javascript:void(0);" onclick="submit()">提交</a>
		</div>
		
		<div class="tta">
			<p>提交成功</p>
			<div class="btno">确定</div>
		</div>
		
		<div class="add">
		    <a href="javascript:void(0);" onclick="addEnrol()">+ 添加报名者</a>
		</div>
		
	</body>
	<script src="js/calendar.js"></script> 
<script type="text/javascript">
$(document).ready(function(){ 
	 function getUrlParam(name) {
		   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		   var r = window.location.search.substr(1).match(reg); //匹配目标参数
		   if (r != null) return unescape(r[2]); return null; 
		   }//返回参数值
		   var userId=getUrlParam('userId');
		   var token=getUrlParam('token');
		   var trainingCourseId=getUrlParam('trainingCourseId');	
		   //需要提交信息
		   $.ajax({
			   type:'get',
			   url:'activity/activityDetail',
			   data:"activityId="+activityId,
			   dataType:'json',
			   success:function(msg){
				   if(msg.code==200){
					  var data=msg.data;
					  var title=data.title==null?"":data.title;
					  var startTime=data.startTime==null?"":data.startTime;
					  var endTime=data.endTime==null?"":data.endTime;
					  //回填信息
					  $(".title").text(title);
					  $(".time").text(startTime+"~"+endTime);
					// 获取用户信息
					   $.ajax({
						   type:'get',
						   url:'user/getUserInfo',
						   data:{userId:userId,token:token},
						   dataType:'json',
						   success:function(msg){
							   if(msg.code==200){
								  var userData=msg.data;
								  var userName=userData.userName==null?"未填写":userData.userName;//姓名
								  var company=userData.company==null?"未填写":userData.company;//公司地址
								  var phone=userData.phone==null?"未填写":userData.phone;//手机号
								  var positionName=userData.positionName==null?"未填写":userData.positionName;//职位
								  var departmentName=userData.departmentName==null?"未填写":userData.departmentName;//部门
								  var email=userData.email==null?"未填写":userData.email;//邮箱
								  var provincesCities=userData.provincesCities==null?"未填写":userData.provincesCities;//邮箱
                                 
								  //公司
								  if(data.isNeedCompany==1){
									  $("#company").val(company);
									  $("#provincesCities").val(provincesCities);
								  }
								  if(data.isNeedCompany==0){
									  $("#company").parent().hide();
									  $("#provincesCities").parent().hide();
								  }
							  //是否午餐
								  if(data.isNeedFreeLunch==0){
									  $("#isNeedFreeLunch").hide();
								  }
								  //是否住宿
								  if(data.isNeedProvideAccommodation==0){
									  $("#isNeedProvideAccommodation").hide();
								  }
								  //选择日期场次
								  
								  if(data.isNeedJoinDate==1){
									  var customTime1=data.customTime1==null?"":data.customTime1;
									  var strs= new Array(); //定义一数组
									  strs=customTime1.split(","); //字符分割
									  for (i=0;i<strs.length ;i++ )
									  {
										  $("#isNeedJoinDate .slide").append("<div class='oss'>"+strs[i]+"</div>");
										  $("#isNeedJoinDate .slide").on("click","div",function(){
											   $(this).addClass('redd');
										    	var ww=$(this).text();
										    	$(this).parent().siblings('.right').text(ww);
										  });
									       //分割后的字符输出
									  } 
								  }
								  if(data.isNeedJoinDate==0){
									  $("#isNeedJoinDate").hide();
								  }
								  //选择来源
								  if(data.isNeedSource==0){
									  $("#isNeedSource").hide();
								  }
								  //选择照片
								  if(data.isNeedPhoto==0){
									  $("#isNeedPhoto").hide();
								  }
								  

							   }
						   }
					   })
									   }
				   
			   }
		   })
})
//是否午餐点击
$("#isNeedFreeLunch").click(function(){
      if($("#isNeedFreeLunch img" ).css("display")=="block"){
    	  $("#isNeedFreeLunch img").hide();
      }else{
    	  $("#isNeedFreeLunch img").show();
      }
})
//是否住宿点击
$("#isNeedProvideAccommodation").click(function(){
    if($("#isNeedProvideAccommodation img" ).css("display")=="block"){
  	  $("#isNeedProvideAccommodation img").hide();
    }else{
  	  $("#isNeedProvideAccommodation img").show();
    }
})
//提交报名
function  submit(){
	 $.ajax({
			type : "POST", //用POST方式传输
			contentType: "application/json; charset=utf-8", //数据格式:JSON
			type:"json", //数据格式:JSON
			url : 'enrol/saveOrupdate', //目标地址
			data : JSON.stringify(GetJsonData()),
			error: function(XMLHttpRequest){  
			     //alert( "Error: " + XMLHttpRequest.responseText);  
			   }  ,
			success : function(msg) {
				window.history.go(-1);
				}
				//发送验证返回信息
		});
}
function getUrlParam(name) {
	   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	   var r = window.location.search.substr(1).match(reg); //匹配目标参数
	   if (r != null) return unescape(r[2]); return null; 
	   }//返回参数值

//获取json数据
function GetJsonData() {	
	var userId=getUrlParam('userId');
	var token=getUrlParam('token');
	var fromType= 2;
	var fromId=getUrlParam('trainingCourseId');
	var company=$("#company").val();
	var userName=$("#userName").val();
	var phone=$("#phone").val();
	var email=$("#email").val();
	var companyAddress=$("#provincesCities").val();
    var positionName=$("#positionName").val();
    var departmentName=$("#departmentName").val();
    //是否午餐
    if($("#isNeedFreeLunch img").attr("style")=="display:block;"){
        var	freeLunch=1;
    }
    if($("#isNeedFreeLunch img").attr("style")=="display:none;"){
        var	freeLunch=0;
    }
    //是否住宿
    if($("#isNeedProvideAccommodation img").attr("style")=="display:block;"){
        var	provideAccommodation=1;
    }
    if($("#isNeedProvideAccommodation img").attr("style")=="display:none;"){
        var	provideAccommodation=0;
    }
    //参加日期
    var joinDate=$("#isNeedJoinDate .right").text();
    var source=$("#isNeedSource .right").text();  
    var json = {
    		userId:userId,
    		token:token,
    		fromType:fromType,
    		fromId:fromId,
    		company:company,
    		userName:userName,
    		phone:phone,
    		email:email,
    		companyAddress:companyAddress,
    		positionName:positionName,
    		departmentName:departmentName,
    		freeLunch:freeLunch,
    		provideAccommodation:provideAccommodation,
    		joinDate:joinDate,
    		source:source,
 };
 return json;
}
//添加报名者信息
function addEnrol(){ 
	   var userId=getUrlParam('userId');
	   var token=getUrlParam('token');
	   var trainingCourseId=getUrlParam('trainingCourseId');
	   window.location.href="views/train/strainSend.jsp?userId="+userId+"&token="+token+"&trainingCourseId="+trainingCourseId;
}
    $('#ca').calendar({
        width: 320,
        height: 320,
        data: [
			{
			  date: '2015/12/24',
			  value: 'Christmas Eve'
			},
			{
			  date: '2015/12/25',
			  value: 'Merry Christmas'
			},
			{
			  date: '2016/01/01',
			  value: 'Happy New Year'
			}
		],
        onSelected: function (view, date, data) {
            console.log('view:' + view)
            alert('date:' + date)
            console.log('data:' + (data || 'None'));
        }
    });

    $('#dd').calendar({
        trigger: '#dt',
        zIndex: 999,
		format: 'yyyy-mm-dd',
        onSelected: function (view, date, data) {
            console.log('event: onSelected')
        },
        onClose: function (view, date, data) {
            console.log('event: onClose')
            console.log('view:' + view)
            console.log('date:' + date)
            console.log('data:' + (data || 'None'));
        }
    });
    
    $('.infor li').click(function(){
    	$(this).children('.slide').slideToggle();
    })
    
    $('.slide div').click(function(){
    	$(this).addClass('redd');
    	var ww=$(this).html();
    	$(this).parent().siblings('.right').text(ww);
    })
    
     $('.cand').click(function(){
    	$(this).children('.slide').slideToggle();
    })
    
    $('.slide div').click(function(){
    	$(this).addClass('redd');
    	var ww=$(this).html();
    	$(this).parent().siblings('.right').text(ww);
    })
    
</script>
<script type="text/javascript">
	$('.tj').click(function(){
		$('.tta').show();
	})
	
	$('.tta .btno').click(function(){
		$('.tta').hide();
	})
	
		$('.oimg .jj').click(function(){
            var str=$("#pics").val();
            var val='|'+$(this).parent().find("input[type=hidden]").val();
            $("#pics").val(str.replace(val,""));
            $(this).parent().remove();
		});
		$("#licence_img").change(function(){
			var file = this.files[0];
            run(this, function (data) {
                  uploadImage(file.type,data);
             });
		});
        $("#other").change(function(){
            var val=getObjectURL(this.files[0]);
            $('.other').html('<img src="'+val+'" />');
        });

        $('.aimgs').change(function () {
            var id =$(this).parent();
			var file = this.files[0];
            run(this, function (data) {
                uploadImage1(file.type,data,id);
            });

           var val=getObjectURL(this.files[0]);
            $(this).parent('.oimg').append('<img src="'+val+'" class="pp"/>');
        });
        function run(input_file,get_data) {
        if (typeof (FileReader) === 'undefined') {
            alert("抱歉，你的浏览器不支持 FileReader，不能将图片转换为Base64，请使用现代浏览器操作！");
        }else{
            try {
                    var file = input_file.files[0];
                    if (!/image\/\w+/.test(file.type)) {
                        alert("请确保文件为图像类型");return false;
                        }
                    var reader = new FileReader();
                    reader.onload = function () {
						get_data(this.result);
                     };
                    reader.readAsDataURL(file);
                   }catch (e) {
                    alert('图片转Base64出错啦！' + e.toString())
            }
            }
           }
        function uploadImage1(token,img,id) {
            /*var imgPath = $("#licence_img").val();
            if (imgPath == "") {
                alert("请选择上传图片！");return;
            }
            var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
            if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {
                alert("请选择图片文件");return;
            }*/
            $.ajax({
                type: "POST",
                url:'article/upload',
                data:{token:token,file:img},
                cache: false,
                success:function(data) {
                   if(data.pic){
                       id.append('<input type="hidden" value="'+data.pic+'">');
                       var aa=$("#pics").val();
                       $('.oimg .jj').show();
                       var len=$('.hh .oimg').length;
                       if(len<5){
                           var html='<div class="oimg"><input type="file"  class="aimgs"/></div>';
                           $('.hh').append(html);
                       }
                       $('.aimgs').change(function () {
                           var id =$(this).parent();
						   var file = this.files[0];
                           run(this, function (data) {
                               uploadImage1(file.type,data,id);
                           });
                           var val=getObjectURL(this.files[0]);
                           $(this).parent('.oimg').append('<img src="'+val+'" class="pp"/><img class="jj" src="img/jj.png" alt="">');
                           $('.oimg .jj').click(function(){
                               var str=$("#pics").val();
                               var val='|'+$(this).parent().find("input[type=hidden]").val();
                               $("#pics").val(str.replace(val,""));
                               $(this).parent().remove();
                           });

                       });
                   }
                }
            });
        }
     function uploadImage(token,img) {
         var imgPath = $("#licence_img").val();
         if (imgPath == "") {
               alert("请选择上传图片！");return;
          }
         var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
         if (strExtension !='jpeg'&& strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {
            alert("请选择图片文件");return;
            }
         $.ajax({
             type: "POST",
             url:"/site/upload_licence",
             data:{token:token,file:img},
             dataType:'json',
             success:function(data) {
                 $(".inp img").attr('src','http://'+window.location.host+'/'+data.pic);
                 $("#licence").val(data.pic);
               },error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("网络延迟");
                }
            });
    }
		function getObjectURL(file) {
			var url = null ;
			if (window.createObjectURL!=undefined) { // basic
				url = window.createObjectURL(file) ;
			} else if (window.URL!=undefined) { // mozilla(firefox)
				url = window.URL.createObjectURL(file) ;
			} else if (window.webkitURL!=undefined) { // webkit or chrome
				url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
		}
		

	</script>

</html>
