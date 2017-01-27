<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Login</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name=viewport content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background-image: url(img/orng.jpg);
	text-align: center;
	background-position: center;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

h1 {
	margin: 30px auto;
	width: 13%;
	padding: 5px;
	text-align: center;
	font-family: Kai;
	background: #fff;
	color: #1E7ACE;
}
#window{width:45%;height:55%;
align:center;text-align:center;
margin:0 auto 0 auto;background-color:lightblue;}
#frm{margin-top:30px;}
fieldset {
	margin: auto;
	padding: 0px;
	border: 10px solid #A4CDF2;
	background: #fff;
	width: 50%;
}

fieldset legend {
	color: #1E7ACE;
	font-weight: bold;
	width: 15%;
	padding: 3px 20px 3px 20px;
	border: 3px solid #A4CDF2;
	background: #fff;
	padding: 3px 20px 3px 20px
}

fieldset label {
	float: left;
	text-align: right;
	padding: 4px;
	margin: 1px;
}
/*
fieldset div {
	clear: left;
	margin-bottom: 2px;
	opacity: 0.8;
}*/
button {
	padding: 2px 10px;
	font-size: 12px;
	border: 1px #1E7ACE solid;
	background: #D0F0FF;
	
}

.mycheckbox {
	align: left;
	width:120px;
	padding:0;
	}
.mybuttons{
	width:250px;
}
#login{
	margin-right:25px; 
}

</style>

<script type="text/javascript">
		function checkForm(form)
		{
			//var user=document.getElementById("username").value;
			//var pwd= document.getElementById("password").value;
			//alert(user+"|pwd:"+pwd);
			
			if(form.username.value=="")
        	{
            	alert("用户名不能为空！");
            	form.username.focus();
            	return false;
        	}
        	else if(form.password.value=="")
        	{
            	alert("密码不能为空！");
            	form.password.focus();
            	return false;
        	}
			else return true;
		}
		</script>
</head>

<body>
<br>
<br>
<br>
<h4>登陆</h4>
<div id="window">
<ul id="myTab" class="nav nav-tabs">
   <li  class="active"><a href="#home" data-toggle="tab">
      我有账户</a>
   </li>
   <li><a href="#ios" data-toggle="tab">游客</a></li>
   
</ul>
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="home">
		<form id="frm" role="form" class="form-horizontal" action="login" method="post" onSubmit="return checkForm(this);">
	<!--  <fieldset>
	<legend>用户登录</legend>-->
		<!-- <fieldset class="col-md-6 col-md-offset-3">
			<legend>用户登录</legend> -->
		
		<!--label占2格，input占10格，栅格一共12格-->
		<div class="form-group">
			<label class="col-xs-2 col-xs-offset-3 control-label">用户名</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="Enter username"
					id="username" name="username">
			</div>
		</div>

		<div class="form-group">
			<label class="col-xs-2 col-xs-offset-3 control-label">密码</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" placeholder="Enter password"
					id="password" name="password">
			</div>
		</div>
	<!-- <div class="form-group">
			
			<label class="col-xs-2 col-xs-offset-3 control-label">身份</label>
				<div class="col-xs-3">
					<select class="form-control" name="type">
						<option></option>
						<option>用户</option>
						<option>管理员</option>
						
					</select>
				</div>
		</div>-->
		<!--使用栅格的移位，移动2格-->
		
		<div class="form-group">
			<div class="col-xs-2 col-xs-offset-4 mybuttons">
			<span id="login"><button type="submit" class="btn btn-default btn-md"
				name="submit1" >登陆</button></span> 
		
			<span ><button type="reset" class="btn btn-default btn-md"
				name="reset1">重置</button></span>
			</div>
		</div>
		
		<!--<input type="submit" class="buttom" value="登录" name="submit1">
				<input type="reset" class="buttom" value="重置" name="reset1">-->
			

	</form>
	<a href="index.jsp">您忘记密码?</a>&nbsp;&nbsp;&nbsp;  
      
   </div>
   <div class="tab-pane fade" id="ios">
    <div style="align:center;text-align:center;margin-top:25%;">
    <a href="indexusr.jsp">游客无需登录，直接点击即可进入  >></a>
   	</div>
   </div>
  
</div>
</div>
<script>
   $(function () {
      $('#myTab li:eq(1) a').tab('show');
   });
</script>

	
	<!-- <a href="regist.jsp">没有用户？注册一个</a>-->
	
</body>
</html>