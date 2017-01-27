<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bmap.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=1" />
    <link rel="stylesheet" type="text/css" href="css/my.css">
    
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/laydate.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
       
        .buttons{
            text-align:center;
            margin:auto;
        }
       #tableinfo{margin:100px auto; width:75%;}
	#btnmenu{float:left;}
	#set{padding-top:40px;}
	#cinfo{width:80%;margin:50px 10% 0 10%;background-color:pink;}
    .cinfo_k{margin-left:15%;text-align:left;background-color:pink;}
    .cinfo_v{margin-right:15%;text-align:right;background-color:pink;}
    </style>
    <title></title>
    <script type="text/javascript">
		function checkForm(form)
		{
			//var user=document.getElementById("username").value;
			//var pwd= document.getElementById("password").value;
			//alert(user+"|pwd:"+pwd);
			if(form.freetime.value=="")
			{
				alert("免费时间不能为空！");
            	form.freetime.focus();
            	return false;
			}
			else if(form.unittime.value=="")
        	{
            	alert("单位时间不能为空！");
            	form.unittime.focus();
            	return false;
        	}
        	else if(form.unittimefee.value=="")
        	{
            	alert("单位时间收费值不能为空！");
            	form.unittimefee.focus();
            	return false;
        	}
			else return true;
		}
		</script>
</head>
<body>
<!--LnyRpG5KzEHzzsvz4Hx8ICTv  26.336164,52.030018-->
<div class="space">
 <nav class="navbar navbar-inverse navbar-fixed-top mynav" role="navigation">
	<div class="navbar-header">
		<img  id="logo"  src="img/bike.jpg" width="168" height="75"/>

	</div>

		<!--<div id="navbar" class="collapse navbar-collapse">-->
		<div id="mnav">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="indexadmin.jsp">主页</a></li>
				<!-- <li><a href="qry_sta.action">站点信息</a></li>-->
				<li><a href="qryn.action">地图</a></li>
				<li id="usr" class="dropdown active">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		租赁管理
               		<!--<span class="caret"></span>-->
            	</a>
	            	<ul class="dropdown-menu" role="menu">
	               		<li><a href="RR.jsp">借还车记录</a></li>
	               		<li class="active"><a href="Bal.jsp">卡余额</a></li>
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
	               		<li><a href="bkqry.action">自行车状态监控</a></li>
	               		<li><a href="#">停车器查询监控</a></li>
	               		<li><a href="EventTrace.jsp">事件跟踪</a></li>
	               		<li><a href="#">设备故障监控</a></li>
	            	</ul>
         		</li>
         		
         		 
         		
				<li><a href="Guide.jsp">服务指南</a></li>
				
				
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
<br />
	<div class="slides">
		
			<a title="" target="_blank" href="#">
				<img width="100%" height="200" alt="" style="background: url(img/bikel.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		
	</div>
	
</div>
<!--<div class="form-group">
			<label class="col-xs-2 col-xs-offset-3 control-label">用户名</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" placeholder="Enter username"
					id="username" name="username">
			</div>
		</div>-->
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
	<div class="mtitle">卡余额查询</div>
  <!-- 输入卡号，点查询有余额-->
<form role="form" class="form-horizontal" action="QryBal.action" method="post">
		<!--onSubmit="return checkForm(this);"  -->
		<!--label占2格，input占10格，栅格一共12格-->
		<div class="form-group">
			<label class="col-xs-2 col-xs-offset-1 control-label">卡号</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" placeholder=""
					id="cardno" name="cardno">
			</div>
		</div>

			
			
		<!--使用栅格的移位，移动2格-->
		
		<div class="form-group">
			<div class="col-xs-2 col-xs-offset-3 mybuttons">
			<span id="login"><button type="submit" class="btn btn-default btn-lg"
				name="submit1" onclick="">查询</button></span> 
		
			<span ><button type="reset" class="btn btn-default btn-lg"
				name="reset1">重置</button></span>
			</div>
		</div>
		
		<!--<input type="submit" class="buttom" value="登录" name="submit1">
				<input type="reset" class="buttom" value="重置" name="reset1">-->
	</form>
	<div id="cinfo">
	    
      <!--<display:table name="${bikeinfo}" requestURI="bkqry.action" pagesize="2"  class="table table-striped table-hover">
      <display:column class="info" property="bkid" />
      <display:column class="info" property="bktype" />
      <display:column class="info" property="purchaseday" />
      <display:column class="info" property="cstatus"/>
      </display:table>-->
 	</div>
</div>
</div>    
<div id="last">
 <footer>
  ©2015:Bei Gao&nbsp;&nbsp;&nbsp;Soochow University
  </footer>
 </div>
</html>
<script type="text/javascript">
var result="<s:property value="#request.returnwords" />";//${requestScope.req}
alert(result);
if(result=="F")
{
	document.getElementById("cinfo").innerHTML="查询失败！请检查卡信息";
}
if(result=="S")
{
document.getElementById("cinfo").innerHTML="<div>卡号：${cardno}</div><div>余额:${bal}</div>";
}
/*var xmlhttp=null;
function showCustomer(str)
{
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if(null!=xmlhttp){
		xmlhttp.onreadystatechange=ajaxCallback;
		xmlhttp.open("GET",url+"?q="+str,true);
		//真正向服务器端发送数据  
// 使用post方式提交，必须要加上如下一行,get方法就不必加此句  
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
		xmlhttp.send(null);
  }
}

function ajaxCallback()
{//ajax回调函数
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("cinfo").innerHTML=xmlhttp.responseText;
    }
}*/
</script>