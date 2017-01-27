<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="other/Myhead.jsp" %>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body 
{

background-image:url(img/d.jpg);filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";  
-moz-background-size:100% 100%;  
    background-size:100% 100%;  
text-align:center;
background-position: center; 
background-attachment:fixed;
background-repeat: no-repeat;
}
h1
{
margin:2cm 4cm 0 4cm;
color:#FF3366
}
</style>
</head>
  
  <body>
 
   <h1>Welcome!!!!</h1>
   <!-- <div>${username}</div> -->
   <div>
   对不起！您输入的用户信息有误，登录失败！
   <!--<s:property value="#session.username"/> -->
    </div>
    <!--<a href="user/hell!hello">Hello</a>-->
    <a href="regist.jsp">注册</a>
    <a href="login.jsp">登录</a>
    <!--    <form action="useradd" method="post">
    用户名：<input type="text" name="username" /><br />
    <input type="submit" class="buttom" value="登录" name="submit1">
    </form>  -->

  </body>
</html>

