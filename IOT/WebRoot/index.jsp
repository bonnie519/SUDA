<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
     
  </head>
  
  <body>
  <script>
      function login()
      {
          var frm=document.getElementById("myform");
          frm.action="login/user_login";
          frm.submit();
      }
      function register()
      {
          var frm=document.getElementById("myform");
          frm.action="User_register.jsp";
          frm.submit();
      }
  </script>
  <div>
         &nbsp;
         &nbsp;
          <h1 align="center"><font color="#FF6600">无线传感网环境数据收集系统<font></h1>
         &nbsp;
         &nbsp;
         
   </div>
   <form action="login/user_login" method="post" id="myform">
   <div align="center">
   <div>
   <font color="#FF6600" size="5">用户名&nbsp;:&nbsp;&nbsp;</font><input type="text" name="name" style="width:290px;"></div>
   <p></p>
   <div>
   <font color="#FF6600" size="5">密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;&nbsp;</font><input type="text" name="password" style="width:290px;"></div>
    <p></p>
   <div>
   <font color="#FF6600" size="5">密码确认&nbsp;:&nbsp;&nbsp;</font><input type="text" name="confirm" style="width:280px;"></div>
   <p></p>
   </div>
   
   <p></p>
   <p></p>
   <p></p>
   <p></p>
  <div align="center">
  <input type="submit" value="登录" style="height:40;width:70px" onclick="login()"/>&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="submit" value="注册" style="height:40;width:70px" onclick="register()"/>
  </div>
   </form>
  </body>
</html>
