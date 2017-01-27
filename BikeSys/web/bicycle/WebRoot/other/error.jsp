<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'error.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
<script type=”text/javascript” src=”https://cdn.goeasy.io/goeasy.js”></script>-->
<script type=”text/javascript” src=”js/goeasy.js”></script>
  </head>
  
  <body>
   <h3>注册失败！对不起，您的用户已存在！</h3>
   <a href="login.jsp">已有账户登陆</a>
 <!--<form action=”” method=”post” id=”Login”>
 <fieldset>
  <legend>用户登录</legend>
  <div>
   <label for=”Name”>用户名</label>
   <input type=”text” name=”Name” id=”Name” size=”18″ maxlength=”30″ /><br />
  </div>
  <div>
   <label for=”password”>密码</label>
   <input type=”password” name=”password” id=”password” size=”18″ maxlength=”15″ /><br />
  </div>
  <div class="cookiechk">
   <label><input type="checkbox" name="CookieYN" id="CookieYN" value="1" /> <a href=”#” title=”选择是否记录您的信息”>记住我</a></label>
   <input name="login" type="submit" class="buttom" value="登录" />
  </div>
  <div class="forgotpass"><a href="#">您忘记密码?</a></div>
 </fieldset>
 </form><br />-->
 
  </body>
</html>
<script type="text/javascript">
   var goEasy = new GoEasy({
                            appkey: 'e3d9349d-5116-447f-aad2-edc529c98c3f'
                        });
  goEasy.subscribe({
                        channel: 'your_channel',
                        onMessage: function(message){  //自动接收推送信息                           
                               //document.getElementById("event").innerHTML='<div>'+message.content+'</div>';
                               alert('Meessage received:'+message.content);
                        }
               });
</script>