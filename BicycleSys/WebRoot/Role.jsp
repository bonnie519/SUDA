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
    
    <title>My JSP 'Role.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/my.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-select.css">
	
    
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/laydate.js"></script>
	<script type="text/javascript" src="js/slider.js"></script>
	<script src="js/bootstrap-select.js"></script>
  	
	
	<style type="text/css">
	#rfrm{align:center;text-align:center;}
	#user{align:center;text-align:center;width:80%;border:fixed;margin:0 auto 0 auto;}
	#role{text-align:left; width:20%;margin:20px auto;border:fixed;}
	#func{float:left; width:20%;margin-right:2%;background-color:pink;}
	#selectuser{align:right;text-align:right;}
	.selectpicker{width:100%;background-color:pink;}
	#buttons{}
	.mcheck{width:18px;height:18px;}
	body{font-family:"微软雅黑";}
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
         		<li id="devq" class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
         		监控调度</a>
         			<ul class="dropdown-menu" role="menu">
         				<li><a href="qryn.action">网点动态地图</a></li>
	               		<li><a href="bkqry.action">自行车状态监控</a></li>
	               		<li><a href="#">停车器查询监控</a></li>
	               		<li><a href="EventTrace.jsp">事件跟踪</a></li>
	               		<li><a href="#">设备故障监控</a></li>
	            	</ul>
         		</li>
         		
         		
         		<li class="active"><a href="Role_Qry.action">人员管理</a></li>
				
				<li><a href="#">关于</li>
				
			</ul>
			<ul  class="nav navbar-nav navbar-right">
				<li class="dropdown">
            	<span class="dropdown-toggle" data-toggle="dropdown">
               		<s:property value="#session.username" />&nbsp;
               		<span class="caret"></span>
            	</span>
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
			<a title="" target="_blank" href="index.jsp">
				<img width="1360" height="200" alt="" style="background: url(img/bikel.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		</li>
		<li>
			<a title="" href="qryn.action">
				<img width="1360" height="337" alt="" style="background: url(img/mmap.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		</li>
		<li>
			<a title="" href="RR.jsp">
				<img width="1360" height="200 alt="" style="background: url(img/mybikes.jpg) no-repeat center;" src="img/alpha.png">
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
人员管理
</div>
		<form action="Role_Set" method="get" id="rfrm" role="form">
			<div id="user" class="form-group">
			<!-- 请选择您要设置的用户&nbsp;&nbsp;-->
			<select class="selectpicker" title="请选择您要设置的用户" name="user">	
			<s:iterator value="client" >
				<option>
					<s:property />
				</option>
			</s:iterator>
			</select>
	<!-- 		<ul>
			<s:iterator value="client" >
			<li>
			<s:property />
			</li>
			</s:iterator>
			</ul>-->
			</div>
		
		<div id="role" class="checkbox ">
		<s:iterator value="role">
			<label ><input type="checkbox" name="checkbox" class="mcheck" />
			<s:property />
			</label><br />
		</s:iterator>
		</div>
		<div id="buttons">
			<button class="btn btn-default" type="submit">设置</button>
			<button class="btn btn-default" type="reset" onclick="set()">取消</button>
		</div>
		
		</form>
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
  var user=document.getElementById('usr');
  //	var ul = document.getElementById('parent');
	var lis = user.getElementsByTagName('li');
	for(var i=0;i<lis.length;i++){
    	lis[i].onclick = function(){
    		if(this.style.background!="white")
        	this.style.background="white";
        	else
        	this.style.background="pink";
        	//alert(this.innerHTML);
    	}
	}
  function set()
  {
  	
  }
/*window.onload=function()//用window的onload事件，窗体加载完毕的时候
{
var s="<s:property value="#session.username" />";//${username}
var t="${type}";
alert(s);
if(s=="")
{
document.getElementById("devm").remove();
document.getElementById("devq").remove();
document.getElementById("fees").remove();
document.getElementById("usr").remove();
}
if(s!="" && t=="用户")
{
document.getElementById("devm").remove();
document.getElementById("devq").remove();
document.getElementById("fees").remove();
}
}
*/

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