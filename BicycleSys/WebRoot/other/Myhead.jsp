<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'Myhead.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
.nav
 > li:hover .dropdown-menu {display: block;}
body {
	background-image: url(img/d.jpg);
	filter:
		"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
	-moz-background-size: 100% 100%;
	background-size: 100% 100%;
	text-align: center;
	background-position: center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	padding-top:50px;
	padding-bottom:50px;
}
container{position:relative;width:100%;min-height:100%;}


h1 {
	margin: 2cm 4cm 0 4cm;
	color: #FF3366
}
.navbar-nav>li>a{
padding-top:10px;
}
.mynav{/*background-color:#000;9D9D9D B7FF4A*/}
#logo{margin:0 10px 0 0;padding:3px 5px 3px 20px;}
#navbar{padding:20px 0 0 0;margin-bottom:0; font-size:12pt;}
#navbar ul li{float:left;}
#myabout{
	width:400px;
	align:center;
}
.my{
float:left;
}

#navright{
	padding:15px 30px 0 0;
	color:#FFF;	
}
#navright a{
color:white;
text-decoration:underline;
}
.space{
height:30px;
width:100%;
}
footer{
    text-align:center;
	height:15px;
	width:100%;
	position:fixed;
	bottom:5px;}
}
</style>
  </head>
  
  <body>
 <nav class="navbar navbar-inverse navbar-fixed-top mynav" role="navigation">
	<div class="navbar-header">
		<!-- nav navbar-nav navbar-left -->
		<img  id="logo"  src="img/bike.jpg" width="168" height="75"/>
		<!-- <div class="navbar-header">-->
	</div>

		<div id="navbar" class="collapse navbar-collapse">
		
			<ul class="nav navbar-nav">
				<li><a href="qry_sta.action">站点信息</a></li>
				<li><a href="bmap.jsp">地图查看</a></li>
				<li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		用户信息
               		<span class="caret"></span>
            	</a>
            	<ul class="dropdown-menu" role="menu" id="myabout">
               		<li class="my"><a href="">借还车记录</a></li>
               		<li class="my"><a href="#">卡余额</a></li>
               		<!--<li class="divider"></li>-->
               		<li class="my"><a href="#">无卡借车</a></li>
            	</ul>
         		</li>
				<li><a href="#">自行车与环保</a></li>
				<li><a href="#">关于自行车系统</li>
			</ul>
			 
			<div id="navright" class="nav navbar-nav navbar-right">

               		<a href="regist.jsp">注册</a>
               		<span>|</span>
               		<a href="login.jsp">登陆</a>
           </div>
        </div> 		
         	
			
		</div>
	</div>
	</nav>
	<div class="space">
	</div>
  </body>
  <footer>
  ©2015:Bei Gao&nbsp;&nbsp;&nbsp;Soochow University
  </footer>
</html>