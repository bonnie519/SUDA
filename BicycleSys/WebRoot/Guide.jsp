<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/my.css">

<style type="text/css">
body{font-family:"微软雅黑";}
footer{text-align:center;}
</style>
<!--<script>    
$('li.dropdown').mouseover(function(){
   $(this).addClass('open');}).mouseout(function(){
   $(this).removeClass('open');}); 

</script>-->
</head>

<body>
<div class="space">
 <nav class="navbar navbar-inverse navbar-fixed-top mynav" role="navigation">
	<div class="navbar-header">
		<img  id="logo"  src="img/bike.jpg" width="168" height="75"/>

	</div>

		<!--<div id="navbar" class="collapse navbar-collapse">-->
		<div id="mnav">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="indexusr.jsp">主页</a></li>
				<!-- <li><a href="qry_sta.action">站点信息</a></li>-->
				<li><a href="qrynn.action">网点地图</a></li>
				<li  class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		租赁信息
               		<!--<span class="caret"></span>-->
            	</a>
	            	<ul class="dropdown-menu" role="menu">
	               		<li><a href="uRR.jsp">借还车记录</a></li>
	               		<li><a href="uBal.jsp">卡余额</a></li>
	               			               	
	               		
	            	</ul>
         		</li>
         		<li class="active"><a href="Guide.jsp">服务指南</a></li>
				
				<li><a href="#">关于</li>
				
			</ul>
			
			<!--<li id="usr" class="dropdown">
	            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               		租赁管理
	               		
	            	</a>
		            	<ul class="dropdown-menu" role="menu">
		               		<li><a href="RR.jsp">借还车记录</a></li>
		               		<li><a href="Bal.jsp">卡余额</a></li>
		               		
		               		<li><a href="qry_sta.action">站点信息</a></li>
		            	</ul>
	         		</li> -->
			
			<ul  class="nav navbar-nav navbar-right">
				<li class="navbar-text">
               		登录
         		</li>
			</ul> 
			
        </div> 		
		</div>
	</div>
	</nav>
</div>
<div id="banner_tabs" class="flexslider">
<br />
	<div class="slides">
		
			<a title="" target="_blank" href="#">
				<img width="100%" height="200" alt="" style="background: url(img/bikel.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		
	</div>
	
</div>
	<!--<div class="container">-->
<div class="starter">
    <div id="lef">
        公告栏<br />
    <ul>
    <li>x月x日xx站点停运通知</li>
    <li>xx领导检查通知</li>
    <li>放假通知</li>
    <li>春节放假通知</li>
    <li>国庆放假通知</li>
    <li>端午放假通知</li>
    <li>五一放假通知</li>
    <li>清明放假通知</li>

    </ul>
    </div>
     	
    <div id="rig">
    <div class="mtitle">
 	服务指南
   </div> 
    	<h1>服务指南</h1>
	<div style="margin-left:10%;">
		<div>
		如何办卡
		<ol>
		<li>年龄在18周岁以上，70周岁以下</li>
		<li>携带身份证办理，外地居民只可办理临时卡，本地居民办理个人卡</li>
		<li>办卡(交押金并充值)
			<ul>
				<li>个人卡：押金80元，充值任意金额（大于0）</li>
				<li>临时卡：押金150元，充值任意金额（大于0）</li>
			</ul>
		</li>
		<li>填写申请表并签字确认</li>
		<li>领取卡</li>
		</ol>
		</div>
    	<br />
		<div>
		办卡地点
			<ol>
				<li>沧浪区十梓街2号</li>
				<li>沧浪区十梓街20号</li>
				<li>沧浪区十梓街200号</li>
				<li>沧浪区十梓街120号</li>
			
			</ol>
		</div>
	    <div>
	    借还车流程
	    </div>
	    	<div style="float:left;width:40%;">借车
	    	<ol>
	    		<li>将借车卡平放在公共自行车锁止器刷卡区上刷卡</li>
	    		<li>听到语音提醒后，在20秒内将车拉出</li>
	    	</ol>
	    	</div>
	    	<div style="float:left;width:40%;margin-bottom:5%;">
	    	<img  src="img/borrow1.png" width="40%" />
	    	<img  src="img/borrow2.png" width="40%"/>
	    	</div>
	    	
	    	<div style="float:left;width:40%;">还车
	    	<ol>
	    		<li>将公共车推入锁止器</li>
	    		<li>将借车卡平放在刷卡区内5秒左右</li>
	    		<li>听到语音提示后，将卡收回</li>
	    	</ol>
	    	</div>
	    	<div style="float:left;width:40%;">
	    	<img  src="img/borrow3.png" width="40%"/>
	    	<img  src="img/borrow4.png" width="40%"/>
	    	</div>
	    
	</div>

   </div>
<div id="last">
 <footer>
  ©2015:Bei Gao&nbsp;&nbsp;&nbsp;Soochow University
  </footer>
 </div>
  </div>
</body>
</html>
<script type="text/javascript">
$(function() {
	var bannerSlider = new Slider($('#banner_tabs'), {
		time: 5000,
		delay: 400,
		event: 'hover',
		auto: true,
		mode: 'fade',
		controller: $('#bannerCtrl'),
		activeControllerCls: 'active'
	});
	$('#banner_tabs .flex-prev').click(function() {
		bannerSlider.prev()
	});
	$('#banner_tabs .flex-next').click(function() {
		bannerSlider.next()
	});
})
</script>