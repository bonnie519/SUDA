<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
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
<script type="text/javascript" src="js/goeasy.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type=”text/javascript” src=”https://cdn.goeasy.io/goeasy.js”></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/my.css">

<style type="text/css">
footer{text-align:center;}
/*<script>    
$('li.dropdown').mouseover(function(){
   $(this).addClass('open');}).mouseout(function(){
   $(this).removeClass('open');}); 

</script>*/
body{font-family:"微软雅黑";}
#mmm{width:100%;height:500px;float:left;margin-top:20px;margin-left:30px;}
</style>
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
				<li ><a href="indexadmin.jsp">主页</a></li>
				<!-- <li><a href="qry_sta.action">站点信息</a></li>-->
				
				<li id="usr" class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		租赁管理
               		<!--<span class="caret"></span>-->
            	</a>
	            	<ul class="dropdown-menu" role="menu">
	               		<li><a href="RR.jsp">借还车记录</a></li>
	               		<li><a href="Bal.jsp">卡余额</a></li>
	               		<li><a href="feeset.jsp">费率设置</a></li>
	               		<!--<li class="divider"></li>-->
	               		<li><a href="qry_sta.action">站点信息</a></li>
	            	</ul>
         		</li>
         		<li id="devm" class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
         		网点基础管理</a>
         			<ul class="dropdown-menu" role="menu" ><!-- id="myabout" -->
	               		<li ><a href="bikein.jsp">自行车管理</a></li><!-- class="my" -->
	               		<li><a href="#">停车器管理</a></li>
	               		<li><a href="#">分区管理</a></li>
	            	</ul>
         		</li>
         		<li id="devq" class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
         		监控调度</a>
         			<ul class="dropdown-menu" role="menu">
         				<li><a href="qryn.action">网点动态地图</a></li>
	               		<li><a href="bkqry.action">自行车状态监控</a></li>
	               		<li><a href="#">停车器查询监控</a></li>
	               		<li class="active"><a href="EventTrace.jsp">事件跟踪</a></li>
	               		<li><a href="#">设备故障监控</a></li>
	            	</ul>
         		</li>
         	</ul>
			<ul  class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="">
            	<span class="dropdown-toggle" data-toggle="dropdown">
               		<s:property value="#session.username" />&nbsp;
               		<span class="caret"></span>
            	</span></a>
	            	<ul class="dropdown-menu" role="menu">
	               		<li><a href="">账户设置</a></li>
	               		<li class="divider"></li>
	               		<li><a href="logout">退出</a></li>
	            	</ul>
         		</li>
			</ul> 	
         		
         		
				
				
				
			
			<!--<div id="navright" class="nav navbar-nav navbar-right" >
					<s:property value="#session.username" />
               		<a href="regist.jsp">注册</a>
               		<span>|</span>
               		<a href="login.jsp">登陆</a>
               		
               		
           </div>-->
        </div> 		
		</div>
	</div>
	</nav>
</div>

<div id="banner_tabs" class="flexslider">
	<ul class="slides">
		<li>
			<a title="" target="_blank" href="#">
				<img width="1360" height="200" alt="" style="background: url(img/bikel.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		</li>
		<li>
			<a title="" href="#">
				<img width="1360" height="337" alt="" style="background: url(img/mmap.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		</li>
		<li>
			<a title="" href="#">
				<img width="1360" height="200" alt="" style="background: url(img/mybikes.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		</li>
	</ul>
	<ul class="flex-direction-nav">
		<li><a class="flex-prev" href="javascript:;">Previous</a></li>
		<li><a class="flex-next" href="javascript:;">Next</a></li>
	</ul>
	<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
		<li><a>1</a></li>
		<li><a>2</a></li>
		<li><a>3</a></li>
	</ol>
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
    	<div class="mtitle">事件跟踪</div> 
    	
		<div id="mmm">
		<!--<table class="table" style="width:70%;margin:auto;">
		<thead>
		<tr>
			<th>事件</th>
			<th>卡号</th>
			<th>站点号</th>
			<th>车位</th>
			<th>结果</th>
			<th>日期</th>
		</tr>
		</thead>
		<tbody id="evnt">
		</tbody>
		</table>-->
		</div>
    	
   </div>
</div>

<div id="last">
 <footer>
  ©2015:Bei Gao&nbsp;&nbsp;&nbsp;Soochow University
  </footer>
</div>
</body>
</html>
<script type="text/javascript">
   var goEasy = new GoEasy({
                            appkey: 'e3d9349d-5116-447f-aad2-edc529c98c3f'
                        });
  goEasy.subscribe({
                        channel: 'your_channel',
                        onMessage: function(message){  //自动接收推送信息                           
                               document.getElementById("mmm").innerHTML+=message.content+'<br />';
                        }
               });
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


/*var tt = 3;  
function timego(){
tt--; 
 document.getElementById("tt").innerHTML = tt;
 if(tt==0)
 {window.location.href="indexadmin.jsp";return false; }  
}  
var timer = window.setInterval("timego()",1000);  */
</script>