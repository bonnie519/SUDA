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
    <title>My JSP 'bikein.jsp' starting page</title>
    
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
	#fm{margin-top:50px;margin-bottom:40px;}
    </style>
    <title></title>
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
         		<li id="devm" class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
         		网点基础管理</a>
         			<ul class="dropdown-menu" role="menu" ><!-- id="myabout" -->
	               		<li  class="active"><a href="bikein.jsp">自行车管理</a></li><!-- class="my" -->
	               		<li><a href="">停车器管理</a></li>
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

<!--<div class="form-group">
			<label class="col-xs-2 col-xs-offset-3 control-label">用户名</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" placeholder="Enter username"
					id="username" name="username">
			</div>
		</div>-->
<div id="banner_tabs" class="flexslider">
<br />
	<div class="slides">
		
			<a title="" target="_blank" href="#">
				<img width="100%" height="200" alt="" style="background: url(img/bikel.jpg) no-repeat center;" src="img/alpha.png">
			</a>
		
	</div>
	
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
自行车管理添加
</div>
<!--<form action="bikein_mang.action" method="post" role="form">-->
<form role="form" class="form-horizontal" action="bikein_mang.action" method="post" onSubmit="return checkForm(this);">
		<!--label占2格，input占10格，栅格一共12格-->
	<div class="form-group" >
		<label class="col-xs-2 col-xs-offset-3 control-label">购买日期：</label>
		<div class="col-xs-3">
			<input class="laydate-icon" id="purchased" name="pd">
		</div>			
	</div>
	<div class="form-group" >
			<label class="col-xs-2 col-xs-offset-3 control-label">车型：</label>
			<div class="col-xs-3">
				<select name="type" id="type" >
					<option></option>
					<option>普通</option>
					<option>捷安特</option>
					<option>山地</option>
				</select>
			</div>			
		</div>
	<div class="form-group" >
		<label class="col-xs-2 col-xs-offset-3 control-label">车物理号：</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" id="bpid" name="bpid">
			</div>			
	</div>
	<div class="form-group" >
		<div class="col-xs-2 col-xs-offset-5 mybuttons">
			<button type="submit" class="btn btn-default"
				name="submit1" >入库</button> 
		</div>
	</div>
</div>
</form>	
<!--
      <div id="tableinfo">
     <display:table name="${rentr}" requestURI="QryRr_info.action" pagesize="2" export="true" class="table table-hover">
      <display:column class="info" property="rdate" />
      <display:column class="info" property="district" />
      <display:column class="info" property="userid" />
      <display:column class="info" property="station" />
      <display:column class="info" property="bkid" />
      <display:column class="info" property="status" />
    </display:table>
    </div>-->
    </div>
</div>
  <div id="last">
  	<footer>
  		©2015:Bei Gao&nbsp;&nbsp;&nbsp;Soochow University
  	</footer>
  </div>
  </body>
</html>
<script type="text/javascript"">
!function(){
        laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#purchased'});//绑定元素
        //laydate({elem: '#end'});//绑定元素
    }();

    //日期范围限制
    var pd = {
        elem: '#purchased',
        format: 'YYYY-MM-DD',
        min: '2000-01-01', //设定最小日期为当前日期
        max: laydate.now(), //最大日期
        istime: true,
        istoday: false
    };
    laydate(pd);
var result="<s:property value="#request.returnwords" />";//${requestScope.req}
if(result!="")
alert(result);
</script>